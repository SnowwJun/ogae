package com.ogae.admin.board;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TourVO {
	private int tour_idx;
	private String tour_title;
	private String tour_addr1;
	private String tour_mapx;
	private String tour_mapy;
	private String tour_content;

}
