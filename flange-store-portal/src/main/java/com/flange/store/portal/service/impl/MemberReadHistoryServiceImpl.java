package com.flange.store.portal.service.impl;

import com.flange.store.portal.domain.MemberReadHistory;
import com.flange.store.portal.repository.MemberReadHistoryRepository;
import com.flange.store.portal.service.MemberReadHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author flangely
 * @create 2019-04-19
 * <p>
 * 9:44 PM
 */
@Service
public class MemberReadHistoryServiceImpl implements MemberReadHistoryService {

    @Autowired
    private MemberReadHistoryRepository readHistoryRepository;

    @Override
    public int create(MemberReadHistory memberReadHistory) {
        memberReadHistory.setId(null);
        memberReadHistory.setCreateTime(new Date());
        readHistoryRepository.save(memberReadHistory);
        return 1;
    }

    @Override
    public int delete(List<String> ids) {
        List<MemberReadHistory> delList = new ArrayList<MemberReadHistory>();
        ids.forEach((id) ->{
            MemberReadHistory memberReadHistory = new MemberReadHistory();
            memberReadHistory.setId(id);
            delList.add(memberReadHistory);
        });

        readHistoryRepository.deleteAll(delList);
        return delList.size();

    }

    @Override
    public List<MemberReadHistory> list(String memberId) {
        return readHistoryRepository.findByMemberIdOrderByCreateTimeDesc(memberId);
    }
}
