package com.audi.callcenter.entity;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;
import javax.persistence.Version;

import com.google.common.base.Objects;


/**
 * 
 * @author loudyn
 * 
 */
@MappedSuperclass
public abstract class IdEntity implements Serializable {

	private Long id;
	private Long version;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Transient
	public boolean isNew() {
		return null == getId();
	}

	@Version
	public Long getVersion() {
		return version;
	}

	public void setVersion(Long version) {
		this.version = version;
	}

	@Override
	public int hashCode() {
		// calc hashcode use id only, if want difference, not extends the IdEntity
		return Objects.hashCode(getId());
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}

		if (null == obj || obj.getClass() != getClass()) {
			return false;
		}

		IdEntity another = (IdEntity) obj;
		return Objects.equal(another.getId(), getId());
	}

	@Override
	public abstract String toString();
	
	private static final long serialVersionUID = 1L;
}

