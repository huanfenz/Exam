(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-7c883d35"],{1036:function(t,e,n){},a54b:function(t,e,n){"use strict";n.r(e);var s=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",[n("el-dialog",{attrs:{title:"修改得分",visible:t.dialogVisible,width:"300px"},on:{"update:visible":function(e){t.dialogVisible=e}}},[n("el-input",{attrs:{type:"number",max:"100",min:"0",placeholder:"修改得分"},model:{value:t.newScore,callback:function(e){t.newScore=e},expression:"newScore"}}),n("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[n("el-button",{on:{click:function(e){t.dialogVisible=!1}}},[t._v("取 消")]),n("el-button",{attrs:{type:"primary"},on:{click:t.submitnewScore}},[t._v("确 定")])],1)],1),n("div",{staticStyle:{margin:"20px",float:"right"}},[n("el-button",{attrs:{type:"primary"},on:{click:function(e){return t.$router.push({name:"ExamRecord"})}}},[t._v("返回列表")]),1===t.myState?n("el-button",{attrs:{type:"success"},on:{click:t.handlerCheck}},[t._v("完成批改")]):t._e()],1),n("div",{staticClass:"exam-name"},[t._v(t._s(t.examName)+" ")]),n("div",{staticClass:"finish-time"},[t._v(t._s(t.finishTime))]),n("el-row",{staticClass:"third-line"},[n("el-col",{attrs:{span:8}},[t._v(" 考生姓名："+t._s(t.studentName))]),n("el-col",{attrs:{span:8}},[t._v(" 考试用时："+t._s(t.useTime)+" 分钟")]),n("el-col",{attrs:{span:8}},[t._v(" 考试得分："),n("span",{staticStyle:{color:"#0a84ff","font-weight":"bold"}},[t._v(t._s(t.score))]),t._v(" 分 ")])],1),t._l(t.questionList,(function(e,s){return n("el-card",{directives:[{name:"show",rawName:"v-show",value:e.length>0,expression:"type.length > 0"}],key:s,staticClass:"myCard"},[n("div",{attrs:{slot:"header"},slot:"header"},[n("span",[t._v(t._s(t.typeInfo[s].name)+"（共"+t._s(t.typeInfo[s].count)+"题，共"+t._s(t.typeInfo[s].score)+"分）")])]),t._l(e,(function(e,i){return n("div",{key:e.id},[n("el-row",[n("el-col",{attrs:{span:18}},[n("div",[t._v(" "+t._s(i+1)+"."),n("span",{staticClass:"question-content"},[t._v(t._s(e.content)+" （本题 "+t._s(e.score)+" 分） ")])]),null!=e.image?n("el-image",{staticStyle:{height:"100px","margin-top":"10px"},attrs:{fit:"contain",src:e.image,"preview-src-list":[e.image]}}):t._e(),0==s||1==s?n("div",t._l(e.options,(function(e,s){return n("div",{key:e.id,class:t.optionClass(e)},[n("div",[t._v(" "+t._s(String.fromCharCode(65+s))+". "+t._s(e.content)+" ")]),null!=e.image?n("el-image",{staticStyle:{height:"100px","margin-top":"10px"},attrs:{fit:"contain",src:e.image,"preview-src-list":[e.image]}}):t._e()],1)})),0):t._e(),2==s?n("div",[n("div",{class:"true"==e.answer?"optionIsRight":"optionNormal"},[t._v(" 正确 ")]),n("div",{class:"false"==e.answer?"optionIsRight":"optionNormal"},[t._v(" 错误 ")])]):t._e(),3==s||4==s?n("div",[n("div",{staticClass:"optionIsRight"},[n("div",[t._v("题目答案："+t._s(e.answer))]),null!=e.answerImage?n("el-image",{staticStyle:{height:"100px","margin-top":"10px"},attrs:{fit:"contain",src:e.answerImage,"preview-src-list":[e.answerImage]}}):t._e()],1)]):t._e(),n("div",{staticClass:"grayback-box"},[n("div",[t._v("题目解析："+t._s(e.analysis))]),null!=e.analysisImage?n("el-image",{staticStyle:{height:"100px","margin-top":"10px"},attrs:{fit:"contain",src:e.analysisImage,"preview-src-list":[e.analysisImage]}}):t._e()],1)],1),n("el-col",{attrs:{span:6}},[n("div",{staticClass:"answer-box"},[n("div",{class:t.answerClass(t.answerList[s][i].isRight)},[null!=t.answerList[s][i].yourAnswer?n("span",[t._v("您的作答："+t._s(t.answerList[s][i].yourAnswer))]):n("span",[t._v("您没有作答！")])]),n("div",{staticStyle:{color:"#0a84ff","margin-top":"10px"}},[t._v(" 您的得分："+t._s(t.answerList[s][i].gotScore?t.answerList[s][i].gotScore:0)+" ")]),1===t.myState?n("div",{staticStyle:{"margin-top":"20px"}},[n("el-button",{attrs:{disabled:3!==s&&4!==s,type:"primary",size:"small"},on:{click:function(e){return t.handlerAlterScore(s,i)}}},[t._v("修改得分")])],1):t._e()])])],1),n("el-divider")],1)}))],2)}))],2)},i=[],a=n("b69d"),r=n("b4a7"),o={name:"Detail",data:function(){return{myState:0,studentExamId:null,examName:"第一次考试",finishTime:"2020-04-14 12:00:00",studentName:"张三",useTime:60,score:95,dialogVisible:!1,newScore:0,curStudentQuestionId:null,curI:null,curJ:null,typeInfo:[{name:"单选题",count:0,score:0},{name:"多选题",count:0,score:0},{name:"判断题",count:0,score:0},{name:"填空题",count:0,score:0},{name:"简答题",count:0,score:0}],questionList:[[{id:196,paperId:1,questionId:1,score:2,orderNum:1,repoId:1,chapterId:49,type:"单选题",content:"中国最大的淡水湖是哪一个？",image:null,answer:"449",answerImage:null,analysis:"中国四大淡水湖分别是：鄱阳湖、洞庭湖、太湖和洪泽湖。",analysisImage:null,remark:null,options:[{id:448,questionId:1,content:"洞庭湖",image:null,isRight:0},{id:449,questionId:1,content:"鄱阳湖",image:null,isRight:1},{id:450,questionId:1,content:"太湖",image:null,isRight:0},{id:451,questionId:1,content:"洪泽湖",image:null,isRight:0}]}],[{id:206,paperId:1,questionId:21,score:2,orderNum:1,repoId:1,chapterId:48,type:"多选题",content:"南北朝的南朝指的是（）。",image:null,answer:"542,544,545,546",answerImage:null,analysis:"南朝宋齐梁陈",analysisImage:null,remark:null,options:[{id:542,questionId:21,content:"宋",image:null,isRight:1},{id:543,questionId:21,content:"魏",image:null,isRight:0},{id:544,questionId:21,content:"齐",image:null,isRight:1},{id:545,questionId:21,content:"陈",image:null,isRight:1},{id:546,questionId:21,content:"梁",image:null,isRight:1}]}],[],[],[]],answerList:[[{studentQuestionId:null,yourAnswer:null,isRight:0,gotScore:0}],[],[],[],[]]}},created:function(){var t=this;this.studentExamId=this.$route.params.studentExamId,this.myState=this.$route.params.myState,Object(r["d"])({studentExamId:this.studentExamId}).then((function(e){if(200===e.status){var n=e.data;t.examName=n.examName,t.finishTime=n.finishTime,t.studentName=n.studentName,t.useTime=n.useTime,t.score=n.score,t.questionList=n.questionList,t.answerList=n.answerList;for(var s=0;s<t.questionList.length;s++){var i=t.questionList[s].length;t.typeInfo[s].count=i;for(var a=0,r=0;r<i;r++)a+=t.questionList[s][r].score;t.typeInfo[s].score=a}}}))},methods:{optionClass:function(t){return 1===t.isRight?"optionIsRight":"optionNormal"},answerClass:function(t){return 1===t?"answer-rignt":"answer-wrong"},handlerAlterScore:function(t,e){this.curStudentQuestionId=this.answerList[t][e].studentQuestionId,this.curI=t,this.curJ=e,this.dialogVisible=!0},submitnewScore:function(){var t=this,e=this.newScore,n=this.curStudentQuestionId,s=this.questionList[this.curI][this.curJ].score;e<0||e>s?this.$message.error("得分必须大于等于0且小于该题的分值"):Object(a["a"])({studentExamId:this.studentExamId,studentQuestionId:n,newScore:e}).then((function(e){200===e.status?(t.$message.success("修改成功"),t.answerList[t.curI][t.curJ].gotScore=t.newScore,t.newScore>0&&(t.answerList[t.curI][t.curJ].isRight=1),t.score=e.data,t.dialogVisible=!1):t.$message.error(e.message)}))},handlerCheck:function(){var t=this;Object(a["b"])({studentExamId:this.studentExamId}).then((function(e){200===e.status&&(t.$message.success("提交成功"),t.$router.push({name:"ExamRecord"}))}))}}},u=o,c=(n("fed0"),n("2877")),l=Object(c["a"])(u,s,i,!1,null,null,null);e["default"]=l.exports},b4a7:function(t,e,n){"use strict";n.d(e,"h",(function(){return i})),n.d(e,"a",(function(){return a})),n.d(e,"c",(function(){return r})),n.d(e,"e",(function(){return o})),n.d(e,"f",(function(){return u})),n.d(e,"i",(function(){return c})),n.d(e,"b",(function(){return l})),n.d(e,"g",(function(){return d})),n.d(e,"d",(function(){return m}));var s=n("b775");function i(t){return Object(s["a"])({url:"/student/exam/queryPage",method:"get",params:t})}function a(t){return Object(s["a"])({url:"/student/exam/checkPassword",method:"post",data:t})}function r(t){return Object(s["a"])({url:"/student/exam/createStudentExam",method:"post",data:t})}function o(t){return Object(s["a"])({url:"/student/exam/getExamInfo",method:"get",params:t})}function u(t){return Object(s["a"])({url:"/student/exam/getQuestion",method:"get",params:t})}function c(t){return Object(s["a"])({url:"/student/exam/saveAnswer",method:"post",data:t})}function l(t){return Object(s["a"])({url:"/student/exam/commitPaper",method:"post",data:t})}function d(t){return Object(s["a"])({url:"/student/exam/getScore",method:"get",params:t})}function m(t){return Object(s["a"])({url:"/student/exam/getDetail",method:"get",params:t})}},b69d:function(t,e,n){"use strict";n.d(e,"e",(function(){return i})),n.d(e,"c",(function(){return a})),n.d(e,"d",(function(){return r})),n.d(e,"a",(function(){return o})),n.d(e,"b",(function(){return u}));var s=n("b775");function i(t){return Object(s["a"])({url:"/admin/record/queryPage",method:"get",params:t})}function a(t){return Object(s["a"])({url:"/admin/record/deleteRecord",method:"delete",data:t})}function r(t){return Object(s["a"])({url:"/admin/record/deleteRecords",method:"delete",data:t})}function o(t){return Object(s["a"])({url:"/admin/record/alterScore",method:"put",data:t})}function u(t){return Object(s["a"])({url:"/admin/record/commitCheck",method:"post",data:t})}},fed0:function(t,e,n){"use strict";n("1036")}}]);