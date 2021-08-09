package com.projectmanager.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;

@Entity
@Table(name = "task_history")
@Data
public class TaskHistory implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "des")
    private String des;

    @Column(name = "pre_starus", nullable = false)
    private String preStarus;

    @Column(name = "status", nullable = false)
    private String status;

    @Column(name = "update_date", nullable = false)
    private Timestamp updateDate;

    @Column(name = "update_user", nullable = false)
    private Integer updateUser;

    @Column(name = "task_id", nullable = false)
    private Integer taskId;

}
