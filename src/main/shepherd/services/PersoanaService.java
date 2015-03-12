package services;

import model.dto.Persoana;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Ciprian on 3/12/2015.
 * Project Raindrop
 */
@Service
public interface PersoanaService {

	public List<Persoana> fetchAllPersoane();
}
