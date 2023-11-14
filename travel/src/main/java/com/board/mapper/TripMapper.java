package com.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.domain.TripVo;

@Mapper
public interface TripMapper {

	List<TripVo> tripList();

    TripVo getTrip(TripVo vo);



}
