package com.board.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.board.domain.TrainVo;

@Mapper
public interface TrainMapper {

	int countByCityCode(String citycode);

	void insertTrain(TrainVo train);

}
