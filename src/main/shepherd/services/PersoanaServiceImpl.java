package services;

import model.dao.PersoanaDAO;
import model.dto.Persoana;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Ciprian on 3/12/2015.
 * Project Raindrop
 */
public class PersoanaServiceImpl implements PersoanaService {

	@Qualifier("persoanaDAO")
	@Autowired
	private PersoanaDAO persoanaDAO;

	@Override
	public List<Persoana> fetchAllPersoane() {
		List<Persoana> listaPersoane;
		try {
			listaPersoane = persoanaDAO.getAll();
		} catch (Exception e) {
			listaPersoane = new ArrayList<>();
		}
		return listaPersoane;
	}
}
