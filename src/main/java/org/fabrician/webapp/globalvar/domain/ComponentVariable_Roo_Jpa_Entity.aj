// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.fabrician.webapp.globalvar.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Version;
import org.fabrician.webapp.globalvar.domain.ComponentVariable;

privileged aspect ComponentVariable_Roo_Jpa_Entity {
    
    declare @type: ComponentVariable: @Entity;
    
    declare @type: ComponentVariable: @Table(name = "COMP_VARS");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long ComponentVariable.id;
    
    @Version
    @Column(name = "version")
    private Integer ComponentVariable.version;
    
    public Long ComponentVariable.getId() {
        return this.id;
    }
    
    public void ComponentVariable.setId(Long id) {
        this.id = id;
    }
    
    public Integer ComponentVariable.getVersion() {
        return this.version;
    }
    
    public void ComponentVariable.setVersion(Integer version) {
        this.version = version;
    }
    
}