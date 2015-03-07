package util.excel;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created by Ciprian on 3/7/2015.
 * Project Shepherd
 */
public interface ExcelService {
    public int generateExcelFile(File file, Map<Integer,List<Object>> dataMap) throws IOException;
}
