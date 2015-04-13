package services;

import model.dao.Cod1DAO;
import model.dto.Cod1;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Cod1ServiceImpl implements Cod1Service {

	@Autowired
	private Cod1DAO cod1DAO;

	@Override
	public List<Cod1> fetchAllCod1() {
		List<Cod1> listaCod1;
		try {
			listaCod1 = cod1DAO.getAll();
		} catch (Exception e) {
			listaCod1 = Collections.emptyList();
		}
		return listaCod1;
	}
}
