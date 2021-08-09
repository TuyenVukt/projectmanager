package com.projectmanager.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Table(name = "todo_history")
@Entity
@Data
public class TodoHistory implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "des")
    private String des;

    @Column(name = "status", nullable = false)
    private String status;

    @Column(name = "pre_status", nullable = false)
    private String preStatus;

    @Column(name = "update_date")
    private String updateDate;

    @Column(name = "update_user")
    private Integer updateUser;

    @Column(name = "todo_id", nullable = false)
    private Integer todoId;

}
