package com.dalbit.common.view;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dalbit.util.DalbitUtil;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFDataFormat;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.view.document.AbstractXlsView;

public class ExcelExportView extends AbstractXlsView {
	
	private Logger logger = LoggerFactory.getLogger(ExcelExportView.class);
	
	public ExcelExportView(){
		//this.setContentType("application/octet-stream");
	}

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook wb, HttpServletRequest request, HttpServletResponse response) throws Exception {

		String fileName = getFileName(model) + ".xls";
		Object sheetNamesObj = model.get("sheetNames");
		
		setFileNameToResponse(request, response, fileName);
		
		
		//단일 시트일 경우
		if(sheetNamesObj instanceof String){
			try {
				String sheetName = sheetNamesObj.toString();
				String[] title = (String[]) model.get("columns");
				List values = (List)model.get("values");
				createSheet((HSSFWorkbook)wb,sheetName,title,values);
			} catch(Exception e) {
				logger.debug("단일 시트 오류!! >> "+e.getMessage());
				e.printStackTrace();
				//logger.debug("단일 시트 오류!! >> "+);
			}
		}
		//다중시트일 경우
		else if (sheetNamesObj instanceof String[]){
			try {
				String[] sheetNames = (String[])sheetNamesObj;
				String[][] titles = (String[][]) model.get("columns");
				List<List<Map>> values = (List<List<Map>>) model.get("values");
				for(int i = 0 ; i < sheetNames.length ; i++){
					String sheetName = sheetNames[i];
					createSheet((HSSFWorkbook)wb,sheetName,titles[i],values.get(i));
				}
			} catch(Exception e) {
				logger.debug("다중 시트 오류!! >> "+e.getMessage());
			}
		}else{
			ModelAndView mv = new ModelAndView();
			mv.setView(new MessageView("", "history.back();", ""));
			throw new ModelAndViewDefiningException(mv);
		}
		
	}	

	private void createSheet(HSSFWorkbook wb, String sheetName, String[]columns, List values){
		HSSFCellStyle titleStyle = getTitleStyle(wb);
		HSSFCellStyle cellStyle = getCellStyle(wb);
		HSSFDataFormat format = (HSSFDataFormat) wb.createDataFormat();

		HSSFSheet sheet = wb.createSheet(sheetName);
		int rowNum = 0 ;
		HSSFRow hrow = sheet.createRow(rowNum);
		hrow.setHeight((short)660);

		for(int i = 0 ; i < columns.length ; i ++){
			createCell(hrow,titleStyle, format, columns[i], i);
		}
		rowNum++;		
		
		for(int i = 0 ; i < values.size() ; i ++){
			hrow = sheet.createRow(rowNum);
			hrow.setHeight((short)500);
			Object[] objectData = (Object[]) values.get(i);
			for(int j = 0 ; j < columns.length; j++){
				Object val = objectData[j];
				createCell(hrow ,cellStyle, format , val, j );
			}
			rowNum++;
		}
		hrow = sheet.createRow(rowNum);
		hrow.setHeight((short)500);
		//대가리 이거 뭐지?
		/*Map data = (Map) values.get(values.size()-1);
		for(int j = 0 ; j < columns.length; j++){
			Object val = data.get("val_"+j);
			if(val instanceof String){
				createCell(hrow ,titleStyle ,(String)data.get("val_"+j), j );
			}else if(val instanceof Integer){
				createCell(hrow ,titleStyle ,Integer.toString((Integer)data.get("val_"+j)), j );
			}else{
				createCell(hrow ,titleStyle , DalbitUtil.isNullToString(data.get("val_"+j)), j );
			}
		}*/
		
		int lenChk =5;
		if(lenChk > values.size()){
            lenChk =values.size();
        }
        int bytePer = 270;
        int colWithMin = 3000;
        int colWithMax = 9000;
        int colWidthVal = colWithMin;
        
        //엑셀 컬럼별 너비 구하기        
        for(int i = 0 ; i < columns.length ; i ++){
			for(int j = 0 ; j < lenChk; j++){
				Object[] objectData = (Object[]) values.get(j);
				Object val = objectData[i];
				int lenSize=0;
				if(val instanceof String){
					lenSize = getByteSizeToComplex((String)val);
				}else if(val instanceof Integer){
					lenSize = getByteSizeToComplex(String.valueOf(val));
				}
				
				if(colWidthVal< lenSize*bytePer){
                    colWidthVal =lenSize*bytePer;
                }
                if(j==lenChk-1){
                	//컬럼 너비 설정
                    if(colWidthVal>colWithMax){
                        colWidthVal = colWithMax;
                    }
                    sheet.setColumnWidth(i, colWidthVal);
                    colWidthVal=colWithMin;
                }
			}
		}
		
	}
	
	private void createCell(HSSFRow hrow , HSSFCellStyle style, HSSFDataFormat format, Object value, int idx){

		HSSFCell cell = hrow.createCell(idx);
		//cell.setCellType(CellType.STRING);
		//cell.setCellValue(value);
		//cell.setCellStyle(style);

		if(value instanceof String){
			cell.setCellType(CellType.STRING);
			//style.setDataFormat(format.getFormat("@"));
			cell.setCellStyle(style);

			cell.setCellValue(value.toString().length() > 32767 ? value.toString().substring(0, 32767): value.toString());
		}
		else if(value instanceof Integer){

			cell.setCellValue(new Double((int) value));
			cell.setCellType(CellType.NUMERIC);

			style.setDataFormat(format.getFormat("#,##0"));
			cell.setCellStyle(style);
		}
		else if(value instanceof Long){
			//style.setDataFormat(format.getFormat("0"));
			cell.setCellStyle(style);

			cell.setCellValue(new Double((Long) value));
		}
		else if(value instanceof Double){
			//style.setDataFormat(format.getFormat("0"));
			cell.setCellStyle(style);

			cell.setCellValue((Double) value);
		}
		else if(value instanceof Calendar){
			//style.setDataFormat(format.getFormat("yyyy-mm-dd"));
			cell.setCellStyle(style);

			cell.setCellValue((Calendar) value);
		}
		else if(value instanceof Date){
			//style.setDataFormat(format.getFormat("yyyy-mm-dd"));
			cell.setCellStyle(style);

			cell.setCellValue((Date) value);
		}
		else if(value instanceof Boolean){
			cell.setCellValue((boolean) value);
		}
		else{
			cell.setCellValue(value.toString());
		}
	}
	
    private void setFileNameToResponse(
    		HttpServletRequest request, 
    		HttpServletResponse response, 
    		String fileName
    		) {
    	
    	String userAgent = request.getHeader("User-Agent");
	    if (userAgent.indexOf("MSIE 5.5") >= 0) {
	        response.setContentType("doesn/matter");
	        response.setHeader("Content-Disposition","filename=\""+fileName+"\"");
	    } else {
	        response.setHeader("Content-Disposition","attachment; filename=\""+fileName+"\"");
	    }
    }

    private String getFileName(Map model) {
        String name = (String) model.get("fileName");
        StringBuilder sb = new StringBuilder();
        SimpleDateFormat fileFormat = new SimpleDateFormat("yyyyMMdd_HHmmss");
        
        try {
        	sb.append(URLEncoder.encode(name, "UTF-8").replace('+', ' '))
        		.append("_")
        		.append(fileFormat.format(new Date()));
            return sb.toString();
        }
        catch (UnsupportedEncodingException uee) {
            return name;
        }
    }    
    
	private HSSFFont getFont(HSSFWorkbook wb){
		HSSFFont font = wb.createFont();
		font.setFontName(HSSFFont.FONT_ARIAL);
		return font;
	}
	
	private HSSFCellStyle getTitleStyle(HSSFWorkbook wb){
		// 엑셀: 제목의 스타일 생성.
		//타이틀 font 설정
        HSSFFont titleFont = wb.createFont();
        titleFont.setFontHeightInPoints((short)10);
        titleFont.setColor(IndexedColors.BLACK.getIndex());
        titleFont.setFontName("맑은 고딕");
        titleFont.setBold(true);;
        
		HSSFCellStyle style = wb.createCellStyle();
		style.setFillForegroundColor(HSSFColor.HSSFColorPredefined.GREY_25_PERCENT.getIndex());
		style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		
		style.setAlignment(HorizontalAlignment.CENTER);
		style.setVerticalAlignment(VerticalAlignment.CENTER);

		style.setBorderBottom(BorderStyle.THIN);
		style.setBottomBorderColor(IndexedColors.BLACK.getIndex());
		style.setBorderLeft(BorderStyle.THIN);
		style.setLeftBorderColor(IndexedColors.BLACK.getIndex());
		style.setBorderRight(BorderStyle.THIN);
		style.setRightBorderColor(IndexedColors.BLACK.getIndex());
		style.setBorderTop(BorderStyle.THIN);
		style.setTopBorderColor(IndexedColors.BLACK.getIndex());
		style.setFont(titleFont);
		return style;
	}
	
	private HSSFCellStyle getCellStyle(HSSFWorkbook wb){
		HSSFFont baseFont = wb.createFont();
        baseFont.setFontHeightInPoints((short)10);
        baseFont.setColor(IndexedColors.BLACK.getIndex());
        baseFont.setFontName("맑은 고딕");
        
		HSSFCellStyle style = wb.createCellStyle();
		
		style.setAlignment(HorizontalAlignment.CENTER);
		style.setVerticalAlignment(VerticalAlignment.CENTER);
		
		style.setBorderBottom(BorderStyle.THIN);
		style.setBottomBorderColor(IndexedColors.BLACK.getIndex());
		style.setBorderLeft(BorderStyle.THIN);
		style.setLeftBorderColor(IndexedColors.BLACK.getIndex());
		style.setBorderRight(BorderStyle.THIN);
		style.setRightBorderColor(IndexedColors.BLACK.getIndex());
		style.setBorderTop(BorderStyle.THIN);
		style.setTopBorderColor(IndexedColors.BLACK.getIndex());
		
		style.setFont(baseFont);
		return style;
	}
	
    public static final int getByteSizeToComplex(String str) {

        int en = 0;
        int ko = 0;
        int etc = 0;

        char[] string = str.toCharArray();

        for (int j = 0; j < string.length; j++) {
            if (string[j] >= 'A' && string[j] <= 'z') {
                en++;
            } else if (string[j] >= '\uAC00' && string[j] <= '\uD7A3') {
                ko++;
                ko++;
            } else {
                etc++;
            }
        }

        return (en + ko + etc);

    }
    
 }
