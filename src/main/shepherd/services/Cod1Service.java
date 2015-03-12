package services;

import model.dto.Cod1;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Ciprian on 3/12/2015.
 * Project Shepherd
 */

@Service
public interface Cod1Service {

	public List<Cod1> fetchAllCod1();
}
