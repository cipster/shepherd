package util.bean;


import java.sql.Timestamp;
import java.util.Arrays;

public class FileBean {

    private int id;
    private String filename;
    private String creatDe;
    private Timestamp creatLa;
    private byte[] file;

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (filename != null ? filename.hashCode() : 0);
        result = 31 * result + (creatDe != null ? creatDe.hashCode() : 0);
        result = 31 * result + (creatLa != null ? creatLa.hashCode() : 0);
        result = 31 * result + (file != null ? Arrays.hashCode(file) : 0);
        return result;
    }

    @Override
    public boolean equals(Object o) {
        if(this == o) return true;
        if(o == null || getClass() != o.getClass()) return false;

        FileBean fileBean = (FileBean) o;

        if(id != fileBean.id) return false;
        if(creatDe != null ? !creatDe.equals(fileBean.creatDe) : fileBean.creatDe != null) return false;
        if(creatLa != null ? !creatLa.equals(fileBean.creatLa) : fileBean.creatLa != null) return false;
        if(!Arrays.equals(file, fileBean.file)) return false;
        if(filename != null ? !filename.equals(fileBean.filename) : fileBean.filename != null) return false;

        return true;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getCreatDe() {
        return creatDe;
    }

    public void setCreatDe(String creatDe) {
        this.creatDe = creatDe;
    }

    public Timestamp getCreatLa() {
        return creatLa;
    }

    public void setCreatLa(Timestamp creatLa) {
        this.creatLa = creatLa;
    }

    public byte[] getFile() {
        return file;
    }

    public void setFile(byte[] file) {
        this.file = file;
    }
}
