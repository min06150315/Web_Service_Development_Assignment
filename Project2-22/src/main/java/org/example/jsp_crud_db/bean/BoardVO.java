package org.example.jsp_crud_db.bean;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class BoardVO {
    private int id;
    private String title;
    private String writer;
    private String content;
    private Date regdate;
    private int cnt;
}
