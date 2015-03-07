package util.excel;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import enums.MethodStatus;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

/**
 * Created by Ciprian on 3/7/2015.
 * Project Shepherd
 */
public class ExcelServiceImpl implements ExcelService {
    /** Logger available to subclasses */
    protected final Log LOGGER = LogFactory.getLog(getClass());
    @Override
    public int generateExcelFile(File file, Map<Integer,List<Object>> dataMap) throws IOException {
        Workbook workbook = new HSSFWorkbook();
        Sheet sheet = workbook.createSheet("Sheet1");

        int rownum = 0;
        for(Map.Entry<Integer, List<Object>> entry : dataMap.entrySet()){
            Row row = sheet.createRow(rownum++);
            List<Object> rowList = entry.getValue();
            int cellnum = 0;
            for (Object obj : rowList) {
                Cell cell = row.createCell(cellnum++);
                if(obj instanceof String)
                    cell.setCellValue((String)obj);
                else if(obj instanceof Integer)
                    cell.setCellValue((Integer)obj);
            }
        }
        try {
            //Write the workbook in file system
            FileOutputStream out = new FileOutputStream(file);
            workbook.write(out);
            out.close();
            LOGGER.debug("Excel file created in " + file.getAbsolutePath());
            return MethodStatus.SUCCESS;
        }
        catch (Exception e) {
            e.printStackTrace();
            return  MethodStatus.ERROR;
        }
    }
}
