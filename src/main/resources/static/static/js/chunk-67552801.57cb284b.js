(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-67552801"],{"1a8b":function(e,t,a){"use strict";a.d(t,"d",(function(){return r})),a.d(t,"e",(function(){return i})),a.d(t,"f",(function(){return l})),a.d(t,"a",(function(){return u})),a.d(t,"b",(function(){return s})),a.d(t,"c",(function(){return o})),a.d(t,"g",(function(){return c}));var n=a("b775");function r(){return Object(n["a"])({url:"/admin/exam/getCount",method:"get"})}function i(){return Object(n["a"])({url:"/admin/exam/queryAll",method:"get"})}function l(e){return Object(n["a"])({url:"/admin/exam/queryPage",method:"get",params:e})}function u(e){return Object(n["a"])({url:"/admin/exam/addOne",method:"post",data:e})}function s(e){return Object(n["a"])({url:"/admin/exam/deleteOne",method:"delete",data:e})}function o(e){return Object(n["a"])({url:"/admin/exam/deleteSome",method:"delete",data:e})}function c(e){return Object(n["a"])({url:"/admin/exam/updateOne",method:"put",data:e})}},6724:function(e,t,a){"use strict";a("8d41");var n="@@wavesContext";function r(e,t){function a(a){var n=Object.assign({},t.value),r=Object.assign({ele:e,type:"hit",color:"rgba(0, 0, 0, 0.15)"},n),i=r.ele;if(i){i.style.position="relative",i.style.overflow="hidden";var l=i.getBoundingClientRect(),u=i.querySelector(".waves-ripple");switch(u?u.className="waves-ripple":(u=document.createElement("span"),u.className="waves-ripple",u.style.height=u.style.width=Math.max(l.width,l.height)+"px",i.appendChild(u)),r.type){case"center":u.style.top=l.height/2-u.offsetHeight/2+"px",u.style.left=l.width/2-u.offsetWidth/2+"px";break;default:u.style.top=(a.pageY-l.top-u.offsetHeight/2-document.documentElement.scrollTop||document.body.scrollTop)+"px",u.style.left=(a.pageX-l.left-u.offsetWidth/2-document.documentElement.scrollLeft||document.body.scrollLeft)+"px"}return u.style.backgroundColor=r.color,u.className="waves-ripple z-active",!1}}return e[n]?e[n].removeHandle=a:e[n]={removeHandle:a},a}var i={bind:function(e,t){e.addEventListener("click",r(e,t),!1)},update:function(e,t){e.removeEventListener("click",e[n].removeHandle,!1),e.addEventListener("click",r(e,t),!1)},unbind:function(e){e.removeEventListener("click",e[n].removeHandle,!1),e[n]=null,delete e[n]}},l=function(e){e.directive("waves",i)};window.Vue&&(window.waves=i,Vue.use(l)),i.install=l;t["a"]=i},"8d41":function(e,t,a){},a434:function(e,t,a){"use strict";var n=a("23e7"),r=a("23cb"),i=a("a691"),l=a("50c4"),u=a("7b0b"),s=a("65f0"),o=a("8418"),c=a("1dde"),d=a("ae40"),m=c("splice"),h=d("splice",{ACCESSORS:!0,0:0,1:2}),f=Math.max,p=Math.min,g=9007199254740991,y="Maximum allowed length exceeded";n({target:"Array",proto:!0,forced:!m||!h},{splice:function(e,t){var a,n,c,d,m,h,b=u(this),v=l(b.length),w=r(e,v),q=arguments.length;if(0===q?a=n=0:1===q?(a=0,n=v-w):(a=q-2,n=p(f(i(t),0),v-w)),v+a-n>g)throw TypeError(y);for(c=s(b,n),d=0;d<n;d++)m=w+d,m in b&&o(c,d,b[m]);if(c.length=n,a<n){for(d=w;d<v-n;d++)m=d+n,h=d+a,m in b?b[h]=b[m]:delete b[h];for(d=v;d>v-n+a;d--)delete b[d-1]}else if(a>n)for(d=v-n;d>w;d--)m=d+n-1,h=d+a-1,m in b?b[h]=b[m]:delete b[h];for(d=0;d<a;d++)b[d+w]=arguments[d+2];return b.length=v-n+a,c}})},b5fd:function(e,t,a){"use strict";a.r(t);var n=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",{staticClass:"app-container"},[a("div",{staticClass:"filter-container",staticStyle:{"margin-bottom":"15px"}},[a("el-select",{directives:[{name:"permission",rawName:"v-permission",value:["admin"],expression:"['admin']"}],attrs:{placeholder:"请选择学生"},model:{value:e.queryParam.studentId,callback:function(t){e.$set(e.queryParam,"studentId",t)},expression:"queryParam.studentId"}},e._l(e.studentData,(function(e){return a("el-option",{key:e.id,attrs:{label:e.username,value:e.id}})})),1),a("el-select",{attrs:{placeholder:"请选择考试"},model:{value:e.queryParam.examId,callback:function(t){e.$set(e.queryParam,"examId",t)},expression:"queryParam.examId"}},e._l(e.examData,(function(e){return a("el-option",{key:e.id,attrs:{label:e.name,value:e.id}})})),1),a("el-select",{attrs:{placeholder:"是否完成"},model:{value:e.queryParam.isFinished,callback:function(t){e.$set(e.queryParam,"isFinished",t)},expression:"queryParam.isFinished"}},[a("el-option",{attrs:{label:"考试中",value:0}}),a("el-option",{attrs:{label:"考试完成",value:1}})],1),a("el-select",{attrs:{placeholder:"是否批改"},model:{value:e.queryParam.isChecked,callback:function(t){e.$set(e.queryParam,"isChecked",t)},expression:"queryParam.isChecked"}},[a("el-option",{attrs:{label:"等待批改主观题",value:0}}),a("el-option",{attrs:{label:"批改完成",value:1}})],1),a("el-select",{attrs:{placeholder:"是否及格"},model:{value:e.queryParam.isQualify,callback:function(t){e.$set(e.queryParam,"isQualify",t)},expression:"queryParam.isQualify"}},[a("el-option",{attrs:{label:"不及格",value:0}}),a("el-option",{attrs:{label:"及格",value:1}})],1),a("el-button",{directives:[{name:"waves",rawName:"v-waves"}],staticClass:"filter-item",attrs:{type:"primary",icon:"el-icon-search"},on:{click:e.handleFilter}},[e._v(" 搜索 ")]),a("el-button",{directives:[{name:"waves",rawName:"v-waves"}],staticClass:"filter-item",attrs:{type:"primary",icon:"el-icon-search"},on:{click:e.handleShowAll}},[e._v(" 显示全部 ")]),a("el-button",{directives:[{name:"permission",rawName:"v-permission",value:["admin"],expression:"['admin']"}],staticClass:"filter-item",staticStyle:{"margin-left":"10px"},attrs:{type:"danger",icon:"el-icon-delete"},on:{click:e.handleDeleteSome}},[e._v(" 批量删除 ")])],1),a("el-table",{ref:"multipleTable",attrs:{data:e.tableData,border:""}},[a("el-table-column",{attrs:{fixed:"",type:"selection",width:"55",align:"center"}}),a("el-table-column",{attrs:{prop:"id",label:"序号",align:"center"}}),a("el-table-column",{attrs:{prop:"studentName",label:"学生姓名",align:"center"}}),a("el-table-column",{attrs:{label:"考试名",align:"center",width:"300","show-overflow-tooltip":""},scopedSlots:e._u([{key:"default",fn:function(t){return[a("el-link",{attrs:{type:"primary"},on:{click:function(a){return e.handleDetail(t.row)}}},[e._v(e._s(t.row.examName))])]}}])}),a("el-table-column",{attrs:{prop:"isFinished",label:"是否完成",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[0===t.row.isFinished?a("span",{staticStyle:{color:"red"}},[e._v("考试中")]):a("span",{staticStyle:{color:"green"}},[e._v("考试完成")])]}}])}),a("el-table-column",{attrs:{prop:"score",label:"考试得分",align:"center"}}),a("el-table-column",{attrs:{prop:"isChecked",label:"是否批改",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[0===t.row.isChecked?a("span",{staticStyle:{color:"orange"}},[e._v("等待批改主观题")]):a("span",{staticStyle:{color:"green"}},[e._v("批改完成")])]}}])}),a("el-table-column",{attrs:{prop:"qualifyScore",label:"及格分数",align:"center"}}),a("el-table-column",{attrs:{prop:"isQualify",label:"是否及格",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[0===t.row.isQualify?a("span",{staticStyle:{color:"red"}},[e._v("不及格")]):a("span",{staticStyle:{color:"green"}},[e._v("及格")])]}}])}),a("el-table-column",{attrs:{prop:"startTime",label:"开考时间",align:"center"}}),a("el-table-column",{attrs:{prop:"finishTime",label:"交卷时间",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[null!=t.row.finishTime?a("span",[e._v(e._s(t.row.finishTime))]):a("span",[e._v("等待交卷")])]}}])}),a("el-table-column",{attrs:{label:"操作",fixed:"right",width:e.roleIsAdmin?350:150,align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("el-button",{directives:[{name:"permission",rawName:"v-permission",value:["admin"],expression:"['admin']"}],attrs:{type:"primary",size:"small",disabled:!t.row.isFinished},on:{click:function(a){return e.handleCheck(t.row)}}},[e._v("批改试卷")]),a("el-button",{attrs:{type:"success",size:"small",disabled:!t.row.isFinished},on:{click:function(a){return e.handleDetail(t.row)}}},[e._v("查看试卷答题情况")]),a("el-button",{directives:[{name:"permission",rawName:"v-permission",value:["admin"],expression:"['admin']"}],attrs:{type:"danger",size:"small"},on:{click:function(a){return e.handleDelete(t.row,t.$index)}}},[e._v("删除")])]}}])})],1),a("el-pagination",{staticStyle:{"margin-top":"15px"},attrs:{background:"","current-page":e.queryParam.page,"page-sizes":[5,10,20,50],"page-size":e.queryParam.limit,layout:"total, sizes, prev, pager, next, jumper",total:e.recordTotal},on:{"update:currentPage":function(t){return e.$set(e.queryParam,"page",t)},"update:current-page":function(t){return e.$set(e.queryParam,"page",t)},"size-change":e.handleSizeChange,"current-change":e.handleCurrentChange}})],1)},r=[],i=a("5530"),l=(a("a434"),a("2f62")),u=(a("d3b7"),a("caad"),a("2532"),a("4360"));function s(e,t){var a=t.value,n=u["a"].getters&&u["a"].getters.roles;if(!(a&&a instanceof Array))throw new Error("need roles! Like v-permission=\"['admin','editor']\"");if(a.length>0){var r=a,i=n.some((function(e){return r.includes(e)}));i||e.parentNode&&e.parentNode.removeChild(e)}}var o={inserted:function(e,t){s(e,t)},update:function(e,t){s(e,t)}},c=function(e){e.directive("permission",o)};window.Vue&&(window["permission"]=o,Vue.use(c)),o.install=c;var d=o,m=a("6724"),h=a("e17e"),f=a("1a8b"),p=a("b69d"),g=a("b775");function y(e){return Object(g["a"])({url:"/student/record/queryPage",method:"get",params:e})}var b={name:"GradeList",directives:{waves:m["a"],permission:d},data:function(){return{tableData:[],studentData:[],examData:[],recordTotal:0,queryParam:{page:1,limit:10,studentId:null,examId:null,isFinished:null,isQualify:null,isChecked:null,startTime:null,endTime:null},timeValue:[],examId:null}},computed:Object(i["a"])(Object(i["a"])({},Object(l["b"])(["id","roles"])),{},{roleIsAdmin:function(){return"admin"===this.roles[0]}}),watch:{timeValue:{handler:function(){this.queryParam.startTime=this.getyyyyMMdd(this.timeValue[0]),this.queryParam.endTime=this.getyyyyMMdd(this.timeValue[1])}}},created:function(){var e=this;this.roleIsAdmin&&Object(h["e"])().then((function(t){200===t.status&&(e.studentData=t.data)})),Object(f["e"])().then((function(t){200===t.status&&(e.examData=t.data)})),this.queryPage()},methods:{getyyyyMMdd:function(e){var t=e.getFullYear(),a=e.getMonth()+1,n=e.getDate(),r=e.getHours(),i=e.getMinutes(),l=e.getSeconds();String(a).length<2&&(a="0"+a),String(n).length<2&&(n="0"+n),String(r).length<2&&(r="0"+r),String(i).length<2&&(i="0"+i),String(l).length<2&&(l="0"+l);var u=t+"-"+a+"-"+n+" "+r+":"+i+":"+l;return u},queryPage:function(){var e=this;this.roleIsAdmin?Object(p["e"])(this.queryParam).then((function(t){200===t.status&&(e.tableData=t.data,e.recordTotal=t.count)})):(this.queryParam.studentId=this.id,y(this.queryParam).then((function(t){200===t.status&&(e.tableData=t.data,e.recordTotal=t.count)})))},handleSizeChange:function(e){this.queryParam.limit=e,this.queryPage()},handleCurrentChange:function(e){this.queryParam.page=e,this.queryPage()},handleFilter:function(){this.queryParam.page=1,this.queryPage()},handleShowAll:function(){this.queryParam.page=1,this.queryParam.studentId=null,this.queryParam.examId=null,this.queryParam.isFinished=null,this.queryParam.isQualify=null,this.queryParam.isChecked=null,this.queryParam.startTime=null,this.queryParam.endTime=null,this.timeValue=[],this.queryPage()},handleCheck:function(e){this.$router.push({name:"ExamDetail",params:{studentExamId:e.id,myState:1}})},handleDetail:function(e){this.$router.push({name:"ExamDetail",params:{studentExamId:e.id,myState:0}})},handleDelete:function(e,t){var a=this;this.$confirm("确定要删除该条记录吗?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then((function(){Object(p["c"])(e).then((function(e){200===e.status?(a.$message.success("删除记录成功"),a.tableData.splice(t,1),0===a.tableData.length&&(a.queryParam.page=a.queryParam.page-1,a.handleCurrentChange(a.queryParam.page))):a.$message.error("删除记录失败")}))}))},handleDeleteSome:function(){var e=this,t=this.$refs.multipleTable.selection;0!==t.length?this.$confirm("确定要删除这些记录吗?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then((function(){Object(p["d"])(t).then((function(a){200===a.status?(e.$message.success("批量删除记录成功"),e.tableData.length===t.length&&0!==e.queryParam.page&&(e.queryParam.page=e.queryParam.page-1),e.handleCurrentChange(e.queryParam.page)):e.$message.error("批量删除记录失败")}))})):this.$message.error("至少选择一条记录")}}},v=b,w=a("2877"),q=Object(w["a"])(v,n,r,!1,null,"976f0362",null);t["default"]=q.exports},b69d:function(e,t,a){"use strict";a.d(t,"e",(function(){return r})),a.d(t,"c",(function(){return i})),a.d(t,"d",(function(){return l})),a.d(t,"a",(function(){return u})),a.d(t,"b",(function(){return s}));var n=a("b775");function r(e){return Object(n["a"])({url:"/admin/record/queryPage",method:"get",params:e})}function i(e){return Object(n["a"])({url:"/admin/record/deleteRecord",method:"delete",data:e})}function l(e){return Object(n["a"])({url:"/admin/record/deleteRecords",method:"delete",data:e})}function u(e){return Object(n["a"])({url:"/admin/record/alterScore",method:"put",data:e})}function s(e){return Object(n["a"])({url:"/admin/record/commitCheck",method:"post",data:e})}},e17e:function(e,t,a){"use strict";a.d(t,"d",(function(){return r})),a.d(t,"e",(function(){return i})),a.d(t,"f",(function(){return l})),a.d(t,"a",(function(){return u})),a.d(t,"b",(function(){return s})),a.d(t,"c",(function(){return o})),a.d(t,"g",(function(){return c}));var n=a("b775");function r(){return Object(n["a"])({url:"/admin/user/getCount",method:"get"})}function i(){return Object(n["a"])({url:"/admin/user/queryAll",method:"get"})}function l(e){return Object(n["a"])({url:"/admin/user/queryPage",method:"get",params:e})}function u(e){return Object(n["a"])({url:"/admin/user/addOne",method:"post",data:e})}function s(e){return Object(n["a"])({url:"/admin/user/deleteOne",method:"delete",data:e})}function o(e){return Object(n["a"])({url:"/admin/user/deleteSome",method:"delete",data:e})}function c(e){return Object(n["a"])({url:"/admin/user/updateOne",method:"put",data:e})}}}]);