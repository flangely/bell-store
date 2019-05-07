package com.flange.store.portal.service.impl;

import com.flange.store.portal.domain.MemberSearchRecord;
import com.flange.store.portal.repository.MemberSearchRecordRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author flangely
 * @create 2019-05-07
 * <p>
 * 9:47 AM
 */
@Service
public class MemberSearchRecordServiceImpl implements MemberSearchRecordService {

    @Autowired
    MemberSearchRecordRepository searchRecordRepository;


    @Override
    public List<MemberSearchRecord> findByMemberId(String memberId) {
        return searchRecordRepository.findByMemberId(memberId);
    }

    @Override
    public int deleteByMemberId(String memberId) {
        searchRecordRepository.deleteByMemberId(memberId);
        return 1;
    }

    @Override
    public int deleteById(String id) {
        searchRecordRepository.deleteById(id);
        return 1;
    }

    @Override
    public int save(MemberSearchRecord record) {
        int count = 0;
        List<MemberSearchRecord> findRecord = searchRecordRepository.findByMemberIdAndContent(record.getMemberId(), record.getContent());
        if (findRecord.size() == 0){
            record.setCreateTime(new Date());
            record.setEditTime(new Date());
            record.setCount(1);
            searchRecordRepository.save(record);
            count = 1;
        }else {
            MemberSearchRecord oldRecord = findRecord.get(0);
            oldRecord.setEditTime(new Date());
            int sum = oldRecord.getCount();
            oldRecord.setCount(++sum);
            searchRecordRepository.save(oldRecord);
            count++;
        }
        return count;
    }
}
