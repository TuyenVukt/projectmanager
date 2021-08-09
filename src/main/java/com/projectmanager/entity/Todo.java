package com.projectmanager.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

@Entity
@Table(name = "todo")
@Data
public class Todo implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "des")
    private String des;

    @Column(name = "start_date")
    private Date startDate;

    @Column(name = "end_date")
    private Date endDate;

    @Column(name = "is_deleted", nullable = false)
    private Boolean deleted;

    @Column(name = "todo_type", nullable = false)
    private String todoType;

    @Column(name = "status")
    private String status;

    @Column(name = "task_id", nullable = false)
    private Integer taskId;

    @Column(name = "create_date", nullable = false)
    private Timestamp createDate;

    @Column(name = "update_date")
    private Timestamp updateDate;

    @Column(name = "create_user", nullable = false)
    private Integer createUser;

    @Column(name = "assigned_user")
    private Integer assignedUser;

}
