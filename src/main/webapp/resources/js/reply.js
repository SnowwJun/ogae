const express = require('express');
const app = express();
const bodyParser = require('body-parser');

// 댓글 데이터를 저장할 배열
const comments = [];

app.use(bodyParser.json());

// 댓글 목록 가져오기
app.get('/comments', (req, res) => {
  res.json(comments);
});

// 댓글 등록 (아이디가 "admin"일 때만 가능)
app.post('/comments', (req, res) => {
  const { id, comment } = req.body;
  if (id === "admin") {
    comments.push(comment);
    res.json({ message: "댓글이 등록되었습니다." });
  } else {
    res.status(403).json({ message: "댓글을 등록할 권한이 없습니다." });
  }
});

app.listen(8080, () => {
  console.log('서버가 8080번 포트에서 실행 중입니다.');
});
