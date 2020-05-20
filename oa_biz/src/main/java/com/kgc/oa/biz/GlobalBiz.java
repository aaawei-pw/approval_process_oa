package com.kgc.oa.biz;

import com.kgc.oa.entity.Employee;

public interface GlobalBiz {
    Employee login(String sn, String password);
}
