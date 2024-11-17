package org.example.jsp_crud_db.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {
    private int seq;
    private String category;
    private String title;
    private String writer;
    private String content;
    private String regdate;
    private int cnt;
}
