(function dartProgram(){function copyProperties(a,b){var s=Object.keys(a)
for(var r=0;r<s.length;r++){var q=s[r]
b[q]=a[q]}}function mixinPropertiesHard(a,b){var s=Object.keys(a)
for(var r=0;r<s.length;r++){var q=s[r]
if(!b.hasOwnProperty(q))b[q]=a[q]}}function mixinPropertiesEasy(a,b){Object.assign(b,a)}var z=function(){var s=function(){}
s.prototype={p:{}}
var r=new s()
if(!(r.__proto__&&r.__proto__.p===s.prototype.p))return false
try{if(typeof navigator!="undefined"&&typeof navigator.userAgent=="string"&&navigator.userAgent.indexOf("Chrome/")>=0)return true
if(typeof version=="function"&&version.length==0){var q=version()
if(/^\d+\.\d+\.\d+\.\d+$/.test(q))return true}}catch(p){}return false}()
function inherit(a,b){a.prototype.constructor=a
a.prototype["$i"+a.name]=a
if(b!=null){if(z){a.prototype.__proto__=b.prototype
return}var s=Object.create(b.prototype)
copyProperties(a.prototype,s)
a.prototype=s}}function inheritMany(a,b){for(var s=0;s<b.length;s++)inherit(b[s],a)}function mixinEasy(a,b){mixinPropertiesEasy(b.prototype,a.prototype)
a.prototype.constructor=a}function mixinHard(a,b){mixinPropertiesHard(b.prototype,a.prototype)
a.prototype.constructor=a}function lazyOld(a,b,c,d){var s=a
a[b]=s
a[c]=function(){a[c]=function(){A.fo(b)}
var r
var q=d
try{if(a[b]===s){r=a[b]=q
r=a[b]=d()}else r=a[b]}finally{if(r===q)a[b]=null
a[c]=function(){return this[b]}}return r}}function lazy(a,b,c,d){var s=a
a[b]=s
a[c]=function(){if(a[b]===s)a[b]=d()
a[c]=function(){return this[b]}
return a[b]}}function lazyFinal(a,b,c,d){var s=a
a[b]=s
a[c]=function(){if(a[b]===s){var r=d()
if(a[b]!==s)A.fp(b)
a[b]=r}var q=a[b]
a[c]=function(){return q}
return q}}function makeConstList(a){a.immutable$list=Array
a.fixed$length=Array
return a}function convertToFastObject(a){function t(){}t.prototype=a
new t()
return a}function convertAllToFastObject(a){for(var s=0;s<a.length;++s)convertToFastObject(a[s])}var y=0
function instanceTearOffGetter(a,b){var s=null
return a?function(c){if(s===null)s=A.cD(b)
return new s(c,this)}:function(){if(s===null)s=A.cD(b)
return new s(this,null)}}function staticTearOffGetter(a){var s=null
return function(){if(s===null)s=A.cD(a).prototype
return s}}var x=0
function tearOffParameters(a,b,c,d,e,f,g,h,i,j){if(typeof h=="number")h+=x
return{co:a,iS:b,iI:c,rC:d,dV:e,cs:f,fs:g,fT:h,aI:i||0,nDA:j}}function installStaticTearOff(a,b,c,d,e,f,g,h){var s=tearOffParameters(a,true,false,c,d,e,f,g,h,false)
var r=staticTearOffGetter(s)
a[b]=r}function installInstanceTearOff(a,b,c,d,e,f,g,h,i,j){c=!!c
var s=tearOffParameters(a,false,c,d,e,f,g,h,i,!!j)
var r=instanceTearOffGetter(c,s)
a[b]=r}function setOrUpdateInterceptorsByTag(a){var s=v.interceptorsByTag
if(!s){v.interceptorsByTag=a
return}copyProperties(a,s)}function setOrUpdateLeafTags(a){var s=v.leafTags
if(!s){v.leafTags=a
return}copyProperties(a,s)}function updateTypes(a){var s=v.types
var r=s.length
s.push.apply(s,a)
return r}function updateHolder(a,b){copyProperties(b,a)
return a}var hunkHelpers=function(){var s=function(a,b,c,d,e){return function(f,g,h,i){return installInstanceTearOff(f,g,a,b,c,d,[h],i,e,false)}},r=function(a,b,c,d){return function(e,f,g,h){return installStaticTearOff(e,f,a,b,c,[g],h,d)}}
return{inherit:inherit,inheritMany:inheritMany,mixin:mixinEasy,mixinHard:mixinHard,installStaticTearOff:installStaticTearOff,installInstanceTearOff:installInstanceTearOff,_instance_0u:s(0,0,null,["$0"],0),_instance_1u:s(0,1,null,["$1"],0),_instance_2u:s(0,2,null,["$2"],0),_instance_0i:s(1,0,null,["$0"],0),_instance_1i:s(1,1,null,["$1"],0),_instance_2i:s(1,2,null,["$2"],0),_static_0:r(0,null,["$0"],0),_static_1:r(1,null,["$1"],0),_static_2:r(2,null,["$2"],0),makeConstList:makeConstList,lazy:lazy,lazyFinal:lazyFinal,lazyOld:lazyOld,updateHolder:updateHolder,convertToFastObject:convertToFastObject,updateTypes:updateTypes,setOrUpdateInterceptorsByTag:setOrUpdateInterceptorsByTag,setOrUpdateLeafTags:setOrUpdateLeafTags}}()
function initializeDeferredHunk(a){x=v.types.length
a(hunkHelpers,v,w,$)}var A={cq:function cq(){},
e3(a){return new A.a8("Field '"+a+"' has not been initialized.")},
cC(a,b,c){return a},
e1(){return new A.aT("No element")},
a8:function a8(a){this.a=a},
aa:function aa(a,b,c){var _=this
_.a=a
_.b=b
_.c=0
_.d=null
_.$ti=c},
ab:function ab(a,b,c){this.a=a
this.b=b
this.$ti=c},
ac:function ac(a,b,c){var _=this
_.a=null
_.b=a
_.c=b
_.$ti=c},
ah:function ah(a,b,c){this.a=a
this.b=b
this.$ti=c},
ai:function ai(a,b,c){this.a=a
this.b=b
this.$ti=c},
dz(a){var s=v.mangledGlobalNames[a]
if(s!=null)return s
return"minified:"+a},
ff(a,b){var s
if(b!=null){s=b.x
if(s!=null)return s}return t.p.b(a)},
k(a){var s
if(typeof a=="string")return a
if(typeof a=="number"){if(a!==0)return""+a}else if(!0===a)return"true"
else if(!1===a)return"false"
else if(a==null)return"null"
s=J.bo(a)
return s},
bD(a){return A.e6(a)},
e6(a){var s,r,q,p
if(a instanceof A.l)return A.r(A.I(a),null)
s=J.bl(a)
if(s===B.u||s===B.w||t.B.b(a)){r=B.h(a)
if(r!=="Object"&&r!=="")return r
q=a.constructor
if(typeof q=="function"){p=q.name
if(typeof p=="string"&&p!=="Object"&&p!=="")return p}}return A.r(A.I(a),null)},
w(a,b){if(a==null)J.cK(a)
throw A.d(A.dq(a,b))},
dq(a,b){var s,r="index"
if(!A.df(b))return new A.K(!0,b,r,null)
s=A.c6(J.cK(a))
if(b<0||b>=s)return A.bz(b,s,a,r)
return new A.X(null,null,!0,b,r,"Value not in range")},
d(a){var s,r
if(a==null)a=new A.E()
s=new Error()
s.dartException=a
r=A.fq
if("defineProperty" in Object){Object.defineProperty(s,"message",{get:r})
s.name=""}else s.toString=r
return s},
fq(){return J.bo(this.dartException)},
bn(a){throw A.d(a)},
fn(a){throw A.d(A.cR(a))},
F(a){var s,r,q,p,o,n
a=A.fk(a.replace(String({}),"$receiver$"))
s=a.match(/\\\$[a-zA-Z]+\\\$/g)
if(s==null)s=A.a_([],t.s)
r=s.indexOf("\\$arguments\\$")
q=s.indexOf("\\$argumentsExpr\\$")
p=s.indexOf("\\$expr\\$")
o=s.indexOf("\\$method\\$")
n=s.indexOf("\\$receiver\\$")
return new A.bJ(a.replace(new RegExp("\\\\\\$arguments\\\\\\$","g"),"((?:x|[^x])*)").replace(new RegExp("\\\\\\$argumentsExpr\\\\\\$","g"),"((?:x|[^x])*)").replace(new RegExp("\\\\\\$expr\\\\\\$","g"),"((?:x|[^x])*)").replace(new RegExp("\\\\\\$method\\\\\\$","g"),"((?:x|[^x])*)").replace(new RegExp("\\\\\\$receiver\\\\\\$","g"),"((?:x|[^x])*)"),r,q,p,o,n)},
bK(a){return function($expr$){var $argumentsExpr$="$arguments$"
try{$expr$.$method$($argumentsExpr$)}catch(s){return s.message}}(a)},
cZ(a){return function($expr$){try{$expr$.$method$}catch(s){return s.message}}(a)},
cr(a,b){var s=b==null,r=s?null:b.method
return new A.aO(a,r,s?null:b.receiver)},
ay(a){if(a==null)return new A.bC(a)
if(typeof a!=="object")return a
if("dartException" in a)return A.U(a,a.dartException)
return A.f1(a)},
U(a,b){if(t.Q.b(b))if(b.$thrownJsError==null)b.$thrownJsError=a
return b},
f1(a){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e=null
if(!("message" in a))return a
s=a.message
if("number" in a&&typeof a.number=="number"){r=a.number
q=r&65535
if((B.j.a3(r,16)&8191)===10)switch(q){case 438:return A.U(a,A.cr(A.k(s)+" (Error "+q+")",e))
case 445:case 5007:p=A.k(s)
return A.U(a,new A.ae(p+" (Error "+q+")",e))}}if(a instanceof TypeError){o=$.dG()
n=$.dH()
m=$.dI()
l=$.dJ()
k=$.dM()
j=$.dN()
i=$.dL()
$.dK()
h=$.dP()
g=$.dO()
f=o.p(s)
if(f!=null)return A.U(a,A.cr(A.bh(s),f))
else{f=n.p(s)
if(f!=null){f.method="call"
return A.U(a,A.cr(A.bh(s),f))}else{f=m.p(s)
if(f==null){f=l.p(s)
if(f==null){f=k.p(s)
if(f==null){f=j.p(s)
if(f==null){f=i.p(s)
if(f==null){f=l.p(s)
if(f==null){f=h.p(s)
if(f==null){f=g.p(s)
p=f!=null}else p=!0}else p=!0}else p=!0}else p=!0}else p=!0}else p=!0}else p=!0
if(p){A.bh(s)
return A.U(a,new A.ae(s,f==null?e:f.method))}}}return A.U(a,new A.aZ(typeof s=="string"?s:""))}if(a instanceof RangeError){if(typeof s=="string"&&s.indexOf("call stack")!==-1)return new A.af()
s=function(b){try{return String(b)}catch(d){}return null}(a)
return A.U(a,new A.K(!1,e,e,typeof s=="string"?s.replace(/^RangeError:\s*/,""):s))}if(typeof InternalError=="function"&&a instanceof InternalError)if(typeof s=="string"&&s==="too much recursion")return new A.af()
return a},
av(a){var s
if(a==null)return new A.al(a)
s=a.$cachedTrace
if(s!=null)return s
return a.$cachedTrace=new A.al(a)},
fe(a,b,c,d,e,f){t.Z.a(a)
switch(A.c6(b)){case 0:return a.$0()
case 1:return a.$1(c)
case 2:return a.$2(c,d)
case 3:return a.$3(c,d,e)
case 4:return a.$4(c,d,e,f)}throw A.d(new A.bS("Unsupported number of arguments for wrapped closure"))},
bj(a,b){var s
if(a==null)return null
s=a.$identity
if(!!s)return s
s=function(c,d,e){return function(f,g,h,i){return e(c,d,f,g,h,i)}}(a,b,A.fe)
a.$identity=s
return s},
dY(a2){var s,r,q,p,o,n,m,l,k,j,i=a2.co,h=a2.iS,g=a2.iI,f=a2.nDA,e=a2.aI,d=a2.fs,c=a2.cs,b=d[0],a=c[0],a0=i[b],a1=a2.fT
a1.toString
s=h?Object.create(new A.aU().constructor.prototype):Object.create(new A.a4(null,null).constructor.prototype)
s.$initialize=s.constructor
if(h)r=function static_tear_off(){this.$initialize()}
else r=function tear_off(a3,a4){this.$initialize(a3,a4)}
s.constructor=r
r.prototype=s
s.$_name=b
s.$_target=a0
q=!h
if(q)p=A.cQ(b,a0,g,f)
else{s.$static_name=b
p=a0}s.$S=A.dU(a1,h,g)
s[a]=p
for(o=p,n=1;n<d.length;++n){m=d[n]
if(typeof m=="string"){l=i[m]
k=m
m=l}else k=""
j=c[n]
if(j!=null){if(q)m=A.cQ(k,m,g,f)
s[j]=m}if(n===e)o=m}s.$C=o
s.$R=a2.rC
s.$D=a2.dV
return r},
dU(a,b,c){if(typeof a=="number")return a
if(typeof a=="string"){if(b)throw A.d("Cannot compute signature for static tearoff.")
return function(d,e){return function(){return e(this,d)}}(a,A.dS)}throw A.d("Error in functionType of tearoff")},
dV(a,b,c,d){var s=A.cP
switch(b?-1:a){case 0:return function(e,f){return function(){return f(this)[e]()}}(c,s)
case 1:return function(e,f){return function(g){return f(this)[e](g)}}(c,s)
case 2:return function(e,f){return function(g,h){return f(this)[e](g,h)}}(c,s)
case 3:return function(e,f){return function(g,h,i){return f(this)[e](g,h,i)}}(c,s)
case 4:return function(e,f){return function(g,h,i,j){return f(this)[e](g,h,i,j)}}(c,s)
case 5:return function(e,f){return function(g,h,i,j,k){return f(this)[e](g,h,i,j,k)}}(c,s)
default:return function(e,f){return function(){return e.apply(f(this),arguments)}}(d,s)}},
cQ(a,b,c,d){var s,r
if(c)return A.dX(a,b,d)
s=b.length
r=A.dV(s,d,a,b)
return r},
dW(a,b,c,d){var s=A.cP,r=A.dT
switch(b?-1:a){case 0:throw A.d(new A.aQ("Intercepted function with no arguments."))
case 1:return function(e,f,g){return function(){return f(this)[e](g(this))}}(c,r,s)
case 2:return function(e,f,g){return function(h){return f(this)[e](g(this),h)}}(c,r,s)
case 3:return function(e,f,g){return function(h,i){return f(this)[e](g(this),h,i)}}(c,r,s)
case 4:return function(e,f,g){return function(h,i,j){return f(this)[e](g(this),h,i,j)}}(c,r,s)
case 5:return function(e,f,g){return function(h,i,j,k){return f(this)[e](g(this),h,i,j,k)}}(c,r,s)
case 6:return function(e,f,g){return function(h,i,j,k,l){return f(this)[e](g(this),h,i,j,k,l)}}(c,r,s)
default:return function(e,f,g){return function(){var q=[g(this)]
Array.prototype.push.apply(q,arguments)
return e.apply(f(this),q)}}(d,r,s)}},
dX(a,b,c){var s,r
if($.cN==null)$.cN=A.cM("interceptor")
if($.cO==null)$.cO=A.cM("receiver")
s=b.length
r=A.dW(s,c,a,b)
return r},
cD(a){return A.dY(a)},
dS(a,b){return A.c4(v.typeUniverse,A.I(a.a),b)},
cP(a){return a.a},
dT(a){return a.b},
cM(a){var s,r,q,p=new A.a4("receiver","interceptor"),o=J.cp(Object.getOwnPropertyNames(p),t.X)
for(s=o.length,r=0;r<s;++r){q=o[r]
if(p[q]===a)return q}throw A.d(A.bp("Field name "+a+" not found.",null))},
c9(a){if(a==null)A.f3("boolean expression must not be null")
return a},
f3(a){throw A.d(new A.b0(a))},
fo(a){throw A.d(new A.b5(a))},
f9(a){return v.getIsolateTag(a)},
h7(a,b,c){Object.defineProperty(a,b,{value:c,enumerable:false,writable:true,configurable:true})},
fh(a){var s,r,q,p,o,n=A.bh($.dv.$1(a)),m=$.ca[n]
if(m!=null){Object.defineProperty(a,v.dispatchPropertyName,{value:m,enumerable:false,writable:true,configurable:true})
return m.i}s=$.cf[n]
if(s!=null)return s
r=v.interceptorsByTag[n]
if(r==null){q=A.eB($.dn.$2(a,n))
if(q!=null){m=$.ca[q]
if(m!=null){Object.defineProperty(a,v.dispatchPropertyName,{value:m,enumerable:false,writable:true,configurable:true})
return m.i}s=$.cf[q]
if(s!=null)return s
r=v.interceptorsByTag[q]
n=q}}if(r==null)return null
s=r.prototype
p=n[0]
if(p==="!"){m=A.ch(s)
$.ca[n]=m
Object.defineProperty(a,v.dispatchPropertyName,{value:m,enumerable:false,writable:true,configurable:true})
return m.i}if(p==="~"){$.cf[n]=s
return s}if(p==="-"){o=A.ch(s)
Object.defineProperty(Object.getPrototypeOf(a),v.dispatchPropertyName,{value:o,enumerable:false,writable:true,configurable:true})
return o.i}if(p==="+")return A.dx(a,s)
if(p==="*")throw A.d(A.d_(n))
if(v.leafTags[n]===true){o=A.ch(s)
Object.defineProperty(Object.getPrototypeOf(a),v.dispatchPropertyName,{value:o,enumerable:false,writable:true,configurable:true})
return o.i}else return A.dx(a,s)},
dx(a,b){var s=Object.getPrototypeOf(a)
Object.defineProperty(s,v.dispatchPropertyName,{value:J.cF(b,s,null,null),enumerable:false,writable:true,configurable:true})
return b},
ch(a){return J.cF(a,!1,null,!!a.$iaN)},
fj(a,b,c){var s=b.prototype
if(v.leafTags[a]===true)return A.ch(s)
else return J.cF(s,c,null,null)},
fc(){if(!0===$.cE)return
$.cE=!0
A.fd()},
fd(){var s,r,q,p,o,n,m,l
$.ca=Object.create(null)
$.cf=Object.create(null)
A.fb()
s=v.interceptorsByTag
r=Object.getOwnPropertyNames(s)
if(typeof window!="undefined"){window
q=function(){}
for(p=0;p<r.length;++p){o=r[p]
n=$.dy.$1(o)
if(n!=null){m=A.fj(o,s[o],n)
if(m!=null){Object.defineProperty(n,v.dispatchPropertyName,{value:m,enumerable:false,writable:true,configurable:true})
q.prototype=n}}}}for(p=0;p<r.length;++p){o=r[p]
if(/^[A-Za-z_]/.test(o)){l=s[o]
s["!"+o]=l
s["~"+o]=l
s["-"+o]=l
s["+"+o]=l
s["*"+o]=l}}},
fb(){var s,r,q,p,o,n,m=B.l()
m=A.a0(B.m,A.a0(B.n,A.a0(B.i,A.a0(B.i,A.a0(B.o,A.a0(B.p,A.a0(B.q(B.h),m)))))))
if(typeof dartNativeDispatchHooksTransformer!="undefined"){s=dartNativeDispatchHooksTransformer
if(typeof s=="function")s=[s]
if(s.constructor==Array)for(r=0;r<s.length;++r){q=s[r]
if(typeof q=="function")m=q(m)||m}}p=m.getTag
o=m.getUnknownTag
n=m.prototypeForTag
$.dv=new A.cc(p)
$.dn=new A.cd(o)
$.dy=new A.ce(n)},
a0(a,b){return a(b)||b},
f8(a,b){var s=b.length,r=v.rttc[""+s+";"+a]
if(r==null)return null
if(s===0)return r
if(s===r.length)return r.apply(null,b)
return r(b)},
fm(a,b,c){var s=a.indexOf(b,c)
return s>=0},
fk(a){if(/[[\]{}()*+?.\\^$|]/.test(a))return a.replace(/[[\]{}()*+?.\\^$|]/g,"\\$&")
return a},
bJ:function bJ(a,b,c,d,e,f){var _=this
_.a=a
_.b=b
_.c=c
_.d=d
_.e=e
_.f=f},
ae:function ae(a,b){this.a=a
this.b=b},
aO:function aO(a,b,c){this.a=a
this.b=b
this.c=c},
aZ:function aZ(a){this.a=a},
bC:function bC(a){this.a=a},
al:function al(a){this.a=a
this.b=null},
Q:function Q(){},
aC:function aC(){},
aD:function aD(){},
aX:function aX(){},
aU:function aU(){},
a4:function a4(a,b){this.a=a
this.b=b},
b5:function b5(a){this.a=a},
aQ:function aQ(a){this.a=a},
b0:function b0(a){this.a=a},
cc:function cc(a){this.a=a},
cd:function cd(a){this.a=a},
ce:function ce(a){this.a=a},
cW(a,b){var s=b.c
return s==null?b.c=A.cy(a,b.y,!0):s},
cV(a,b){var s=b.c
return s==null?b.c=A.ao(a,"a5",[b.y]):s},
cX(a){var s=a.x
if(s===6||s===7||s===8)return A.cX(a.y)
return s===12||s===13},
e9(a){return a.at},
dr(a){return A.cz(v.typeUniverse,a,!1)},
P(a,b,a0,a1){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c=b.x
switch(c){case 5:case 1:case 2:case 3:case 4:return b
case 6:s=b.y
r=A.P(a,s,a0,a1)
if(r===s)return b
return A.d7(a,r,!0)
case 7:s=b.y
r=A.P(a,s,a0,a1)
if(r===s)return b
return A.cy(a,r,!0)
case 8:s=b.y
r=A.P(a,s,a0,a1)
if(r===s)return b
return A.d6(a,r,!0)
case 9:q=b.z
p=A.au(a,q,a0,a1)
if(p===q)return b
return A.ao(a,b.y,p)
case 10:o=b.y
n=A.P(a,o,a0,a1)
m=b.z
l=A.au(a,m,a0,a1)
if(n===o&&l===m)return b
return A.cw(a,n,l)
case 12:k=b.y
j=A.P(a,k,a0,a1)
i=b.z
h=A.eZ(a,i,a0,a1)
if(j===k&&h===i)return b
return A.d5(a,j,h)
case 13:g=b.z
a1+=g.length
f=A.au(a,g,a0,a1)
o=b.y
n=A.P(a,o,a0,a1)
if(f===g&&n===o)return b
return A.cx(a,n,f,!0)
case 14:e=b.y
if(e<a1)return b
d=a0[e-a1]
if(d==null)return b
return d
default:throw A.d(A.aB("Attempted to substitute unexpected RTI kind "+c))}},
au(a,b,c,d){var s,r,q,p,o=b.length,n=A.c5(o)
for(s=!1,r=0;r<o;++r){q=b[r]
p=A.P(a,q,c,d)
if(p!==q)s=!0
n[r]=p}return s?n:b},
f_(a,b,c,d){var s,r,q,p,o,n,m=b.length,l=A.c5(m)
for(s=!1,r=0;r<m;r+=3){q=b[r]
p=b[r+1]
o=b[r+2]
n=A.P(a,o,c,d)
if(n!==o)s=!0
l.splice(r,3,q,p,n)}return s?l:b},
eZ(a,b,c,d){var s,r=b.a,q=A.au(a,r,c,d),p=b.b,o=A.au(a,p,c,d),n=b.c,m=A.f_(a,n,c,d)
if(q===r&&o===p&&m===n)return b
s=new A.b8()
s.a=q
s.b=o
s.c=m
return s},
a_(a,b){a[v.arrayRti]=b
return a},
f7(a){var s,r=a.$S
if(r!=null){if(typeof r=="number")return A.fa(r)
s=a.$S()
return s}return null},
dw(a,b){var s
if(A.cX(b))if(a instanceof A.Q){s=A.f7(a)
if(s!=null)return s}return A.I(a)},
I(a){var s
if(a instanceof A.l){s=a.$ti
return s!=null?s:A.cA(a)}if(Array.isArray(a))return A.ar(a)
return A.cA(J.bl(a))},
ar(a){var s=a[v.arrayRti],r=t.b
if(s==null)return r
if(s.constructor!==r.constructor)return r
return s},
dc(a){var s=a.$ti
return s!=null?s:A.cA(a)},
cA(a){var s=a.constructor,r=s.$ccache
if(r!=null)return r
return A.eJ(a,s)},
eJ(a,b){var s=a instanceof A.Q?a.__proto__.__proto__.constructor:b,r=A.ex(v.typeUniverse,s.name)
b.$ccache=r
return r},
fa(a){var s,r=v.types,q=r[a]
if(typeof q=="string"){s=A.cz(v.typeUniverse,q,!1)
r[a]=s
return s}return q},
eI(a){var s,r,q,p,o,n,m=this
if(m===t.K)return A.O(m,a,A.eN)
if(!A.J(m))if(!(m===t._))s=!1
else s=!0
else s=!0
if(s)return A.O(m,a,A.eR)
s=m.x
if(s===1)return A.O(m,a,A.dg)
r=s===6?m.y:m
if(r===t.S)q=A.df
else if(r===t.i||r===t.q)q=A.eM
else if(r===t.R)q=A.eP
else q=r===t.v?A.dd:null
if(q!=null)return A.O(m,a,q)
p=r.x
if(p===9){o=r.y
if(r.z.every(A.fg)){m.r="$i"+o
if(o==="u")return A.O(m,a,A.eL)
return A.O(m,a,A.eQ)}}else if(s===7)return A.O(m,a,A.eG)
else if(p===11){n=A.f8(r.y,r.z)
return A.O(m,a,n==null?A.dg:n)}return A.O(m,a,A.eE)},
O(a,b,c){a.b=c
return a.b(b)},
eH(a){var s,r=this,q=A.eD
if(!A.J(r))if(!(r===t._))s=!1
else s=!0
else s=!0
if(s)q=A.eC
else if(r===t.K)q=A.eA
else{s=A.aw(r)
if(s)q=A.eF}r.a=q
return r.a(a)},
bi(a){var s,r=a.x
if(!A.J(a))if(!(a===t._))if(!(a===t.I))if(r!==7)if(!(r===6&&A.bi(a.y)))s=r===8&&A.bi(a.y)||a===t.P||a===t.T
else s=!0
else s=!0
else s=!0
else s=!0
else s=!0
return s},
eE(a){var s=this
if(a==null)return A.bi(s)
return A.j(v.typeUniverse,A.dw(a,s),null,s,null)},
eG(a){if(a==null)return!0
return this.y.b(a)},
eQ(a){var s,r=this
if(a==null)return A.bi(r)
s=r.r
if(a instanceof A.l)return!!a[s]
return!!J.bl(a)[s]},
eL(a){var s,r=this
if(a==null)return A.bi(r)
if(typeof a!="object")return!1
if(Array.isArray(a))return!0
s=r.r
if(a instanceof A.l)return!!a[s]
return!!J.bl(a)[s]},
eD(a){var s,r=this
if(a==null){s=A.aw(r)
if(s)return a}else if(r.b(a))return a
A.da(a,r)},
eF(a){var s=this
if(a==null)return a
else if(s.b(a))return a
A.da(a,s)},
da(a,b){throw A.d(A.em(A.d1(a,A.dw(a,b),A.r(b,null))))},
d1(a,b,c){var s=A.aF(a)
return s+": type '"+A.r(b==null?A.I(a):b,null)+"' is not a subtype of type '"+c+"'"},
em(a){return new A.am("TypeError: "+a)},
q(a,b){return new A.am("TypeError: "+A.d1(a,null,b))},
eN(a){return a!=null},
eA(a){if(a!=null)return a
throw A.d(A.q(a,"Object"))},
eR(a){return!0},
eC(a){return a},
dg(a){return!1},
dd(a){return!0===a||!1===a},
fX(a){if(!0===a)return!0
if(!1===a)return!1
throw A.d(A.q(a,"bool"))},
fZ(a){if(!0===a)return!0
if(!1===a)return!1
if(a==null)return a
throw A.d(A.q(a,"bool"))},
fY(a){if(!0===a)return!0
if(!1===a)return!1
if(a==null)return a
throw A.d(A.q(a,"bool?"))},
h_(a){if(typeof a=="number")return a
throw A.d(A.q(a,"double"))},
h1(a){if(typeof a=="number")return a
if(a==null)return a
throw A.d(A.q(a,"double"))},
h0(a){if(typeof a=="number")return a
if(a==null)return a
throw A.d(A.q(a,"double?"))},
df(a){return typeof a=="number"&&Math.floor(a)===a},
c6(a){if(typeof a=="number"&&Math.floor(a)===a)return a
throw A.d(A.q(a,"int"))},
h3(a){if(typeof a=="number"&&Math.floor(a)===a)return a
if(a==null)return a
throw A.d(A.q(a,"int"))},
h2(a){if(typeof a=="number"&&Math.floor(a)===a)return a
if(a==null)return a
throw A.d(A.q(a,"int?"))},
eM(a){return typeof a=="number"},
h4(a){if(typeof a=="number")return a
throw A.d(A.q(a,"num"))},
h5(a){if(typeof a=="number")return a
if(a==null)return a
throw A.d(A.q(a,"num"))},
ez(a){if(typeof a=="number")return a
if(a==null)return a
throw A.d(A.q(a,"num?"))},
eP(a){return typeof a=="string"},
bh(a){if(typeof a=="string")return a
throw A.d(A.q(a,"String"))},
h6(a){if(typeof a=="string")return a
if(a==null)return a
throw A.d(A.q(a,"String"))},
eB(a){if(typeof a=="string")return a
if(a==null)return a
throw A.d(A.q(a,"String?"))},
dl(a,b){var s,r,q
for(s="",r="",q=0;q<a.length;++q,r=", ")s+=r+A.r(a[q],b)
return s},
eU(a,b){var s,r,q,p,o,n,m=a.y,l=a.z
if(""===m)return"("+A.dl(l,b)+")"
s=l.length
r=m.split(",")
q=r.length-s
for(p="(",o="",n=0;n<s;++n,o=", "){p+=o
if(q===0)p+="{"
p+=A.r(l[n],b)
if(q>=0)p+=" "+r[q];++q}return p+"})"},
db(a4,a5,a6){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3=", "
if(a6!=null){s=a6.length
if(a5==null){a5=A.a_([],t.s)
r=null}else r=a5.length
q=a5.length
for(p=s;p>0;--p)B.a.m(a5,"T"+(q+p))
for(o=t.X,n=t._,m="<",l="",p=0;p<s;++p,l=a3){k=a5.length
j=k-1-p
if(!(j>=0))return A.w(a5,j)
m=B.d.W(m+l,a5[j])
i=a6[p]
h=i.x
if(!(h===2||h===3||h===4||h===5||i===o))if(!(i===n))k=!1
else k=!0
else k=!0
if(!k)m+=" extends "+A.r(i,a5)}m+=">"}else{m=""
r=null}o=a4.y
g=a4.z
f=g.a
e=f.length
d=g.b
c=d.length
b=g.c
a=b.length
a0=A.r(o,a5)
for(a1="",a2="",p=0;p<e;++p,a2=a3)a1+=a2+A.r(f[p],a5)
if(c>0){a1+=a2+"["
for(a2="",p=0;p<c;++p,a2=a3)a1+=a2+A.r(d[p],a5)
a1+="]"}if(a>0){a1+=a2+"{"
for(a2="",p=0;p<a;p+=3,a2=a3){a1+=a2
if(b[p+1])a1+="required "
a1+=A.r(b[p+2],a5)+" "+b[p]}a1+="}"}if(r!=null){a5.toString
a5.length=r}return m+"("+a1+") => "+a0},
r(a,b){var s,r,q,p,o,n,m,l=a.x
if(l===5)return"erased"
if(l===2)return"dynamic"
if(l===3)return"void"
if(l===1)return"Never"
if(l===4)return"any"
if(l===6){s=A.r(a.y,b)
return s}if(l===7){r=a.y
s=A.r(r,b)
q=r.x
return(q===12||q===13?"("+s+")":s)+"?"}if(l===8)return"FutureOr<"+A.r(a.y,b)+">"
if(l===9){p=A.f0(a.y)
o=a.z
return o.length>0?p+("<"+A.dl(o,b)+">"):p}if(l===11)return A.eU(a,b)
if(l===12)return A.db(a,b,null)
if(l===13)return A.db(a.y,b,a.z)
if(l===14){n=a.y
m=b.length
n=m-1-n
if(!(n>=0&&n<m))return A.w(b,n)
return b[n]}return"?"},
f0(a){var s=v.mangledGlobalNames[a]
if(s!=null)return s
return"minified:"+a},
ey(a,b){var s=a.tR[b]
for(;typeof s=="string";)s=a.tR[s]
return s},
ex(a,b){var s,r,q,p,o,n=a.eT,m=n[b]
if(m==null)return A.cz(a,b,!1)
else if(typeof m=="number"){s=m
r=A.ap(a,5,"#")
q=A.c5(s)
for(p=0;p<s;++p)q[p]=r
o=A.ao(a,b,q)
n[b]=o
return o}else return m},
ev(a,b){return A.d8(a.tR,b)},
eu(a,b){return A.d8(a.eT,b)},
cz(a,b,c){var s,r=a.eC,q=r.get(b)
if(q!=null)return q
s=A.d4(A.d2(a,null,b,c))
r.set(b,s)
return s},
c4(a,b,c){var s,r,q=b.Q
if(q==null)q=b.Q=new Map()
s=q.get(c)
if(s!=null)return s
r=A.d4(A.d2(a,b,c,!0))
q.set(c,r)
return r},
ew(a,b,c){var s,r,q,p=b.as
if(p==null)p=b.as=new Map()
s=c.at
r=p.get(s)
if(r!=null)return r
q=A.cw(a,b,c.x===10?c.z:[c])
p.set(s,q)
return q},
G(a,b){b.a=A.eH
b.b=A.eI
return b},
ap(a,b,c){var s,r,q=a.eC.get(c)
if(q!=null)return q
s=new A.v(null,null)
s.x=b
s.at=c
r=A.G(a,s)
a.eC.set(c,r)
return r},
d7(a,b,c){var s,r=b.at+"*",q=a.eC.get(r)
if(q!=null)return q
s=A.er(a,b,r,c)
a.eC.set(r,s)
return s},
er(a,b,c,d){var s,r,q
if(d){s=b.x
if(!A.J(b))r=b===t.P||b===t.T||s===7||s===6
else r=!0
if(r)return b}q=new A.v(null,null)
q.x=6
q.y=b
q.at=c
return A.G(a,q)},
cy(a,b,c){var s,r=b.at+"?",q=a.eC.get(r)
if(q!=null)return q
s=A.eq(a,b,r,c)
a.eC.set(r,s)
return s},
eq(a,b,c,d){var s,r,q,p
if(d){s=b.x
if(!A.J(b))if(!(b===t.P||b===t.T))if(s!==7)r=s===8&&A.aw(b.y)
else r=!0
else r=!0
else r=!0
if(r)return b
else if(s===1||b===t.I)return t.P
else if(s===6){q=b.y
if(q.x===8&&A.aw(q.y))return q
else return A.cW(a,b)}}p=new A.v(null,null)
p.x=7
p.y=b
p.at=c
return A.G(a,p)},
d6(a,b,c){var s,r=b.at+"/",q=a.eC.get(r)
if(q!=null)return q
s=A.eo(a,b,r,c)
a.eC.set(r,s)
return s},
eo(a,b,c,d){var s,r,q
if(d){s=b.x
if(!A.J(b))if(!(b===t._))r=!1
else r=!0
else r=!0
if(r||b===t.K)return b
else if(s===1)return A.ao(a,"a5",[b])
else if(b===t.P||b===t.T)return t.U}q=new A.v(null,null)
q.x=8
q.y=b
q.at=c
return A.G(a,q)},
es(a,b){var s,r,q=""+b+"^",p=a.eC.get(q)
if(p!=null)return p
s=new A.v(null,null)
s.x=14
s.y=b
s.at=q
r=A.G(a,s)
a.eC.set(q,r)
return r},
an(a){var s,r,q,p=a.length
for(s="",r="",q=0;q<p;++q,r=",")s+=r+a[q].at
return s},
en(a){var s,r,q,p,o,n=a.length
for(s="",r="",q=0;q<n;q+=3,r=","){p=a[q]
o=a[q+1]?"!":":"
s+=r+p+o+a[q+2].at}return s},
ao(a,b,c){var s,r,q,p=b
if(c.length>0)p+="<"+A.an(c)+">"
s=a.eC.get(p)
if(s!=null)return s
r=new A.v(null,null)
r.x=9
r.y=b
r.z=c
if(c.length>0)r.c=c[0]
r.at=p
q=A.G(a,r)
a.eC.set(p,q)
return q},
cw(a,b,c){var s,r,q,p,o,n
if(b.x===10){s=b.y
r=b.z.concat(c)}else{r=c
s=b}q=s.at+(";<"+A.an(r)+">")
p=a.eC.get(q)
if(p!=null)return p
o=new A.v(null,null)
o.x=10
o.y=s
o.z=r
o.at=q
n=A.G(a,o)
a.eC.set(q,n)
return n},
et(a,b,c){var s,r,q="+"+(b+"("+A.an(c)+")"),p=a.eC.get(q)
if(p!=null)return p
s=new A.v(null,null)
s.x=11
s.y=b
s.z=c
s.at=q
r=A.G(a,s)
a.eC.set(q,r)
return r},
d5(a,b,c){var s,r,q,p,o,n=b.at,m=c.a,l=m.length,k=c.b,j=k.length,i=c.c,h=i.length,g="("+A.an(m)
if(j>0){s=l>0?",":""
g+=s+"["+A.an(k)+"]"}if(h>0){s=l>0?",":""
g+=s+"{"+A.en(i)+"}"}r=n+(g+")")
q=a.eC.get(r)
if(q!=null)return q
p=new A.v(null,null)
p.x=12
p.y=b
p.z=c
p.at=r
o=A.G(a,p)
a.eC.set(r,o)
return o},
cx(a,b,c,d){var s,r=b.at+("<"+A.an(c)+">"),q=a.eC.get(r)
if(q!=null)return q
s=A.ep(a,b,c,r,d)
a.eC.set(r,s)
return s},
ep(a,b,c,d,e){var s,r,q,p,o,n,m,l
if(e){s=c.length
r=A.c5(s)
for(q=0,p=0;p<s;++p){o=c[p]
if(o.x===1){r[p]=o;++q}}if(q>0){n=A.P(a,b,r,0)
m=A.au(a,c,r,0)
return A.cx(a,n,m,c!==m)}}l=new A.v(null,null)
l.x=13
l.y=b
l.z=c
l.at=d
return A.G(a,l)},
d2(a,b,c,d){return{u:a,e:b,r:c,s:[],p:0,n:d}},
d4(a){var s,r,q,p,o,n,m,l,k,j=a.r,i=a.s
for(s=j.length,r=0;r<s;){q=j.charCodeAt(r)
if(q>=48&&q<=57)r=A.eh(r+1,q,j,i)
else if((((q|32)>>>0)-97&65535)<26||q===95||q===36||q===124)r=A.d3(a,r,j,i,!1)
else if(q===46)r=A.d3(a,r,j,i,!0)
else{++r
switch(q){case 44:break
case 58:i.push(!1)
break
case 33:i.push(!0)
break
case 59:i.push(A.N(a.u,a.e,i.pop()))
break
case 94:i.push(A.es(a.u,i.pop()))
break
case 35:i.push(A.ap(a.u,5,"#"))
break
case 64:i.push(A.ap(a.u,2,"@"))
break
case 126:i.push(A.ap(a.u,3,"~"))
break
case 60:i.push(a.p)
a.p=i.length
break
case 62:p=a.u
o=i.splice(a.p)
A.cv(a.u,a.e,o)
a.p=i.pop()
n=i.pop()
if(typeof n=="string")i.push(A.ao(p,n,o))
else{m=A.N(p,a.e,n)
switch(m.x){case 12:i.push(A.cx(p,m,o,a.n))
break
default:i.push(A.cw(p,m,o))
break}}break
case 38:A.ei(a,i)
break
case 42:p=a.u
i.push(A.d7(p,A.N(p,a.e,i.pop()),a.n))
break
case 63:p=a.u
i.push(A.cy(p,A.N(p,a.e,i.pop()),a.n))
break
case 47:p=a.u
i.push(A.d6(p,A.N(p,a.e,i.pop()),a.n))
break
case 40:i.push(-3)
i.push(a.p)
a.p=i.length
break
case 41:A.eg(a,i)
break
case 91:i.push(a.p)
a.p=i.length
break
case 93:o=i.splice(a.p)
A.cv(a.u,a.e,o)
a.p=i.pop()
i.push(o)
i.push(-1)
break
case 123:i.push(a.p)
a.p=i.length
break
case 125:o=i.splice(a.p)
A.ek(a.u,a.e,o)
a.p=i.pop()
i.push(o)
i.push(-2)
break
case 43:l=j.indexOf("(",r)
i.push(j.substring(r,l))
i.push(-4)
i.push(a.p)
a.p=i.length
r=l+1
break
default:throw"Bad character "+q}}}k=i.pop()
return A.N(a.u,a.e,k)},
eh(a,b,c,d){var s,r,q=b-48
for(s=c.length;a<s;++a){r=c.charCodeAt(a)
if(!(r>=48&&r<=57))break
q=q*10+(r-48)}d.push(q)
return a},
d3(a,b,c,d,e){var s,r,q,p,o,n,m=b+1
for(s=c.length;m<s;++m){r=c.charCodeAt(m)
if(r===46){if(e)break
e=!0}else{if(!((((r|32)>>>0)-97&65535)<26||r===95||r===36||r===124))q=r>=48&&r<=57
else q=!0
if(!q)break}}p=c.substring(b,m)
if(e){s=a.u
o=a.e
if(o.x===10)o=o.y
n=A.ey(s,o.y)[p]
if(n==null)A.bn('No "'+p+'" in "'+A.e9(o)+'"')
d.push(A.c4(s,o,n))}else d.push(p)
return m},
eg(a,b){var s,r,q,p,o,n=null,m=a.u,l=b.pop()
if(typeof l=="number")switch(l){case-1:s=b.pop()
r=n
break
case-2:r=b.pop()
s=n
break
default:b.push(l)
r=n
s=r
break}else{b.push(l)
r=n
s=r}q=A.ef(a,b)
l=b.pop()
switch(l){case-3:l=b.pop()
if(s==null)s=m.sEA
if(r==null)r=m.sEA
p=A.N(m,a.e,l)
o=new A.b8()
o.a=q
o.b=s
o.c=r
b.push(A.d5(m,p,o))
return
case-4:b.push(A.et(m,b.pop(),q))
return
default:throw A.d(A.aB("Unexpected state under `()`: "+A.k(l)))}},
ei(a,b){var s=b.pop()
if(0===s){b.push(A.ap(a.u,1,"0&"))
return}if(1===s){b.push(A.ap(a.u,4,"1&"))
return}throw A.d(A.aB("Unexpected extended operation "+A.k(s)))},
ef(a,b){var s=b.splice(a.p)
A.cv(a.u,a.e,s)
a.p=b.pop()
return s},
N(a,b,c){if(typeof c=="string")return A.ao(a,c,a.sEA)
else if(typeof c=="number"){b.toString
return A.ej(a,b,c)}else return c},
cv(a,b,c){var s,r=c.length
for(s=0;s<r;++s)c[s]=A.N(a,b,c[s])},
ek(a,b,c){var s,r=c.length
for(s=2;s<r;s+=3)c[s]=A.N(a,b,c[s])},
ej(a,b,c){var s,r,q=b.x
if(q===10){if(c===0)return b.y
s=b.z
r=s.length
if(c<=r)return s[c-1]
c-=r
b=b.y
q=b.x}else if(c===0)return b
if(q!==9)throw A.d(A.aB("Indexed base must be an interface type"))
s=b.z
if(c<=s.length)return s[c-1]
throw A.d(A.aB("Bad index "+c+" for "+b.h(0)))},
j(a,b,c,d,e){var s,r,q,p,o,n,m,l,k,j
if(b===d)return!0
if(!A.J(d))if(!(d===t._))s=!1
else s=!0
else s=!0
if(s)return!0
r=b.x
if(r===4)return!0
if(A.J(b))return!1
if(b.x!==1)s=!1
else s=!0
if(s)return!0
q=r===14
if(q)if(A.j(a,c[b.y],c,d,e))return!0
p=d.x
s=b===t.P||b===t.T
if(s){if(p===8)return A.j(a,b,c,d.y,e)
return d===t.P||d===t.T||p===7||p===6}if(d===t.K){if(r===8)return A.j(a,b.y,c,d,e)
if(r===6)return A.j(a,b.y,c,d,e)
return r!==7}if(r===6)return A.j(a,b.y,c,d,e)
if(p===6){s=A.cW(a,d)
return A.j(a,b,c,s,e)}if(r===8){if(!A.j(a,b.y,c,d,e))return!1
return A.j(a,A.cV(a,b),c,d,e)}if(r===7){s=A.j(a,t.P,c,d,e)
return s&&A.j(a,b.y,c,d,e)}if(p===8){if(A.j(a,b,c,d.y,e))return!0
return A.j(a,b,c,A.cV(a,d),e)}if(p===7){s=A.j(a,b,c,t.P,e)
return s||A.j(a,b,c,d.y,e)}if(q)return!1
s=r!==12
if((!s||r===13)&&d===t.Z)return!0
if(p===13){if(b===t.g)return!0
if(r!==13)return!1
o=b.z
n=d.z
m=o.length
if(m!==n.length)return!1
c=c==null?o:o.concat(c)
e=e==null?n:n.concat(e)
for(l=0;l<m;++l){k=o[l]
j=n[l]
if(!A.j(a,k,c,j,e)||!A.j(a,j,e,k,c))return!1}return A.de(a,b.y,c,d.y,e)}if(p===12){if(b===t.g)return!0
if(s)return!1
return A.de(a,b,c,d,e)}if(r===9){if(p!==9)return!1
return A.eK(a,b,c,d,e)}s=r===11
if(s&&d===t.L)return!0
if(s&&p===11)return A.eO(a,b,c,d,e)
return!1},
de(a3,a4,a5,a6,a7){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2
if(!A.j(a3,a4.y,a5,a6.y,a7))return!1
s=a4.z
r=a6.z
q=s.a
p=r.a
o=q.length
n=p.length
if(o>n)return!1
m=n-o
l=s.b
k=r.b
j=l.length
i=k.length
if(o+j<n+i)return!1
for(h=0;h<o;++h){g=q[h]
if(!A.j(a3,p[h],a7,g,a5))return!1}for(h=0;h<m;++h){g=l[h]
if(!A.j(a3,p[o+h],a7,g,a5))return!1}for(h=0;h<i;++h){g=l[m+h]
if(!A.j(a3,k[h],a7,g,a5))return!1}f=s.c
e=r.c
d=f.length
c=e.length
for(b=0,a=0;a<c;a+=3){a0=e[a]
for(;!0;){if(b>=d)return!1
a1=f[b]
b+=3
if(a0<a1)return!1
a2=f[b-2]
if(a1<a0){if(a2)return!1
continue}g=e[a+1]
if(a2&&!g)return!1
g=f[b-1]
if(!A.j(a3,e[a+2],a7,g,a5))return!1
break}}for(;b<d;){if(f[b+1])return!1
b+=3}return!0},
eK(a,b,c,d,e){var s,r,q,p,o,n,m,l=b.y,k=d.y
for(;l!==k;){s=a.tR[l]
if(s==null)return!1
if(typeof s=="string"){l=s
continue}r=s[k]
if(r==null)return!1
q=r.length
p=q>0?new Array(q):v.typeUniverse.sEA
for(o=0;o<q;++o)p[o]=A.c4(a,b,r[o])
return A.d9(a,p,null,c,d.z,e)}n=b.z
m=d.z
return A.d9(a,n,null,c,m,e)},
d9(a,b,c,d,e,f){var s,r,q,p=b.length
for(s=0;s<p;++s){r=b[s]
q=e[s]
if(!A.j(a,r,d,q,f))return!1}return!0},
eO(a,b,c,d,e){var s,r=b.z,q=d.z,p=r.length
if(p!==q.length)return!1
if(b.y!==d.y)return!1
for(s=0;s<p;++s)if(!A.j(a,r[s],c,q[s],e))return!1
return!0},
aw(a){var s,r=a.x
if(!(a===t.P||a===t.T))if(!A.J(a))if(r!==7)if(!(r===6&&A.aw(a.y)))s=r===8&&A.aw(a.y)
else s=!0
else s=!0
else s=!0
else s=!0
return s},
fg(a){var s
if(!A.J(a))if(!(a===t._))s=!1
else s=!0
else s=!0
return s},
J(a){var s=a.x
return s===2||s===3||s===4||s===5||a===t.X},
d8(a,b){var s,r,q=Object.keys(b),p=q.length
for(s=0;s<p;++s){r=q[s]
a[r]=b[r]}},
c5(a){return a>0?new Array(a):v.typeUniverse.sEA},
v:function v(a,b){var _=this
_.a=a
_.b=b
_.w=_.r=_.c=null
_.x=0
_.at=_.as=_.Q=_.z=_.y=null},
b8:function b8(){this.c=this.b=this.a=null},
b6:function b6(){},
am:function am(a){this.a=a},
ea(){var s,r,q={}
if(self.scheduleImmediate!=null)return A.f4()
if(self.MutationObserver!=null&&self.document!=null){s=self.document.createElement("div")
r=self.document.createElement("span")
q.a=null
new self.MutationObserver(A.bj(new A.bN(q),1)).observe(s,{childList:true})
return new A.bM(q,s,r)}else if(self.setImmediate!=null)return A.f5()
return A.f6()},
eb(a){self.scheduleImmediate(A.bj(new A.bO(t.M.a(a)),0))},
ec(a){self.setImmediate(A.bj(new A.bP(t.M.a(a)),0))},
ed(a){t.M.a(a)
A.el(0,a)},
el(a,b){var s=new A.c2()
s.a_(a,b)
return s},
cm(a,b){var s=A.cC(a,"error",t.K)
return new A.a3(s,b==null?A.dR(a):b)},
dR(a){var s
if(t.Q.b(a)){s=a.gD()
if(s!=null)return s}return B.t},
ee(a,b){var s,r,q
for(s=t.c;r=a.a,(r&4)!==0;)a=s.a(a.c)
if((r&24)!==0){q=b.S()
b.E(a)
A.b9(b,q)}else{q=t.F.a(b.c)
b.a=b.a&1|4
b.c=a
a.R(q)}},
b9(a,a0){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c={},b=c.a=a
for(s=t.n,r=t.F,q=t.d;!0;){p={}
o=b.a
n=(o&16)===0
m=!n
if(a0==null){if(m&&(o&1)===0){l=s.a(b.c)
A.c7(l.a,l.b)}return}p.a=a0
k=a0.a
for(b=a0;k!=null;b=k,k=j){b.a=null
A.b9(c.a,b)
p.a=k
j=k.a}o=c.a
i=o.c
p.b=m
p.c=i
if(n){h=b.c
h=(h&1)!==0||(h&15)===8}else h=!0
if(h){g=b.b.b
if(m){o=o.b===g
o=!(o||o)}else o=!1
if(o){s.a(i)
A.c7(i.a,i.b)
return}f=$.m
if(f!==g)$.m=g
else f=null
b=b.c
if((b&15)===8)new A.bX(p,c,m).$0()
else if(n){if((b&1)!==0)new A.bW(p,i).$0()}else if((b&2)!==0)new A.bV(c,p).$0()
if(f!=null)$.m=f
b=p.c
if(q.b(b)){o=p.a.$ti
o=o.i("a5<2>").b(b)||!o.z[1].b(b)}else o=!1
if(o){q.a(b)
e=p.a.b
if((b.a&24)!==0){d=r.a(e.c)
e.c=null
a0=e.B(d)
e.a=b.a&30|e.a&1
e.c=b.c
c.a=b
continue}else A.ee(b,e)
return}}e=p.a.b
d=r.a(e.c)
e.c=null
a0=e.B(d)
b=p.b
o=p.c
if(!b){e.$ti.c.a(o)
e.a=8
e.c=o}else{s.a(o)
e.a=e.a&1|16
e.c=o}c.a=e
b=e}},
eV(a,b){var s=t.C
if(s.b(a))return s.a(a)
s=t.y
if(s.b(a))return s.a(a)
throw A.d(A.cL(a,"onError",u.c))},
eT(){var s,r
for(s=$.Z;s!=null;s=$.Z){$.at=null
r=s.b
$.Z=r
if(r==null)$.as=null
s.a.$0()}},
eY(){$.cB=!0
try{A.eT()}finally{$.at=null
$.cB=!1
if($.Z!=null)$.cH().$1(A.dp())}},
dm(a){var s=new A.b1(a),r=$.as
if(r==null){$.Z=$.as=s
if(!$.cB)$.cH().$1(A.dp())}else $.as=r.b=s},
eX(a){var s,r,q,p=$.Z
if(p==null){A.dm(a)
$.at=$.as
return}s=new A.b1(a)
r=$.at
if(r==null){s.b=p
$.Z=$.at=s}else{q=r.b
s.b=q
$.at=r.b=s
if(q==null)$.as=s}},
c7(a,b){A.eX(new A.c8(a,b))},
di(a,b,c,d,e){var s,r=$.m
if(r===c)return d.$0()
$.m=c
s=r
try{r=d.$0()
return r}finally{$.m=s}},
dj(a,b,c,d,e,f,g){var s,r=$.m
if(r===c)return d.$1(e)
$.m=c
s=r
try{r=d.$1(e)
return r}finally{$.m=s}},
eW(a,b,c,d,e,f,g,h,i){var s,r=$.m
if(r===c)return d.$2(e,f)
$.m=c
s=r
try{r=d.$2(e,f)
return r}finally{$.m=s}},
dk(a,b,c,d){t.M.a(d)
if(B.b!==c)d=c.a5(d)
A.dm(d)},
bN:function bN(a){this.a=a},
bM:function bM(a,b,c){this.a=a
this.b=b
this.c=c},
bO:function bO(a){this.a=a},
bP:function bP(a){this.a=a},
c2:function c2(){},
c3:function c3(a,b){this.a=a
this.b=b},
a3:function a3(a,b){this.a=a
this.b=b},
aj:function aj(a,b,c,d,e){var _=this
_.a=null
_.b=a
_.c=b
_.d=c
_.e=d
_.$ti=e},
z:function z(a,b){var _=this
_.a=0
_.b=a
_.c=null
_.$ti=b},
bT:function bT(a,b){this.a=a
this.b=b},
bU:function bU(a,b){this.a=a
this.b=b},
bX:function bX(a,b,c){this.a=a
this.b=b
this.c=c},
bY:function bY(a){this.a=a},
bW:function bW(a,b){this.a=a
this.b=b},
bV:function bV(a,b){this.a=a
this.b=b},
b1:function b1(a){this.a=a
this.b=null},
aV:function aV(){},
bG:function bG(a,b){this.a=a
this.b=b},
bH:function bH(a,b){this.a=a
this.b=b},
aW:function aW(){},
aq:function aq(){},
c8:function c8(a,b){this.a=a
this.b=b},
be:function be(){},
c0:function c0(a,b){this.a=a
this.b=b},
c1:function c1(a,b,c){this.a=a
this.b=b
this.c=c},
e0(a,b,c){var s,r
if(A.dh(a)){if(b==="("&&c===")")return"(...)"
return b+"..."+c}s=A.a_([],t.s)
B.a.m($.H,a)
try{A.eS(a,s)}finally{if(0>=$.H.length)return A.w($.H,-1)
$.H.pop()}r=A.cY(b,t.N.a(s),", ")+c
return r.charCodeAt(0)==0?r:r},
cS(a,b,c){var s,r
if(A.dh(a))return b+"..."+c
s=new A.bI(b)
B.a.m($.H,a)
try{r=s
r.a=A.cY(r.a,a,", ")}finally{if(0>=$.H.length)return A.w($.H,-1)
$.H.pop()}s.a+=c
r=s.a
return r.charCodeAt(0)==0?r:r},
dh(a){var s,r
for(s=$.H.length,r=0;r<s;++r)if(a===$.H[r])return!0
return!1},
eS(a,b){var s,r,q,p,o,n,m,l=a.gn(a),k=0,j=0
while(!0){if(!(k<80||j<3))break
if(!l.l())return
s=A.k(l.gk())
B.a.m(b,s)
k+=s.length+2;++j}if(!l.l()){if(j<=5)return
if(0>=b.length)return A.w(b,-1)
r=b.pop()
if(0>=b.length)return A.w(b,-1)
q=b.pop()}else{p=l.gk();++j
if(!l.l()){if(j<=4){B.a.m(b,A.k(p))
return}r=A.k(p)
if(0>=b.length)return A.w(b,-1)
q=b.pop()
k+=r.length+2}else{o=l.gk();++j
for(;l.l();p=o,o=n){n=l.gk();++j
if(j>100){while(!0){if(!(k>75&&j>3))break
if(0>=b.length)return A.w(b,-1)
k-=b.pop().length+2;--j}B.a.m(b,"...")
return}}q=A.k(p)
r=A.k(o)
k+=r.length+q.length+4}}if(j>b.length+2){k+=5
m="..."}else m=null
while(!0){if(!(k>80&&b.length>3))break
if(0>=b.length)return A.w(b,-1)
k-=b.pop().length+2
if(m==null){k+=5
m="..."}}if(m!=null)B.a.m(b,m)
B.a.m(b,q)
B.a.m(b,r)},
a9:function a9(){},
i:function i(){},
ak:function ak(){},
dZ(a){if(a instanceof A.Q)return a.h(0)
return"Instance of '"+A.bD(a)+"'"},
e_(a,b){a=A.d(a)
if(a==null)a=t.K.a(a)
a.stack=b.h(0)
throw a
throw A.d("unreachable")},
e4(a,b,c,d){var s,r=c?J.cT(a,d):J.e2(a,d)
if(a!==0&&!0)for(s=0;s<r.length;++s)r[s]=b
return r},
e5(a,b,c){var s,r=A.a_([],c.i("p<0>"))
for(s=a.gn(a);s.l();)B.a.m(r,c.a(s.gk()))
if(b)return r
return J.cp(r,c)},
cY(a,b,c){var s=J.cJ(b)
if(!s.l())return a
if(c.length===0){do a+=A.k(s.gk())
while(s.l())}else{a+=A.k(s.gk())
for(;s.l();)a=a+c+A.k(s.gk())}return a},
aF(a){if(typeof a=="number"||A.dd(a)||a==null)return J.bo(a)
if(typeof a=="string")return JSON.stringify(a)
return A.dZ(a)},
aB(a){return new A.a2(a)},
bp(a,b){return new A.K(!1,null,b,a)},
cL(a,b,c){return new A.K(!0,a,b,c)},
e7(a){var s=null
return new A.X(s,s,!1,s,s,a)},
cs(a,b,c,d,e){return new A.X(b,c,!0,a,d,"Invalid value")},
e8(a,b){if(a<0)throw A.d(A.cs(a,0,null,b,null))
return a},
bz(a,b,c,d){return new A.aI(b,!0,a,d,"Index out of range")},
ct(a){return new A.b_(a)},
d_(a){return new A.aY(a)},
cR(a){return new A.aE(a)},
h:function h(){},
a2:function a2(a){this.a=a},
E:function E(){},
K:function K(a,b,c,d){var _=this
_.a=a
_.b=b
_.c=c
_.d=d},
X:function X(a,b,c,d,e,f){var _=this
_.e=a
_.f=b
_.a=c
_.b=d
_.c=e
_.d=f},
aI:function aI(a,b,c,d,e){var _=this
_.f=a
_.a=b
_.b=c
_.c=d
_.d=e},
b_:function b_(a){this.a=a},
aY:function aY(a){this.a=a},
aT:function aT(a){this.a=a},
aE:function aE(a){this.a=a},
af:function af(){},
bS:function bS(a){this.a=a},
n:function n(){},
x:function x(){},
y:function y(){},
l:function l(){},
bf:function bf(){},
bI:function bI(a){this.a=a},
cu(a,b,c,d,e){var s=A.f2(new A.bR(c),t.z),r=s!=null
if(r&&!0){t.o.a(s)
if(r)B.x.a0(a,b,s,!1)}return new A.b7(a,b,s,!1,e.i("b7<0>"))},
f2(a,b){var s=$.m
if(s===B.b)return a
return s.a6(a,b)},
b:function b(){},
az:function az(){},
aA:function aA(){},
A:function A(){},
V:function V(){},
bu:function bu(){},
bw:function bw(){},
b3:function b3(a,b){this.a=a
this.b=b},
f:function f(){},
a:function a(){},
o:function o(){},
aH:function aH(){},
L:function L(){},
b2:function b2(a){this.a=a},
e:function e(){},
ad:function ad(){},
aR:function aR(){},
Y:function Y(){},
co:function co(a,b){this.a=a
this.$ti=b},
bQ:function bQ(a,b,c,d){var _=this
_.a=a
_.b=b
_.c=c
_.$ti=d},
b7:function b7(a,b,c,d,e){var _=this
_.b=a
_.c=b
_.d=c
_.e=d
_.$ti=e},
bR:function bR(a){this.a=a},
B:function B(){},
R:function R(a,b,c){var _=this
_.a=a
_.b=b
_.c=-1
_.d=null
_.$ti=c},
b4:function b4(){},
ba:function ba(){},
bb:function bb(){},
bc:function bc(){},
bd:function bd(){},
cn(){return window.navigator.userAgent},
aG:function aG(a){this.b=a},
bx:function bx(){},
by:function by(){},
bZ:function bZ(){},
c:function c(){},
fl(a){var s,r=window,q=t.t,p=q.a(new A.ci(a))
t.Y.a(null)
s=t.z
A.cu(r,"load",p,!1,s)
A.cu(window,"resize",q.a(new A.cj(a)),!1,s)},
ci:function ci(a){this.a=a},
cj:function cj(a){this.a=a},
bt:function bt(a,b,c,d,e){var _=this
_.e=a
_.f=b
_.x=c
_.z=d
_.b=_.a=null
_.a$=e},
bs:function bs(){},
bv:function bv(a,b){this.a=a
this.b=b},
bq:function bq(a){this.b=a},
br:function br(){},
bB:function bB(a){this.a=a},
bF:function bF(){this.b=this.a=$},
bL:function bL(){},
bg:function bg(){},
bE:function bE(){},
fi(){A.fl(new A.cg())},
cg:function cg(){},
ck(a){return A.bn(A.e3(a))},
fp(a){return A.bn(new A.a8("Field '"+a+"' has been assigned during initialization."))}},J={
cF(a,b,c,d){return{i:a,p:b,e:c,x:d}},
cb(a){var s,r,q,p,o,n=a[v.dispatchPropertyName]
if(n==null)if($.cE==null){A.fc()
n=a[v.dispatchPropertyName]}if(n!=null){s=n.p
if(!1===s)return n.i
if(!0===s)return a
r=Object.getPrototypeOf(a)
if(s===r)return n.i
if(n.e===r)throw A.d(A.d_("Return interceptor for "+A.k(s(a,n))))}q=a.constructor
if(q==null)p=null
else{o=$.c_
if(o==null)o=$.c_=v.getIsolateTag("_$dart_js")
p=q[o]}if(p!=null)return p
p=A.fh(a)
if(p!=null)return p
if(typeof a=="function")return B.v
s=Object.getPrototypeOf(a)
if(s==null)return B.k
if(s===Object.prototype)return B.k
if(typeof q=="function"){o=$.c_
if(o==null)o=$.c_=v.getIsolateTag("_$dart_js")
Object.defineProperty(q,o,{value:B.e,enumerable:false,writable:true,configurable:true})
return B.e}return B.e},
e2(a,b){if(a<0||a>4294967295)throw A.d(A.cs(a,0,4294967295,"length",null))
return J.cp(A.a_(new Array(a),b.i("p<0>")),b)},
cT(a,b){if(a<0)throw A.d(A.bp("Length must be a non-negative integer: "+a,null))
return A.a_(new Array(a),b.i("p<0>"))},
cp(a,b){a.fixed$length=Array
return a},
bl(a){if(typeof a=="number"){if(Math.floor(a)==a)return J.a7.prototype
return J.aL.prototype}if(typeof a=="string")return J.W.prototype
if(a==null)return J.aK.prototype
if(typeof a=="boolean")return J.aJ.prototype
if(a.constructor==Array)return J.p.prototype
if(typeof a!="object"){if(typeof a=="function")return J.D.prototype
return a}if(a instanceof A.l)return a
return J.cb(a)},
ds(a){if(typeof a=="string")return J.W.prototype
if(a==null)return a
if(a.constructor==Array)return J.p.prototype
if(typeof a!="object"){if(typeof a=="function")return J.D.prototype
return a}if(a instanceof A.l)return a
return J.cb(a)},
dt(a){if(a==null)return a
if(a.constructor==Array)return J.p.prototype
if(typeof a!="object"){if(typeof a=="function")return J.D.prototype
return a}if(a instanceof A.l)return a
return J.cb(a)},
du(a){if(a==null)return a
if(typeof a!="object"){if(typeof a=="function")return J.D.prototype
return a}if(a instanceof A.l)return a
return J.cb(a)},
dQ(a,b){if(typeof b==="number")if(a.constructor==Array||A.ff(a,a[v.dispatchPropertyName]))if(b>>>0===b&&b<a.length)return a[b]
return J.dt(a).q(a,b)},
cI(a){return J.du(a).a1(a)},
cJ(a){return J.dt(a).gn(a)},
cK(a){return J.ds(a).gj(a)},
bo(a){return J.bl(a).h(a)},
a6:function a6(){},
aJ:function aJ(){},
aK:function aK(){},
t:function t(){},
T:function T(){},
aP:function aP(){},
ag:function ag(){},
D:function D(){},
p:function p(a){this.$ti=a},
bA:function bA(a){this.$ti=a},
C:function C(a,b,c){var _=this
_.a=a
_.b=b
_.c=0
_.d=null
_.$ti=c},
aM:function aM(){},
a7:function a7(){},
aL:function aL(){},
W:function W(){}},B={}
var w=[A,J,B]
var $={}
A.cq.prototype={}
J.a6.prototype={
h(a){return"Instance of '"+A.bD(a)+"'"}}
J.aJ.prototype={
h(a){return String(a)},
$ia1:1}
J.aK.prototype={
h(a){return"null"}}
J.t.prototype={}
J.T.prototype={
h(a){return String(a)}}
J.aP.prototype={}
J.ag.prototype={}
J.D.prototype={
h(a){var s=a[$.dB()]
if(s==null)return this.Z(a)
return"JavaScript function for "+J.bo(s)},
$iS:1}
J.p.prototype={
m(a,b){A.ar(a).c.a(b)
if(!!a.fixed$length)A.bn(A.ct("add"))
a.push(b)},
ga9(a){var s=a.length
if(s>0)return a[s-1]
throw A.d(A.e1())},
h(a){return A.cS(a,"[","]")},
gn(a){return new J.C(a,a.length,A.ar(a).i("C<1>"))},
gj(a){return a.length},
X(a,b,c){var s
A.ar(a).c.a(c)
if(!!a.immutable$list)A.bn(A.ct("indexed set"))
s=a.length
if(b>=s)throw A.d(A.dq(a,b))
a[b]=c},
$in:1,
$iu:1}
J.bA.prototype={}
J.C.prototype={
gk(){var s=this.d
return s==null?this.$ti.c.a(s):s},
l(){var s,r=this,q=r.a,p=q.length
if(r.b!==p){q=A.fn(q)
throw A.d(q)}s=r.c
if(s>=p){r.sO(null)
return!1}r.sO(q[s]);++r.c
return!0},
sO(a){this.d=this.$ti.i("1?").a(a)},
$ix:1}
J.aM.prototype={
h(a){if(a===0&&1/a<0)return"-0.0"
else return""+a},
a3(a,b){var s
if(a>0)s=this.a2(a,b)
else{s=b>31?31:b
s=a>>s>>>0}return s},
a2(a,b){return b>31?0:a>>>b},
$ibk:1,
$iax:1}
J.a7.prototype={$ibm:1}
J.aL.prototype={}
J.W.prototype={
W(a,b){return a+b},
J(a,b,c){var s=a.length
if(c>s)throw A.d(A.cs(c,0,s,null,null))
return A.fm(a,b,c)},
h(a){return a},
gj(a){return a.length},
$icU:1,
$iM:1}
A.a8.prototype={
h(a){return"LateInitializationError: "+this.a}}
A.aa.prototype={
gk(){var s=this.d
return s==null?this.$ti.c.a(s):s},
l(){var s,r=this,q=r.a,p=J.ds(q),o=p.gj(q)
if(r.b!==o)throw A.d(A.cR(q))
s=r.c
if(s>=o){r.sv(null)
return!1}r.sv(p.u(q,s));++r.c
return!0},
sv(a){this.d=this.$ti.i("1?").a(a)},
$ix:1}
A.ab.prototype={
gn(a){var s=this.a,r=A.dc(this)
return new A.ac(s.gn(s),this.b,r.i("@<1>").t(r.z[1]).i("ac<1,2>"))},
gj(a){var s=this.a
return s.gj(s)},
u(a,b){return this.b.$1(this.a.u(0,b))}}
A.ac.prototype={
l(){var s=this,r=s.b
if(r.l()){s.sv(s.c.$1(r.gk()))
return!0}s.sv(null)
return!1},
gk(){var s=this.a
return s==null?this.$ti.z[1].a(s):s},
sv(a){this.a=this.$ti.i("2?").a(a)}}
A.ah.prototype={
gn(a){return new A.ai(J.cJ(this.a),this.b,this.$ti.i("ai<1>"))}}
A.ai.prototype={
l(){var s,r
for(s=this.a,r=this.b;s.l();)if(A.c9(r.$1(s.gk())))return!0
return!1},
gk(){return this.a.gk()}}
A.bJ.prototype={
p(a){var s,r,q=this,p=new RegExp(q.a).exec(a)
if(p==null)return null
s=Object.create(null)
r=q.b
if(r!==-1)s.arguments=p[r+1]
r=q.c
if(r!==-1)s.argumentsExpr=p[r+1]
r=q.d
if(r!==-1)s.expr=p[r+1]
r=q.e
if(r!==-1)s.method=p[r+1]
r=q.f
if(r!==-1)s.receiver=p[r+1]
return s}}
A.ae.prototype={
h(a){var s=this.b
if(s==null)return"NoSuchMethodError: "+this.a
return"NoSuchMethodError: method not found: '"+s+"' on null"}}
A.aO.prototype={
h(a){var s,r=this,q="NoSuchMethodError: method not found: '",p=r.b
if(p==null)return"NoSuchMethodError: "+r.a
s=r.c
if(s==null)return q+p+"' ("+r.a+")"
return q+p+"' on '"+s+"' ("+r.a+")"}}
A.aZ.prototype={
h(a){var s=this.a
return s.length===0?"Error":"Error: "+s}}
A.bC.prototype={
h(a){return"Throw of null ('"+(this.a===null?"null":"undefined")+"' from JavaScript)"}}
A.al.prototype={
h(a){var s,r=this.b
if(r!=null)return r
r=this.a
s=r!==null&&typeof r==="object"?r.stack:null
return this.b=s==null?"":s},
$iaS:1}
A.Q.prototype={
h(a){var s=this.constructor,r=s==null?null:s.name
return"Closure '"+A.dz(r==null?"unknown":r)+"'"},
$iS:1,
gaj(){return this},
$C:"$1",
$R:1,
$D:null}
A.aC.prototype={$C:"$0",$R:0}
A.aD.prototype={$C:"$2",$R:2}
A.aX.prototype={}
A.aU.prototype={
h(a){var s=this.$static_name
if(s==null)return"Closure of unknown static method"
return"Closure '"+A.dz(s)+"'"}}
A.a4.prototype={
h(a){return"Closure '"+this.$_name+"' of "+("Instance of '"+A.bD(this.a)+"'")}}
A.b5.prototype={
h(a){return"Reading static variable '"+this.a+"' during its initialization"}}
A.aQ.prototype={
h(a){return"RuntimeError: "+this.a}}
A.b0.prototype={
h(a){return"Assertion failed: "+A.aF(this.a)}}
A.cc.prototype={
$1(a){return this.a(a)},
$S:4}
A.cd.prototype={
$2(a,b){return this.a(a,b)},
$S:5}
A.ce.prototype={
$1(a){return this.a(A.bh(a))},
$S:6}
A.v.prototype={
i(a){return A.c4(v.typeUniverse,this,a)},
t(a){return A.ew(v.typeUniverse,this,a)}}
A.b8.prototype={}
A.b6.prototype={
h(a){return this.a}}
A.am.prototype={$iE:1}
A.bN.prototype={
$1(a){var s=this.a,r=s.a
s.a=null
r.$0()},
$S:7}
A.bM.prototype={
$1(a){var s,r
this.a.a=t.M.a(a)
s=this.b
r=this.c
s.firstChild?s.removeChild(r):s.appendChild(r)},
$S:8}
A.bO.prototype={
$0(){this.a.$0()},
$S:3}
A.bP.prototype={
$0(){this.a.$0()},
$S:3}
A.c2.prototype={
a_(a,b){if(self.setTimeout!=null)self.setTimeout(A.bj(new A.c3(this,b),0),a)
else throw A.d(A.ct("`setTimeout()` not found."))}}
A.c3.prototype={
$0(){this.b.$0()},
$S:0}
A.a3.prototype={
h(a){return A.k(this.a)},
$ih:1,
gD(){return this.b}}
A.aj.prototype={
aa(a){if((this.c&15)!==6)return!0
return this.b.b.M(t.m.a(this.d),a.a,t.v,t.K)},
a8(a){var s,r=this,q=r.e,p=null,o=t.A,n=t.K,m=a.a,l=r.b.b
if(t.C.b(q))p=l.ad(q,m,a.b,o,n,t.l)
else p=l.M(t.y.a(q),m,o,n)
try{o=r.$ti.i("2/").a(p)
return o}catch(s){if(t.e.b(A.ay(s))){if((r.c&1)!==0)throw A.d(A.bp("The error handler of Future.then must return a value of the returned future's type","onError"))
throw A.d(A.bp("The error handler of Future.catchError must return a value of the future's type","onError"))}else throw s}}}
A.z.prototype={
ah(a,b,c){var s,r,q,p=this.$ti
p.t(c).i("1/(2)").a(a)
s=$.m
if(s===B.b){if(b!=null&&!t.C.b(b)&&!t.y.b(b))throw A.d(A.cL(b,"onError",u.c))}else{c.i("@<0/>").t(p.c).i("1(2)").a(a)
if(b!=null)b=A.eV(b,s)}r=new A.z(s,c.i("z<0>"))
q=b==null?1:3
this.N(new A.aj(r,q,a,b,p.i("@<1>").t(c).i("aj<1,2>")))
return r},
ag(a,b){return this.ah(a,null,b)},
E(a){this.a=a.a&30|this.a&1
this.c=a.c},
N(a){var s,r=this,q=r.a
if(q<=3){a.a=t.F.a(r.c)
r.c=a}else{if((q&4)!==0){s=t.c.a(r.c)
if((s.a&24)===0){s.N(a)
return}r.E(s)}A.dk(null,null,r.b,t.M.a(new A.bT(r,a)))}},
R(a){var s,r,q,p,o,n,m=this,l={}
l.a=a
if(a==null)return
s=m.a
if(s<=3){r=t.F.a(m.c)
m.c=a
if(r!=null){q=a.a
for(p=a;q!=null;p=q,q=o)o=q.a
p.a=r}}else{if((s&4)!==0){n=t.c.a(m.c)
if((n.a&24)===0){n.R(a)
return}m.E(n)}l.a=m.B(a)
A.dk(null,null,m.b,t.M.a(new A.bU(l,m)))}},
S(){var s=t.F.a(this.c)
this.c=null
return this.B(s)},
B(a){var s,r,q
for(s=a,r=null;s!=null;r=s,s=q){q=s.a
s.a=r}return r},
$ia5:1}
A.bT.prototype={
$0(){A.b9(this.a,this.b)},
$S:0}
A.bU.prototype={
$0(){A.b9(this.b,this.a.a)},
$S:0}
A.bX.prototype={
$0(){var s,r,q,p,o,n,m=this,l=null
try{q=m.a.a
l=q.b.b.ac(t.O.a(q.d),t.A)}catch(p){s=A.ay(p)
r=A.av(p)
q=m.c&&t.n.a(m.b.a.c).a===s
o=m.a
if(q)o.c=t.n.a(m.b.a.c)
else o.c=A.cm(s,r)
o.b=!0
return}if(l instanceof A.z&&(l.a&24)!==0){if((l.a&16)!==0){q=m.a
q.c=t.n.a(l.c)
q.b=!0}return}if(t.d.b(l)){n=m.b.a
q=m.a
q.c=l.ag(new A.bY(n),t.A)
q.b=!1}},
$S:0}
A.bY.prototype={
$1(a){return this.a},
$S:9}
A.bW.prototype={
$0(){var s,r,q,p,o,n,m,l
try{q=this.a
p=q.a
o=p.$ti
n=o.c
m=n.a(this.b)
q.c=p.b.b.M(o.i("2/(1)").a(p.d),m,o.i("2/"),n)}catch(l){s=A.ay(l)
r=A.av(l)
q=this.a
q.c=A.cm(s,r)
q.b=!0}},
$S:0}
A.bV.prototype={
$0(){var s,r,q,p,o,n,m=this
try{s=t.n.a(m.a.a.c)
p=m.b
if(p.a.aa(s)&&p.a.e!=null){p.c=p.a.a8(s)
p.b=!1}}catch(o){r=A.ay(o)
q=A.av(o)
p=t.n.a(m.a.a.c)
n=m.b
if(p.a===r)n.c=p
else n.c=A.cm(r,q)
n.b=!0}},
$S:0}
A.b1.prototype={}
A.aV.prototype={
gj(a){var s,r,q=this,p={},o=new A.z($.m,t.a)
p.a=0
s=q.$ti
r=s.i("~(1)?").a(new A.bG(p,q))
t.Y.a(new A.bH(p,o))
A.cu(q.a,q.b,r,!1,s.c)
return o}}
A.bG.prototype={
$1(a){this.b.$ti.c.a(a);++this.a.a},
$S(){return this.b.$ti.i("~(1)")}}
A.bH.prototype={
$0(){var s=this.b,r=s.$ti,q=r.i("1/").a(this.a.a),p=s.S()
r.c.a(q)
s.a=8
s.c=q
A.b9(s,p)},
$S:0}
A.aW.prototype={}
A.aq.prototype={$id0:1}
A.c8.prototype={
$0(){var s=this.a,r=this.b
A.cC(s,"error",t.K)
A.cC(r,"stackTrace",t.l)
A.e_(s,r)},
$S:0}
A.be.prototype={
ae(a){var s,r,q
t.M.a(a)
try{if(B.b===$.m){a.$0()
return}A.di(null,null,this,a,t.H)}catch(q){s=A.ay(q)
r=A.av(q)
A.c7(t.K.a(s),t.l.a(r))}},
af(a,b,c){var s,r,q
c.i("~(0)").a(a)
c.a(b)
try{if(B.b===$.m){a.$1(b)
return}A.dj(null,null,this,a,b,t.H,c)}catch(q){s=A.ay(q)
r=A.av(q)
A.c7(t.K.a(s),t.l.a(r))}},
a5(a){return new A.c0(this,t.M.a(a))},
a6(a,b){return new A.c1(this,b.i("~(0)").a(a),b)},
ac(a,b){b.i("0()").a(a)
if($.m===B.b)return a.$0()
return A.di(null,null,this,a,b)},
M(a,b,c,d){c.i("@<0>").t(d).i("1(2)").a(a)
d.a(b)
if($.m===B.b)return a.$1(b)
return A.dj(null,null,this,a,b,c,d)},
ad(a,b,c,d,e,f){d.i("@<0>").t(e).t(f).i("1(2,3)").a(a)
e.a(b)
f.a(c)
if($.m===B.b)return a.$2(b,c)
return A.eW(null,null,this,a,b,c,d,e,f)}}
A.c0.prototype={
$0(){return this.a.ae(this.b)},
$S:0}
A.c1.prototype={
$1(a){var s=this.c
return this.a.af(this.b,s.a(a),s)},
$S(){return this.c.i("~(0)")}}
A.a9.prototype={$in:1,$iu:1}
A.i.prototype={
gn(a){return new A.aa(a,this.gj(a),A.I(a).i("aa<i.E>"))},
u(a,b){return this.q(a,b)},
gU(a){return this.gj(a)===0},
ai(a){var s,r,q,p,o=this
if(o.gU(a)){s=J.cT(0,A.I(a).i("i.E"))
return s}r=o.q(a,0)
q=A.e4(o.gj(a),r,!0,A.I(a).i("i.E"))
for(p=1;p<o.gj(a);++p)B.a.X(q,p,o.q(a,p))
return q},
h(a){return A.cS(a,"[","]")}}
A.ak.prototype={}
A.h.prototype={
gD(){return A.av(this.$thrownJsError)}}
A.a2.prototype={
h(a){var s=this.a
if(s!=null)return"Assertion failed: "+A.aF(s)
return"Assertion failed"}}
A.E.prototype={}
A.K.prototype={
gG(){return"Invalid argument"+(!this.a?"(s)":"")},
gF(){return""},
h(a){var s=this,r=s.c,q=r==null?"":" ("+r+")",p=s.d,o=p==null?"":": "+p,n=s.gG()+q+o
if(!s.a)return n
return n+s.gF()+": "+A.aF(s.gK())},
gK(){return this.b}}
A.X.prototype={
gK(){return A.ez(this.b)},
gG(){return"RangeError"},
gF(){var s,r=this.e,q=this.f
if(r==null)s=q!=null?": Not less than or equal to "+A.k(q):""
else if(q==null)s=": Not greater than or equal to "+A.k(r)
else if(q>r)s=": Not in inclusive range "+A.k(r)+".."+A.k(q)
else s=q<r?": Valid value range is empty":": Only valid value is "+A.k(r)
return s}}
A.aI.prototype={
gK(){return A.c6(this.b)},
gG(){return"RangeError"},
gF(){if(A.c6(this.b)<0)return": index must not be negative"
var s=this.f
if(s===0)return": no indices are valid"
return": index should be less than "+s},
gj(a){return this.f}}
A.b_.prototype={
h(a){return"Unsupported operation: "+this.a}}
A.aY.prototype={
h(a){return"UnimplementedError: "+this.a}}
A.aT.prototype={
h(a){return"Bad state: "+this.a}}
A.aE.prototype={
h(a){var s=this.a
if(s==null)return"Concurrent modification during iteration."
return"Concurrent modification during iteration: "+A.aF(s)+"."}}
A.af.prototype={
h(a){return"Stack Overflow"},
gD(){return null},
$ih:1}
A.bS.prototype={
h(a){return"Exception: "+this.a}}
A.n.prototype={
gj(a){var s,r=this.gn(this)
for(s=0;r.l();)++s
return s},
u(a,b){var s,r,q
A.e8(b,"index")
for(s=this.gn(this),r=0;s.l();){q=s.gk()
if(b===r)return q;++r}throw A.d(A.bz(b,r,this,"index"))},
h(a){return A.e0(this,"(",")")}}
A.x.prototype={}
A.y.prototype={
h(a){return"null"}}
A.l.prototype={$il:1,
h(a){return"Instance of '"+A.bD(this)+"'"},
toString(){return this.h(this)}}
A.bf.prototype={
h(a){return""},
$iaS:1}
A.bI.prototype={
gj(a){return this.a.length},
h(a){var s=this.a
return s.charCodeAt(0)==0?s:s}}
A.b.prototype={}
A.az.prototype={
h(a){return String(a)}}
A.aA.prototype={
h(a){return String(a)}}
A.A.prototype={
gj(a){return a.length}}
A.V.prototype={
A(a,b){var s=$.dA(),r=s[b]
if(typeof r=="string")return r
r=this.a4(a,b)
s[b]=r
return r},
a4(a,b){var s
if(b.replace(/^-ms-/,"ms-").replace(/-([\da-z])/ig,function(c,d){return d.toUpperCase()}) in a)return b
s=$.dC()+b
if(s in a)return s
return b},
C(a,b,c,d){a.setProperty(b,c,d)},
gj(a){return a.length}}
A.bu.prototype={}
A.bw.prototype={
h(a){return String(a)}}
A.b3.prototype={
gU(a){return this.a.firstElementChild==null},
gj(a){return this.b.length},
q(a,b){var s=this.b
if(!(b>=0&&b<s.length))return A.w(s,b)
return t.h.a(s[b])},
m(a,b){this.a.appendChild(b)
return b},
gn(a){var s=this.ai(this)
return new J.C(s,s.length,A.ar(s).i("C<1>"))},
T(a){J.cI(this.a)}}
A.f.prototype={
gI(a){return new A.b3(a,a.children)},
h(a){return a.localName},
$if:1}
A.a.prototype={$ia:1}
A.o.prototype={
a0(a,b,c,d){return a.addEventListener(b,A.bj(t.o.a(c),1),!1)},
$io:1}
A.aH.prototype={
gj(a){return a.length}}
A.L.prototype={
gj(a){return a.length},
q(a,b){var s=a.length
if(b>>>0!==b||b>=s)throw A.d(A.bz(b,s,a,null))
return a[b]},
u(a,b){if(!(b>=0&&b<a.length))return A.w(a,b)
return a[b]},
$iaN:1,
$in:1,
$iu:1,
$iL:1}
A.b2.prototype={
gn(a){var s=this.a.childNodes
return new A.R(s,s.length,A.I(s).i("R<B.E>"))},
gj(a){return this.a.childNodes.length},
q(a,b){var s=this.a.childNodes
if(!(b>=0&&b<s.length))return A.w(s,b)
return s[b]}}
A.e.prototype={
a1(a){var s
for(;s=a.firstChild,s!=null;)a.removeChild(s)},
h(a){var s=a.nodeValue
return s==null?this.Y(a):s},
$ie:1}
A.ad.prototype={
gj(a){return a.length},
q(a,b){var s=a.length
if(b>>>0!==b||b>=s)throw A.d(A.bz(b,s,a,null))
return a[b]},
u(a,b){if(!(b>=0&&b<a.length))return A.w(a,b)
return a[b]},
$iaN:1,
$in:1,
$iu:1}
A.aR.prototype={
gj(a){return a.length}}
A.Y.prototype={}
A.co.prototype={}
A.bQ.prototype={}
A.b7.prototype={}
A.bR.prototype={
$1(a){return this.a.$1(t.z.a(a))},
$S:1}
A.B.prototype={
gn(a){return new A.R(a,this.gj(a),A.I(a).i("R<B.E>"))}}
A.R.prototype={
l(){var s=this,r=s.c+1,q=s.b
if(r<q){s.sP(J.dQ(s.a,r))
s.c=r
return!0}s.sP(null)
s.c=q
return!1},
gk(){var s=this.d
return s==null?this.$ti.c.a(s):s},
sP(a){this.d=this.$ti.i("1?").a(a)},
$ix:1}
A.b4.prototype={}
A.ba.prototype={}
A.bb.prototype={}
A.bc.prototype={}
A.bd.prototype={}
A.aG.prototype={
gH(){var s=this.b,r=A.dc(s)
return new A.ab(new A.ah(s,r.i("a1(i.E)").a(new A.bx()),r.i("ah<i.E>")),r.i("f(i.E)").a(new A.by()),r.i("ab<i.E,f>"))},
m(a,b){this.b.a.appendChild(b)},
T(a){J.cI(this.b.a)},
gj(a){var s=this.gH().a
return s.gj(s)},
q(a,b){var s=this.gH()
return s.b.$1(s.a.u(0,b))},
gn(a){var s=A.e5(this.gH(),!1,t.h)
return new J.C(s,s.length,A.ar(s).i("C<1>"))}}
A.bx.prototype={
$1(a){return t.h.b(t.G.a(a))},
$S:10}
A.by.prototype={
$1(a){return t.h.a(t.G.a(a))},
$S:11}
A.bZ.prototype={
ab(a){if(a<=0||a>4294967296)throw A.d(A.e7("max must be in range 0 < max \u2264 2^32, was "+a))
return Math.random()*a>>>0}}
A.c.prototype={
gI(a){return new A.aG(new A.b2(a))}}
A.ci.prototype={
$1(a){$.cl().V()
this.a.$0()},
$S:1}
A.cj.prototype={
$1(a){$.cl().V()
this.a.$0()},
$S:1}
A.bt.prototype={
a7(a){var s,r,q="inherit",p=document,o=p.createElement("div"),n=o.style
n.width=A.k(this.e)+"px"
n=o.style
n.height=A.k(this.f)+"px"
n=o.style
n.maxHeight=q
n=o.style
n.maxWidth=q
n=o.style
n.minHeight=q
n=o.style
n.minWidth=q
n=o.style
n.padding="0px"
n=o.style
n.margin="0px"
n=o.style
s=this.x
r=s.a.gL()
if(r==null)r=q
n.backgroundColor=r
n=o.style
B.c.C(n,B.c.A(n,"border-radius"),"0px","")
n=o.style
s=s.b.b.gL()
n.border="0px solid "+A.k(s)
n=o.style
B.c.C(n,B.c.A(n,"box-shadow"),q,"")
n=o.style
n.display="flex"
n=o.style
B.c.C(n,B.c.A(n,"justify-content"),q,"")
n=o.style
B.c.C(n,B.c.A(n,"align-items"),q,"")
p=p.createElement("div")
o.appendChild(p)
return o}}
A.bs.prototype={
gL(){return"rgba(211, 47, 47, 1)"}}
A.bv.prototype={}
A.bq.prototype={
h(a){var s,r=B.a.ga9("solid".split("."))
r=A.k(r)
s=this.b.gL()
return"0px "+r+" "+s}}
A.br.prototype={
h(a){return"min-width: 0px; max-width: Infinitypx; min-height: 0px; max-height: Infinitypx;"}}
A.bB.prototype={}
A.bF.prototype={
V(){var s=window.innerWidth
this.a=s==null?0:s
s=window.innerHeight
this.b=s==null?0:s},
h(a){var s,r=this.a
r===$&&A.ck("_x")
s=this.b
s===$&&A.ck("_y")
return"Size(x: "+r+", y: "+s+")"}}
A.bL.prototype={}
A.bg.prototype={}
A.bE.prototype={}
A.cg.prototype={
$0(){var s,r,q=$.cl(),p=q.b
p===$&&A.ck("_y")
s=q.a
s===$&&A.ck("_x")
q=new A.bt(s,p,new A.bv(B.f,new A.bq(B.f)),new A.br(),q)
p=document
p=p.getElementById("root")
if(p!=null){s=J.du(p)
s.gI(p).T(0)
p=s.gI(p)
q.a=new A.bB(B.j.h(B.r.ab(1e9)))
s=q.a7(0)
r=q.a
r=r==null?null:r.a
s.id=r==null?"this is not right":r
q.b=s
p.m(0,s)}},
$S:0};(function aliases(){var s=J.a6.prototype
s.Y=s.h
s=J.T.prototype
s.Z=s.h})();(function installTearOffs(){var s=hunkHelpers._static_1,r=hunkHelpers._static_0
s(A,"f4","eb",2)
s(A,"f5","ec",2)
s(A,"f6","ed",2)
r(A,"dp","eY",0)})();(function inheritance(){var s=hunkHelpers.mixin,r=hunkHelpers.inherit,q=hunkHelpers.inheritMany
r(A.l,null)
q(A.l,[A.cq,J.a6,J.C,A.h,A.aa,A.n,A.x,A.bJ,A.bC,A.al,A.Q,A.v,A.b8,A.c2,A.a3,A.aj,A.z,A.b1,A.aV,A.aW,A.aq,A.ak,A.i,A.af,A.bS,A.y,A.bf,A.bI,A.bu,A.co,A.B,A.R,A.bZ,A.bg,A.bs,A.bv,A.bq,A.br,A.bB,A.bF,A.bE])
q(J.a6,[J.aJ,J.aK,J.t,J.p,J.aM,J.W])
q(J.t,[J.T,A.o,A.b4,A.bw,A.a,A.ba,A.bc])
q(J.T,[J.aP,J.ag,J.D])
r(J.bA,J.p)
q(J.aM,[J.a7,J.aL])
q(A.h,[A.a8,A.E,A.aO,A.aZ,A.b5,A.aQ,A.a2,A.b6,A.K,A.b_,A.aY,A.aT,A.aE])
q(A.n,[A.ab,A.ah])
q(A.x,[A.ac,A.ai])
r(A.ae,A.E)
q(A.Q,[A.aC,A.aD,A.aX,A.cc,A.ce,A.bN,A.bM,A.bY,A.bG,A.c1,A.bR,A.bx,A.by,A.ci,A.cj])
q(A.aX,[A.aU,A.a4])
r(A.b0,A.a2)
r(A.cd,A.aD)
r(A.am,A.b6)
q(A.aC,[A.bO,A.bP,A.c3,A.bT,A.bU,A.bX,A.bW,A.bV,A.bH,A.c8,A.c0,A.cg])
r(A.be,A.aq)
r(A.a9,A.ak)
q(A.K,[A.X,A.aI])
q(A.o,[A.e,A.Y])
q(A.e,[A.f,A.A])
q(A.f,[A.b,A.c])
q(A.b,[A.az,A.aA,A.aH,A.aR])
r(A.V,A.b4)
q(A.a9,[A.b3,A.b2,A.aG])
r(A.bb,A.ba)
r(A.L,A.bb)
r(A.bd,A.bc)
r(A.ad,A.bd)
r(A.bQ,A.aV)
r(A.b7,A.aW)
r(A.bL,A.bg)
r(A.bt,A.bL)
s(A.ak,A.i)
s(A.b4,A.bu)
s(A.ba,A.i)
s(A.bb,A.B)
s(A.bc,A.i)
s(A.bd,A.B)
s(A.bg,A.bE)})()
var v={typeUniverse:{eC:new Map(),tR:{},eT:{},tPV:{},sEA:[]},mangledGlobalNames:{bm:"int",bk:"double",ax:"num",M:"String",a1:"bool",y:"Null",u:"List"},mangledNames:{},types:["~()","~(a)","~(~())","y()","@(@)","@(@,M)","@(M)","y(@)","y(~())","z<@>(@)","a1(e)","f(e)"],interceptorsByTag:null,leafTags:null,arrayRti:Symbol("$ti")}
A.ev(v.typeUniverse,JSON.parse('{"aP":"T","ag":"T","D":"T","fs":"a","fD":"a","fr":"c","fE":"c","ft":"b","fI":"b","fF":"e","fC":"e","fu":"A","fL":"A","fH":"f","fG":"L","aJ":{"a1":[]},"p":{"u":["1"],"n":["1"]},"bA":{"p":["1"],"u":["1"],"n":["1"]},"C":{"x":["1"]},"aM":{"bk":[],"ax":[]},"a7":{"bk":[],"bm":[],"ax":[]},"aL":{"bk":[],"ax":[]},"W":{"M":[],"cU":[]},"a8":{"h":[]},"aa":{"x":["1"]},"ab":{"n":["2"]},"ac":{"x":["2"]},"ah":{"n":["1"]},"ai":{"x":["1"]},"ae":{"E":[],"h":[]},"aO":{"h":[]},"aZ":{"h":[]},"al":{"aS":[]},"Q":{"S":[]},"aC":{"S":[]},"aD":{"S":[]},"aX":{"S":[]},"aU":{"S":[]},"a4":{"S":[]},"b5":{"h":[]},"aQ":{"h":[]},"b0":{"h":[]},"b6":{"h":[]},"am":{"E":[],"h":[]},"z":{"a5":["1"]},"a3":{"h":[]},"aq":{"d0":[]},"be":{"aq":[],"d0":[]},"a9":{"i":["1"],"u":["1"],"n":["1"]},"bm":{"ax":[]},"M":{"cU":[]},"a2":{"h":[]},"E":{"h":[]},"K":{"h":[]},"X":{"h":[]},"aI":{"h":[]},"b_":{"h":[]},"aY":{"h":[]},"aT":{"h":[]},"aE":{"h":[]},"af":{"h":[]},"bf":{"aS":[]},"f":{"e":[],"o":[]},"e":{"o":[]},"b":{"f":[],"e":[],"o":[]},"az":{"f":[],"e":[],"o":[]},"aA":{"f":[],"e":[],"o":[]},"A":{"e":[],"o":[]},"b3":{"i":["f"],"u":["f"],"n":["f"],"i.E":"f"},"aH":{"f":[],"e":[],"o":[]},"L":{"i":["e"],"B":["e"],"u":["e"],"aN":["e"],"n":["e"],"i.E":"e","B.E":"e"},"b2":{"i":["e"],"u":["e"],"n":["e"],"i.E":"e"},"ad":{"i":["e"],"B":["e"],"u":["e"],"aN":["e"],"n":["e"],"i.E":"e","B.E":"e"},"aR":{"f":[],"e":[],"o":[]},"Y":{"o":[]},"bQ":{"aV":["1"]},"R":{"x":["1"]},"aG":{"i":["f"],"u":["f"],"n":["f"],"i.E":"f"},"c":{"f":[],"e":[],"o":[]}}'))
A.eu(v.typeUniverse,JSON.parse('{"aW":1,"a9":1,"ak":1}'))
var u={c:"Error handler must accept one Object or one Object and a StackTrace as arguments, and return a value of the returned future's type"}
var t=(function rtii(){var s=A.dr
return{n:s("a3"),h:s("f"),Q:s("h"),z:s("a"),Z:s("S"),d:s("a5<@>"),N:s("n<@>"),s:s("p<M>"),b:s("p<@>"),T:s("aK"),g:s("D"),p:s("aN<@>"),G:s("e"),P:s("y"),K:s("l"),L:s("fJ"),l:s("aS"),R:s("M"),e:s("E"),B:s("ag"),c:s("z<@>"),a:s("z<bm>"),v:s("a1"),m:s("a1(l)"),i:s("bk"),A:s("@"),O:s("@()"),y:s("@(l)"),C:s("@(l,aS)"),S:s("bm"),I:s("0&*"),_:s("l*"),U:s("a5<y>?"),X:s("l?"),F:s("aj<@,@>?"),o:s("@(a)?"),Y:s("~()?"),t:s("~(a)?"),q:s("ax"),H:s("~"),M:s("~()")}})();(function constants(){B.c=A.V.prototype
B.u=J.a6.prototype
B.a=J.p.prototype
B.j=J.a7.prototype
B.d=J.W.prototype
B.v=J.D.prototype
B.w=J.t.prototype
B.k=J.aP.prototype
B.e=J.ag.prototype
B.x=A.Y.prototype
B.f=new A.bs()
B.h=function getTagFallback(o) {
  var s = Object.prototype.toString.call(o);
  return s.substring(8, s.length - 1);
}
B.l=function() {
  var toStringFunction = Object.prototype.toString;
  function getTag(o) {
    var s = toStringFunction.call(o);
    return s.substring(8, s.length - 1);
  }
  function getUnknownTag(object, tag) {
    if (/^HTML[A-Z].*Element$/.test(tag)) {
      var name = toStringFunction.call(object);
      if (name == "[object Object]") return null;
      return "HTMLElement";
    }
  }
  function getUnknownTagGenericBrowser(object, tag) {
    if (self.HTMLElement && object instanceof HTMLElement) return "HTMLElement";
    return getUnknownTag(object, tag);
  }
  function prototypeForTag(tag) {
    if (typeof window == "undefined") return null;
    if (typeof window[tag] == "undefined") return null;
    var constructor = window[tag];
    if (typeof constructor != "function") return null;
    return constructor.prototype;
  }
  function discriminator(tag) { return null; }
  var isBrowser = typeof navigator == "object";
  return {
    getTag: getTag,
    getUnknownTag: isBrowser ? getUnknownTagGenericBrowser : getUnknownTag,
    prototypeForTag: prototypeForTag,
    discriminator: discriminator };
}
B.q=function(getTagFallback) {
  return function(hooks) {
    if (typeof navigator != "object") return hooks;
    var ua = navigator.userAgent;
    if (ua.indexOf("DumpRenderTree") >= 0) return hooks;
    if (ua.indexOf("Chrome") >= 0) {
      function confirm(p) {
        return typeof window == "object" && window[p] && window[p].name == p;
      }
      if (confirm("Window") && confirm("HTMLElement")) return hooks;
    }
    hooks.getTag = getTagFallback;
  };
}
B.m=function(hooks) {
  if (typeof dartExperimentalFixupGetTag != "function") return hooks;
  hooks.getTag = dartExperimentalFixupGetTag(hooks.getTag);
}
B.n=function(hooks) {
  var getTag = hooks.getTag;
  var prototypeForTag = hooks.prototypeForTag;
  function getTagFixed(o) {
    var tag = getTag(o);
    if (tag == "Document") {
      if (!!o.xmlVersion) return "!Document";
      return "!HTMLDocument";
    }
    return tag;
  }
  function prototypeForTagFixed(tag) {
    if (tag == "Document") return null;
    return prototypeForTag(tag);
  }
  hooks.getTag = getTagFixed;
  hooks.prototypeForTag = prototypeForTagFixed;
}
B.p=function(hooks) {
  var userAgent = typeof navigator == "object" ? navigator.userAgent : "";
  if (userAgent.indexOf("Firefox") == -1) return hooks;
  var getTag = hooks.getTag;
  var quickMap = {
    "BeforeUnloadEvent": "Event",
    "DataTransfer": "Clipboard",
    "GeoGeolocation": "Geolocation",
    "Location": "!Location",
    "WorkerMessageEvent": "MessageEvent",
    "XMLDocument": "!Document"};
  function getTagFirefox(o) {
    var tag = getTag(o);
    return quickMap[tag] || tag;
  }
  hooks.getTag = getTagFirefox;
}
B.o=function(hooks) {
  var userAgent = typeof navigator == "object" ? navigator.userAgent : "";
  if (userAgent.indexOf("Trident/") == -1) return hooks;
  var getTag = hooks.getTag;
  var quickMap = {
    "BeforeUnloadEvent": "Event",
    "DataTransfer": "Clipboard",
    "HTMLDDElement": "HTMLElement",
    "HTMLDTElement": "HTMLElement",
    "HTMLPhraseElement": "HTMLElement",
    "Position": "Geoposition"
  };
  function getTagIE(o) {
    var tag = getTag(o);
    var newTag = quickMap[tag];
    if (newTag) return newTag;
    if (tag == "Object") {
      if (window.DataView && (o instanceof window.DataView)) return "DataView";
    }
    return tag;
  }
  function prototypeForTagIE(tag) {
    var constructor = window[tag];
    if (constructor == null) return null;
    return constructor.prototype;
  }
  hooks.getTag = getTagIE;
  hooks.prototypeForTag = prototypeForTagIE;
}
B.i=function(hooks) { return hooks; }

B.r=new A.bZ()
B.b=new A.be()
B.t=new A.bf()})();(function staticFields(){$.c_=null
$.cO=null
$.cN=null
$.dv=null
$.dn=null
$.dy=null
$.ca=null
$.cf=null
$.cE=null
$.Z=null
$.as=null
$.at=null
$.cB=!1
$.m=B.b
$.H=A.a_([],A.dr("p<l>"))})();(function lazyInitializers(){var s=hunkHelpers.lazyFinal
s($,"fw","dB",()=>A.f9("_$dart_dartClosure"))
s($,"fM","dG",()=>A.F(A.bK({
toString:function(){return"$receiver$"}})))
s($,"fN","dH",()=>A.F(A.bK({$method$:null,
toString:function(){return"$receiver$"}})))
s($,"fO","dI",()=>A.F(A.bK(null)))
s($,"fP","dJ",()=>A.F(function(){var $argumentsExpr$="$arguments$"
try{null.$method$($argumentsExpr$)}catch(r){return r.message}}()))
s($,"fS","dM",()=>A.F(A.bK(void 0)))
s($,"fT","dN",()=>A.F(function(){var $argumentsExpr$="$arguments$"
try{(void 0).$method$($argumentsExpr$)}catch(r){return r.message}}()))
s($,"fR","dL",()=>A.F(A.cZ(null)))
s($,"fQ","dK",()=>A.F(function(){try{null.$method$}catch(r){return r.message}}()))
s($,"fV","dP",()=>A.F(A.cZ(void 0)))
s($,"fU","dO",()=>A.F(function(){try{(void 0).$method$}catch(r){return r.message}}()))
s($,"fW","cH",()=>A.ea())
s($,"fv","dA",()=>({}))
s($,"fA","cG",()=>B.d.J(A.cn(),"Opera",0))
s($,"fz","dE",()=>!A.c9($.cG())&&B.d.J(A.cn(),"Trident/",0))
s($,"fy","dD",()=>B.d.J(A.cn(),"Firefox",0))
s($,"fx","dC",()=>"-"+$.dF()+"-")
s($,"fB","dF",()=>{if(A.c9($.dD()))var r="moz"
else if($.dE())r="ms"
else r=A.c9($.cG())?"o":"webkit"
return r})
s($,"fK","cl",()=>{var r=new A.bF()
r.b=r.a=0
return r})})();(function nativeSupport(){!function(){var s=function(a){var m={}
m[a]=1
return Object.keys(hunkHelpers.convertToFastObject(m))[0]}
v.getIsolateTag=function(a){return s("___dart_"+a+v.isolateTag)}
var r="___dart_isolate_tags_"
var q=Object[r]||(Object[r]=Object.create(null))
var p="_ZxYxX"
for(var o=0;;o++){var n=s(p+"_"+o+"_")
if(!(n in q)){q[n]=1
v.isolateTag=n
break}}v.dispatchPropertyName=v.getIsolateTag("dispatch_record")}()
hunkHelpers.setOrUpdateInterceptorsByTag({DOMError:J.t,MediaError:J.t,Navigator:J.t,NavigatorConcurrentHardware:J.t,NavigatorUserMediaError:J.t,OverconstrainedError:J.t,PositionError:J.t,GeolocationPositionError:J.t,HTMLAudioElement:A.b,HTMLBRElement:A.b,HTMLBaseElement:A.b,HTMLBodyElement:A.b,HTMLButtonElement:A.b,HTMLCanvasElement:A.b,HTMLContentElement:A.b,HTMLDListElement:A.b,HTMLDataElement:A.b,HTMLDataListElement:A.b,HTMLDetailsElement:A.b,HTMLDialogElement:A.b,HTMLDivElement:A.b,HTMLEmbedElement:A.b,HTMLFieldSetElement:A.b,HTMLHRElement:A.b,HTMLHeadElement:A.b,HTMLHeadingElement:A.b,HTMLHtmlElement:A.b,HTMLIFrameElement:A.b,HTMLImageElement:A.b,HTMLInputElement:A.b,HTMLLIElement:A.b,HTMLLabelElement:A.b,HTMLLegendElement:A.b,HTMLLinkElement:A.b,HTMLMapElement:A.b,HTMLMediaElement:A.b,HTMLMenuElement:A.b,HTMLMetaElement:A.b,HTMLMeterElement:A.b,HTMLModElement:A.b,HTMLOListElement:A.b,HTMLObjectElement:A.b,HTMLOptGroupElement:A.b,HTMLOptionElement:A.b,HTMLOutputElement:A.b,HTMLParagraphElement:A.b,HTMLParamElement:A.b,HTMLPictureElement:A.b,HTMLPreElement:A.b,HTMLProgressElement:A.b,HTMLQuoteElement:A.b,HTMLScriptElement:A.b,HTMLShadowElement:A.b,HTMLSlotElement:A.b,HTMLSourceElement:A.b,HTMLSpanElement:A.b,HTMLStyleElement:A.b,HTMLTableCaptionElement:A.b,HTMLTableCellElement:A.b,HTMLTableDataCellElement:A.b,HTMLTableHeaderCellElement:A.b,HTMLTableColElement:A.b,HTMLTableElement:A.b,HTMLTableRowElement:A.b,HTMLTableSectionElement:A.b,HTMLTemplateElement:A.b,HTMLTextAreaElement:A.b,HTMLTimeElement:A.b,HTMLTitleElement:A.b,HTMLTrackElement:A.b,HTMLUListElement:A.b,HTMLUnknownElement:A.b,HTMLVideoElement:A.b,HTMLDirectoryElement:A.b,HTMLFontElement:A.b,HTMLFrameElement:A.b,HTMLFrameSetElement:A.b,HTMLMarqueeElement:A.b,HTMLElement:A.b,HTMLAnchorElement:A.az,HTMLAreaElement:A.aA,CDATASection:A.A,CharacterData:A.A,Comment:A.A,ProcessingInstruction:A.A,Text:A.A,CSSStyleDeclaration:A.V,MSStyleCSSProperties:A.V,CSS2Properties:A.V,DOMException:A.bw,MathMLElement:A.f,Element:A.f,AbortPaymentEvent:A.a,AnimationEvent:A.a,AnimationPlaybackEvent:A.a,ApplicationCacheErrorEvent:A.a,BackgroundFetchClickEvent:A.a,BackgroundFetchEvent:A.a,BackgroundFetchFailEvent:A.a,BackgroundFetchedEvent:A.a,BeforeInstallPromptEvent:A.a,BeforeUnloadEvent:A.a,BlobEvent:A.a,CanMakePaymentEvent:A.a,ClipboardEvent:A.a,CloseEvent:A.a,CompositionEvent:A.a,CustomEvent:A.a,DeviceMotionEvent:A.a,DeviceOrientationEvent:A.a,ErrorEvent:A.a,Event:A.a,InputEvent:A.a,SubmitEvent:A.a,ExtendableEvent:A.a,ExtendableMessageEvent:A.a,FetchEvent:A.a,FocusEvent:A.a,FontFaceSetLoadEvent:A.a,ForeignFetchEvent:A.a,GamepadEvent:A.a,HashChangeEvent:A.a,InstallEvent:A.a,KeyboardEvent:A.a,MediaEncryptedEvent:A.a,MediaKeyMessageEvent:A.a,MediaQueryListEvent:A.a,MediaStreamEvent:A.a,MediaStreamTrackEvent:A.a,MessageEvent:A.a,MIDIConnectionEvent:A.a,MIDIMessageEvent:A.a,MouseEvent:A.a,DragEvent:A.a,MutationEvent:A.a,NotificationEvent:A.a,PageTransitionEvent:A.a,PaymentRequestEvent:A.a,PaymentRequestUpdateEvent:A.a,PointerEvent:A.a,PopStateEvent:A.a,PresentationConnectionAvailableEvent:A.a,PresentationConnectionCloseEvent:A.a,ProgressEvent:A.a,PromiseRejectionEvent:A.a,PushEvent:A.a,RTCDataChannelEvent:A.a,RTCDTMFToneChangeEvent:A.a,RTCPeerConnectionIceEvent:A.a,RTCTrackEvent:A.a,SecurityPolicyViolationEvent:A.a,SensorErrorEvent:A.a,SpeechRecognitionError:A.a,SpeechRecognitionEvent:A.a,SpeechSynthesisEvent:A.a,StorageEvent:A.a,SyncEvent:A.a,TextEvent:A.a,TouchEvent:A.a,TrackEvent:A.a,TransitionEvent:A.a,WebKitTransitionEvent:A.a,UIEvent:A.a,VRDeviceEvent:A.a,VRDisplayEvent:A.a,VRSessionEvent:A.a,WheelEvent:A.a,MojoInterfaceRequestEvent:A.a,ResourceProgressEvent:A.a,USBConnectionEvent:A.a,IDBVersionChangeEvent:A.a,AudioProcessingEvent:A.a,OfflineAudioCompletionEvent:A.a,WebGLContextEvent:A.a,EventTarget:A.o,HTMLFormElement:A.aH,HTMLCollection:A.L,HTMLFormControlsCollection:A.L,HTMLOptionsCollection:A.L,Document:A.e,DocumentFragment:A.e,HTMLDocument:A.e,ShadowRoot:A.e,XMLDocument:A.e,Attr:A.e,DocumentType:A.e,Node:A.e,NodeList:A.ad,RadioNodeList:A.ad,HTMLSelectElement:A.aR,Window:A.Y,DOMWindow:A.Y,SVGAElement:A.c,SVGAnimateElement:A.c,SVGAnimateMotionElement:A.c,SVGAnimateTransformElement:A.c,SVGAnimationElement:A.c,SVGCircleElement:A.c,SVGClipPathElement:A.c,SVGDefsElement:A.c,SVGDescElement:A.c,SVGDiscardElement:A.c,SVGEllipseElement:A.c,SVGFEBlendElement:A.c,SVGFEColorMatrixElement:A.c,SVGFEComponentTransferElement:A.c,SVGFECompositeElement:A.c,SVGFEConvolveMatrixElement:A.c,SVGFEDiffuseLightingElement:A.c,SVGFEDisplacementMapElement:A.c,SVGFEDistantLightElement:A.c,SVGFEFloodElement:A.c,SVGFEFuncAElement:A.c,SVGFEFuncBElement:A.c,SVGFEFuncGElement:A.c,SVGFEFuncRElement:A.c,SVGFEGaussianBlurElement:A.c,SVGFEImageElement:A.c,SVGFEMergeElement:A.c,SVGFEMergeNodeElement:A.c,SVGFEMorphologyElement:A.c,SVGFEOffsetElement:A.c,SVGFEPointLightElement:A.c,SVGFESpecularLightingElement:A.c,SVGFESpotLightElement:A.c,SVGFETileElement:A.c,SVGFETurbulenceElement:A.c,SVGFilterElement:A.c,SVGForeignObjectElement:A.c,SVGGElement:A.c,SVGGeometryElement:A.c,SVGGraphicsElement:A.c,SVGImageElement:A.c,SVGLineElement:A.c,SVGLinearGradientElement:A.c,SVGMarkerElement:A.c,SVGMaskElement:A.c,SVGMetadataElement:A.c,SVGPathElement:A.c,SVGPatternElement:A.c,SVGPolygonElement:A.c,SVGPolylineElement:A.c,SVGRadialGradientElement:A.c,SVGRectElement:A.c,SVGScriptElement:A.c,SVGSetElement:A.c,SVGStopElement:A.c,SVGStyleElement:A.c,SVGElement:A.c,SVGSVGElement:A.c,SVGSwitchElement:A.c,SVGSymbolElement:A.c,SVGTSpanElement:A.c,SVGTextContentElement:A.c,SVGTextElement:A.c,SVGTextPathElement:A.c,SVGTextPositioningElement:A.c,SVGTitleElement:A.c,SVGUseElement:A.c,SVGViewElement:A.c,SVGGradientElement:A.c,SVGComponentTransferFunctionElement:A.c,SVGFEDropShadowElement:A.c,SVGMPathElement:A.c})
hunkHelpers.setOrUpdateLeafTags({DOMError:true,MediaError:true,Navigator:true,NavigatorConcurrentHardware:true,NavigatorUserMediaError:true,OverconstrainedError:true,PositionError:true,GeolocationPositionError:true,HTMLAudioElement:true,HTMLBRElement:true,HTMLBaseElement:true,HTMLBodyElement:true,HTMLButtonElement:true,HTMLCanvasElement:true,HTMLContentElement:true,HTMLDListElement:true,HTMLDataElement:true,HTMLDataListElement:true,HTMLDetailsElement:true,HTMLDialogElement:true,HTMLDivElement:true,HTMLEmbedElement:true,HTMLFieldSetElement:true,HTMLHRElement:true,HTMLHeadElement:true,HTMLHeadingElement:true,HTMLHtmlElement:true,HTMLIFrameElement:true,HTMLImageElement:true,HTMLInputElement:true,HTMLLIElement:true,HTMLLabelElement:true,HTMLLegendElement:true,HTMLLinkElement:true,HTMLMapElement:true,HTMLMediaElement:true,HTMLMenuElement:true,HTMLMetaElement:true,HTMLMeterElement:true,HTMLModElement:true,HTMLOListElement:true,HTMLObjectElement:true,HTMLOptGroupElement:true,HTMLOptionElement:true,HTMLOutputElement:true,HTMLParagraphElement:true,HTMLParamElement:true,HTMLPictureElement:true,HTMLPreElement:true,HTMLProgressElement:true,HTMLQuoteElement:true,HTMLScriptElement:true,HTMLShadowElement:true,HTMLSlotElement:true,HTMLSourceElement:true,HTMLSpanElement:true,HTMLStyleElement:true,HTMLTableCaptionElement:true,HTMLTableCellElement:true,HTMLTableDataCellElement:true,HTMLTableHeaderCellElement:true,HTMLTableColElement:true,HTMLTableElement:true,HTMLTableRowElement:true,HTMLTableSectionElement:true,HTMLTemplateElement:true,HTMLTextAreaElement:true,HTMLTimeElement:true,HTMLTitleElement:true,HTMLTrackElement:true,HTMLUListElement:true,HTMLUnknownElement:true,HTMLVideoElement:true,HTMLDirectoryElement:true,HTMLFontElement:true,HTMLFrameElement:true,HTMLFrameSetElement:true,HTMLMarqueeElement:true,HTMLElement:false,HTMLAnchorElement:true,HTMLAreaElement:true,CDATASection:true,CharacterData:true,Comment:true,ProcessingInstruction:true,Text:true,CSSStyleDeclaration:true,MSStyleCSSProperties:true,CSS2Properties:true,DOMException:true,MathMLElement:true,Element:false,AbortPaymentEvent:true,AnimationEvent:true,AnimationPlaybackEvent:true,ApplicationCacheErrorEvent:true,BackgroundFetchClickEvent:true,BackgroundFetchEvent:true,BackgroundFetchFailEvent:true,BackgroundFetchedEvent:true,BeforeInstallPromptEvent:true,BeforeUnloadEvent:true,BlobEvent:true,CanMakePaymentEvent:true,ClipboardEvent:true,CloseEvent:true,CompositionEvent:true,CustomEvent:true,DeviceMotionEvent:true,DeviceOrientationEvent:true,ErrorEvent:true,Event:true,InputEvent:true,SubmitEvent:true,ExtendableEvent:true,ExtendableMessageEvent:true,FetchEvent:true,FocusEvent:true,FontFaceSetLoadEvent:true,ForeignFetchEvent:true,GamepadEvent:true,HashChangeEvent:true,InstallEvent:true,KeyboardEvent:true,MediaEncryptedEvent:true,MediaKeyMessageEvent:true,MediaQueryListEvent:true,MediaStreamEvent:true,MediaStreamTrackEvent:true,MessageEvent:true,MIDIConnectionEvent:true,MIDIMessageEvent:true,MouseEvent:true,DragEvent:true,MutationEvent:true,NotificationEvent:true,PageTransitionEvent:true,PaymentRequestEvent:true,PaymentRequestUpdateEvent:true,PointerEvent:true,PopStateEvent:true,PresentationConnectionAvailableEvent:true,PresentationConnectionCloseEvent:true,ProgressEvent:true,PromiseRejectionEvent:true,PushEvent:true,RTCDataChannelEvent:true,RTCDTMFToneChangeEvent:true,RTCPeerConnectionIceEvent:true,RTCTrackEvent:true,SecurityPolicyViolationEvent:true,SensorErrorEvent:true,SpeechRecognitionError:true,SpeechRecognitionEvent:true,SpeechSynthesisEvent:true,StorageEvent:true,SyncEvent:true,TextEvent:true,TouchEvent:true,TrackEvent:true,TransitionEvent:true,WebKitTransitionEvent:true,UIEvent:true,VRDeviceEvent:true,VRDisplayEvent:true,VRSessionEvent:true,WheelEvent:true,MojoInterfaceRequestEvent:true,ResourceProgressEvent:true,USBConnectionEvent:true,IDBVersionChangeEvent:true,AudioProcessingEvent:true,OfflineAudioCompletionEvent:true,WebGLContextEvent:true,EventTarget:false,HTMLFormElement:true,HTMLCollection:true,HTMLFormControlsCollection:true,HTMLOptionsCollection:true,Document:true,DocumentFragment:true,HTMLDocument:true,ShadowRoot:true,XMLDocument:true,Attr:true,DocumentType:true,Node:false,NodeList:true,RadioNodeList:true,HTMLSelectElement:true,Window:true,DOMWindow:true,SVGAElement:true,SVGAnimateElement:true,SVGAnimateMotionElement:true,SVGAnimateTransformElement:true,SVGAnimationElement:true,SVGCircleElement:true,SVGClipPathElement:true,SVGDefsElement:true,SVGDescElement:true,SVGDiscardElement:true,SVGEllipseElement:true,SVGFEBlendElement:true,SVGFEColorMatrixElement:true,SVGFEComponentTransferElement:true,SVGFECompositeElement:true,SVGFEConvolveMatrixElement:true,SVGFEDiffuseLightingElement:true,SVGFEDisplacementMapElement:true,SVGFEDistantLightElement:true,SVGFEFloodElement:true,SVGFEFuncAElement:true,SVGFEFuncBElement:true,SVGFEFuncGElement:true,SVGFEFuncRElement:true,SVGFEGaussianBlurElement:true,SVGFEImageElement:true,SVGFEMergeElement:true,SVGFEMergeNodeElement:true,SVGFEMorphologyElement:true,SVGFEOffsetElement:true,SVGFEPointLightElement:true,SVGFESpecularLightingElement:true,SVGFESpotLightElement:true,SVGFETileElement:true,SVGFETurbulenceElement:true,SVGFilterElement:true,SVGForeignObjectElement:true,SVGGElement:true,SVGGeometryElement:true,SVGGraphicsElement:true,SVGImageElement:true,SVGLineElement:true,SVGLinearGradientElement:true,SVGMarkerElement:true,SVGMaskElement:true,SVGMetadataElement:true,SVGPathElement:true,SVGPatternElement:true,SVGPolygonElement:true,SVGPolylineElement:true,SVGRadialGradientElement:true,SVGRectElement:true,SVGScriptElement:true,SVGSetElement:true,SVGStopElement:true,SVGStyleElement:true,SVGElement:true,SVGSVGElement:true,SVGSwitchElement:true,SVGSymbolElement:true,SVGTSpanElement:true,SVGTextContentElement:true,SVGTextElement:true,SVGTextPathElement:true,SVGTextPositioningElement:true,SVGTitleElement:true,SVGUseElement:true,SVGViewElement:true,SVGGradientElement:true,SVGComponentTransferFunctionElement:true,SVGFEDropShadowElement:true,SVGMPathElement:true})})()
convertAllToFastObject(w)
convertToFastObject($);(function(a){if(typeof document==="undefined"){a(null)
return}if(typeof document.currentScript!="undefined"){a(document.currentScript)
return}var s=document.scripts
function onLoad(b){for(var q=0;q<s.length;++q)s[q].removeEventListener("load",onLoad,false)
a(b.target)}for(var r=0;r<s.length;++r)s[r].addEventListener("load",onLoad,false)})(function(a){v.currentScript=a
var s=A.fi
if(typeof dartMainRunner==="function")dartMainRunner(s,[])
else s([])})})()
//# sourceMappingURL=kitawi.dart.js.map
