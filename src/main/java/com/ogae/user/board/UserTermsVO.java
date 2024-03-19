package com.ogae.user.board;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserTermsVO {

		private int terms_idx;
		private String terms_title;
		private String terms_content;
		private Boolean terms_necessary;
		private Date terms_regdate;
		private Date terms_modydate;
}
