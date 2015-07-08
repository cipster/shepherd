package util.excel;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface ExcelService {
    public int generateExcelFile(File file, Map<Integer,List<Object>> dataMap) throws IOException;
}
