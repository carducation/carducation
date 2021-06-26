package com.yoo.ji.carducation.domain;

import lombok.Getter;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;
import java.time.LocalDateTime;

@Getter
@MappedSuperclass//JPA Entity 클래스들이 필드를 칼럼으로 인식하도록.
@EntityListeners(AuditingEntityListener.class)//Auditing 기능
public class BaseTimeEntity {

    @CreatedDate//Entity 생성 저장시 시간 자동 저장
    private LocalDateTime createdDate;

    @LastModifiedDate//조회 후 변경할 때 시간 자동 저장
    private LocalDateTime modifiedDate;
}
