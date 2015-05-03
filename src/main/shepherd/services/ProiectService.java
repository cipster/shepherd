package services;

import model.domain.Proiect;
import org.springframework.stereotype.Service;

/**
 * Created by Ciprian on 3/7/2015.
 * Project Shepherd
 */
@Service
public interface ProiectService {

    public Proiect createProject(Proiect proiect) throws RuntimeException;
    public Proiect modifyProject(Proiect proiect) throws RuntimeException;
    public boolean deleteProject(String idProiect) throws RuntimeException;
}
