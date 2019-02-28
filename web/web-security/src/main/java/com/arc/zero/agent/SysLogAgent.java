package com.arc.zero.agent;

import com.arc.model.domain.system.SysLog;
import com.arc.model.query.SysLogQuery;
import com.arc.model.vo.ResponseVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Map;

/**
 * 远程调用
 * 模拟
 *
 * @author: 叶超
 * @since: 2019/2/2 11:33
 */
//@todo add feign and remove
@Slf4j
@Component
public class SysLogAgent {

    public Long save(SysLog sysLog) {
        String url = "http://127.0.0.1/sys/log/save";
        ResponseEntity<ResponseVo> responseVo = new RestTemplate().postForEntity(url, sysLog, ResponseVo.class);
        log.debug("结果={}", responseVo.toString());
        return null;
    }

    public Integer update(SysLog sysLog) {
        return null;
    }

    public Integer delete(Integer id) {
        String url = "http://127.0.0.1/sys/log/delete/" + id;
        ResponseVo responseVo = new RestTemplate().getForObject(url, ResponseVo.class);
        log.debug("结果={}", responseVo.toString());
        return null;
    }

    public SysLog get(Integer id) {
        String url = "http://127.0.0.1/sys/log/get/" + id;
        ResponseVo<SysLog> responseVo = new RestTemplate().getForObject(url, ResponseVo.class);
        log.debug("结果={}", responseVo.toString());
        Map data = (Map) responseVo.getData();
        System.out.println(data);
        Object obj = null;

        try {
//            obj = CastMapToBean.mapToObject(data, SysLog.class);
            log.debug("结果={}", obj);
        } catch (Exception e) {
            e.printStackTrace();
        }
        SysLog sysLog = (SysLog) obj;
        return sysLog;
    }

    public List<SysLog> list() {
        return null;
    }

    public List<SysLog> listBySysLogQuery(SysLogQuery query) {
        return null;
    }
}
