package com.yoo.ji.carducation.service.posts;

import com.yoo.ji.carducation.domain.posts.PostsRepository;
import com.yoo.ji.carducation.web.dto.PostsSaveRequestDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
@Service
public class PostsService {
    private final PostsRepository postsRepository;

    @Transactional
    public Long save(PostsSaveRequestDto requestDto){
        return postsRepository.save(requestDto.toEntity()).
                getId();
    }
}
