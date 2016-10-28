package com.audi.callcenter.entity;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 
 * @author loudyn
 * 
 */
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.SOURCE)
public @interface AggregateEntityRoot {
	
	/**
	 * 
	 * @return
	 */
	Class<?>[] entities() default {};
}
