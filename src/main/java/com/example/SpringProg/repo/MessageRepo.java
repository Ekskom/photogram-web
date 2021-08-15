package com.example.SpringProg.repo;

import com.example.SpringProg.domain.Message;
import com.example.SpringProg.domain.User;
import com.example.SpringProg.domain.dto.MessageDto;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import java.util.List;

public interface MessageRepo extends CrudRepository<Message, Long> {

    @Query("select new com.example.SpringProg.domain.dto.MessageDto(" +
            "   m, " +
            "   count(ml), " +
            "   sum(case when ml = :user then 1 else 0 end) > 0" +
            ") " +
            "from Message m left join m.likes ml " +
            "group by m")
    List<MessageDto> findAll(@Param("user") User user);

    @Query("select new com.example.SpringProg.domain.dto.MessageDto(" +
            "   m, " +
            "   count(ml), " +
            "   sum(case when ml = :user then 1 else 0 end) > 0" +
            ") " +
            "from Message m left join m.likes ml " +
            "where m.tag = :tag "+
            "group by m")
    List<MessageDto> findByTag(@Param("tag")String tag, @Param("user") User user);

    @Query("select new com.example.SpringProg.domain.dto.MessageDto(" +
            "   m, " +
            "   count(ml), " +
            "   sum(case when ml = :user then 1 else 0 end) > 0" +
            ") " +
            "from Message m join m.likes ml " +
            "where m.author = :author "+
            "group by m")
    List<MessageDto> findByUser(@Param("author") User author, @Param("user") User user);



}
