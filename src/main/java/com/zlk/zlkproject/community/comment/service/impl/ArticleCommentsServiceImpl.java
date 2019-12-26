package com.zlk.zlkproject.community.comment.service.impl;

import com.zlk.zlkproject.community.comment.mapper.ArticleCommentsMapper;
import com.zlk.zlkproject.community.comment.service.ArticleCommentsService;
import com.zlk.zlkproject.entity.ArticleComment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.List;

/**
 * @program: CommentServiceImpl
 * @description: 文章评论业务实现类
 * @author: QianKeQin
 * @date: 2019/12/2 14:49
 */
@Service
public class ArticleCommentsServiceImpl implements ArticleCommentsService {

    @Autowired
    private ArticleCommentsMapper articleCommentsMapper;

    @Override
    public Integer addArtCmt(ArticleComment articleComment) {
        articleComment.setZan(0);
        articleComment.setCai(0);
        articleComment.setInform("false");
        return articleCommentsMapper.addArtCmt(articleComment);
    }

    @Override
    public List<ArticleComment> findArtCmt(String articleId, Integer page, Integer size) {
        page = (page - 1) * size;
        List<ArticleComment> list = articleCommentsMapper.findArtCmt(articleId, page, size);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        for (ArticleComment a : list) {
            a.setDateString(sdf.format(a.getDate()));
            for (ArticleComment aa : a.getArticleCommentList()) {
                aa.setDateString(sdf.format(aa.getDate()));
            }
        }
        return list;
    }

    @Override
    public Integer findArtCmtCount(String articleId) {
        return articleCommentsMapper.findArtCmtCount(articleId);
    }

    @Override
    public Integer updateZC(String userId, Integer articleCommentId, String type) {
        if("ZanAdd".equals(type)){
            Integer res = articleCommentsMapper.addArtCmtUserZC(articleCommentId, userId, "zan");
            if(res != 1)
                return 0;
        }else if ("ZanMinus".equals(type)){
            Integer res = articleCommentsMapper.deleteArtCmtUserZC(articleCommentId, userId);
            if(res != 1)
                return 0;
        }else if ("CaiAdd".equals(type)){
            Integer res = articleCommentsMapper.addArtCmtUserZC(articleCommentId, userId, "cai");
            if(res != 1)
                return 0;
        }else if ("CaiMinus".equals(type)){
            Integer res = articleCommentsMapper.deleteArtCmtUserZC(articleCommentId, userId);
            if(res != 1)
                return 0;
        }else if ("ZanAddCaiMinus".equals(type)){
            Integer res = articleCommentsMapper.updateArtCmtUserZC(articleCommentId, userId, "zan");
            if(res != 1)
                return 0;
        }else if ("ZanMinusCaiAdd".equals(type)){
            Integer res = articleCommentsMapper.updateArtCmtUserZC(articleCommentId, userId, "cai");
            if(res != 1)
                return 0;
        }
        return articleCommentsMapper.updateZanCaiNumByArticleCommentId(articleCommentId,type);
    }

    @Override
    public Integer updateArtCmtInform(Integer articleCommentId, String inform) {
        return articleCommentsMapper.updateArtCmtInform(articleCommentId,inform);
    }
}
