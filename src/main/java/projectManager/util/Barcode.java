package projectManager.util;

import com.google.zxing.*;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Created by Ciprian on 11/15/2014.
 */
public class Barcode {

    private static BarcodeFormat DEFAULT_BARCODE_FORMAT = BarcodeFormat.CODE_128;

    /**
     * Given the <code>contents</code>, it will encode them into a png <code>file</code>
     * into the specified <code>barcodeFormat</code>
     * @param file the file to become barcode
     * @param contents the contents to be encoded.
     * @param barcodeFormat barcode or qr
     * @throws Exception
     */
    public static void encode(File file, String contents, BarcodeFormat barcodeFormat) throws Exception {
        int width;
        int height;
        if (barcodeFormat == null)
           barcodeFormat = DEFAULT_BARCODE_FORMAT;
        if (file == null || file.getName().trim().isEmpty())
            throw new IllegalArgumentException("File not found, or invalid file name.");
        if (contents == null || contents.trim().isEmpty())
            throw new IllegalArgumentException("Can't encode null or empty contents.");
        switch (barcodeFormat){
            case CODE_128:
                width = 150;
                height = 100;
                break;
            case QR_CODE:
                width = 300;
                height = 300;
                break;
            default:
                width = 250;
                height = 100;
                break;
        }

        try {
            MultiFormatWriter barcodeWriter = new MultiFormatWriter();
            FileOutputStream outputStream = new FileOutputStream(file);
            BitMatrix matrix;
            matrix = barcodeWriter.encode(contents, barcodeFormat, width, height);
            String imageFormat = file.getName().substring(file.getName().indexOf(".") + 1);
            MatrixToImageWriter.writeToStream(matrix, imageFormat, outputStream);
            outputStream.close();

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    /**
     * Decode method used to read image or barcode itself, and recognize the barcode,
     * get the encoded contents and returns it.
     * @param file image that needs to be read.
     * @return decoded results from barcode.
     */
    public static String decode(File file) throws Exception {
        // check the required parameters
        if (file == null || file.getName().trim().isEmpty())
            throw new IllegalArgumentException("File not found, or invalid file name.");
        BufferedImage image;
        try {
            image = ImageIO.read(file);
        } catch (IOException ioe) {
            throw new Exception(ioe.getMessage());
        }
        if (image == null)
            throw new IllegalArgumentException("Could not decode image.");
        LuminanceSource source = new BufferedImageLuminanceSource(image);
        BinaryBitmap bitmap = new BinaryBitmap(new HybridBinarizer(source));
        MultiFormatReader barcodeReader = new MultiFormatReader();
        Result result;
        String finalResult;
        try {
                result = barcodeReader.decode(bitmap);
            // setting results.
            finalResult = String.valueOf(result.getText());
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
        return finalResult;
    }
}
