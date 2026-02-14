#!/bin/bash
set -e # Termina se c'è un errore

echo "Inizio ricostruzione progetto..."

mkdir -p "."
echo "Creating components.json..."
cat << 'END_OF_FILE_CONTENT' > "components.json"
{
  "$schema": "https://ui.shadcn.com/schema.json",
  "style": "radix-nova",
  "rsc": false,
  "tsx": true,
  "tailwind": {
    "config": "",
    "css": "src/index.css",
    "baseColor": "zinc",
    "cssVariables": true,
    "prefix": ""
  },
  "iconLibrary": "lucide",
  "rtl": false,
  "aliases": {
    "components": "@/components",
    "utils": "@/lib/utils",
    "ui": "@/components/ui",
    "lib": "@/lib",
    "hooks": "@/hooks"
  },
  "menuColor": "default",
  "menuAccent": "bold",
  "registries": {}
}



END_OF_FILE_CONTENT
mkdir -p "dist"
mkdir -p "dist/assets"
echo "Creating dist/assets/index-DpwGE-uV.js..."
cat << 'END_OF_FILE_CONTENT' > "dist/assets/index-DpwGE-uV.js"
function tw(n,r){for(var o=0;o<r.length;o++){const l=r[o];if(typeof l!="string"&&!Array.isArray(l)){for(const s in l)if(s!=="default"&&!(s in n)){const c=Object.getOwnPropertyDescriptor(l,s);c&&Object.defineProperty(n,s,c.get?c:{enumerable:!0,get:()=>l[s]})}}}return Object.freeze(Object.defineProperty(n,Symbol.toStringTag,{value:"Module"}))}(function(){const r=document.createElement("link").relList;if(r&&r.supports&&r.supports("modulepreload"))return;for(const s of document.querySelectorAll('link[rel="modulepreload"]'))l(s);new MutationObserver(s=>{for(const c of s)if(c.type==="childList")for(const f of c.addedNodes)f.tagName==="LINK"&&f.rel==="modulepreload"&&l(f)}).observe(document,{childList:!0,subtree:!0});function o(s){const c={};return s.integrity&&(c.integrity=s.integrity),s.referrerPolicy&&(c.referrerPolicy=s.referrerPolicy),s.crossOrigin==="use-credentials"?c.credentials="include":s.crossOrigin==="anonymous"?c.credentials="omit":c.credentials="same-origin",c}function l(s){if(s.ep)return;s.ep=!0;const c=o(s);fetch(s.href,c)}})();var Gn=typeof globalThis<"u"?globalThis:typeof window<"u"?window:typeof global<"u"?global:typeof self<"u"?self:{};function ws(n){return n&&n.__esModule&&Object.prototype.hasOwnProperty.call(n,"default")?n.default:n}var Ku={exports:{}},xo={};/**
 * @license React
 * react-jsx-runtime.production.js
 *
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */var ag;function aw(){if(ag)return xo;ag=1;var n=Symbol.for("react.transitional.element"),r=Symbol.for("react.fragment");function o(l,s,c){var f=null;if(c!==void 0&&(f=""+c),s.key!==void 0&&(f=""+s.key),"key"in s){c={};for(var h in s)h!=="key"&&(c[h]=s[h])}else c=s;return s=c.ref,{$$typeof:n,type:l,key:f,ref:s!==void 0?s:null,props:c}}return xo.Fragment=r,xo.jsx=o,xo.jsxs=o,xo}var ng;function nw(){return ng||(ng=1,Ku.exports=aw()),Ku.exports}var _=nw(),Pu={exports:{}},He={};/**
 * @license React
 * react.production.js
 *
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */var rg;function rw(){if(rg)return He;rg=1;var n=Symbol.for("react.transitional.element"),r=Symbol.for("react.portal"),o=Symbol.for("react.fragment"),l=Symbol.for("react.strict_mode"),s=Symbol.for("react.profiler"),c=Symbol.for("react.consumer"),f=Symbol.for("react.context"),h=Symbol.for("react.forward_ref"),p=Symbol.for("react.suspense"),m=Symbol.for("react.memo"),v=Symbol.for("react.lazy"),b=Symbol.for("react.activity"),E=Symbol.iterator;function x(O){return O===null||typeof O!="object"?null:(O=E&&O[E]||O["@@iterator"],typeof O=="function"?O:null)}var z={isMounted:function(){return!1},enqueueForceUpdate:function(){},enqueueReplaceState:function(){},enqueueSetState:function(){}},g=Object.assign,w={};function k(O,D,re){this.props=O,this.context=D,this.refs=w,this.updater=re||z}k.prototype.isReactComponent={},k.prototype.setState=function(O,D){if(typeof O!="object"&&typeof O!="function"&&O!=null)throw Error("takes an object of state variables to update or a function which returns an object of state variables.");this.updater.enqueueSetState(this,O,D,"setState")},k.prototype.forceUpdate=function(O){this.updater.enqueueForceUpdate(this,O,"forceUpdate")};function A(){}A.prototype=k.prototype;function N(O,D,re){this.props=O,this.context=D,this.refs=w,this.updater=re||z}var R=N.prototype=new A;R.constructor=N,g(R,k.prototype),R.isPureReactComponent=!0;var U=Array.isArray;function Y(){}var H={H:null,A:null,T:null,S:null},I=Object.prototype.hasOwnProperty;function K(O,D,re){var ee=re.ref;return{$$typeof:n,type:O,key:D,ref:ee!==void 0?ee:null,props:re}}function se(O,D){return K(O.type,D,O.props)}function ge(O){return typeof O=="object"&&O!==null&&O.$$typeof===n}function B(O){var D={"=":"=0",":":"=2"};return"$"+O.replace(/[=:]/g,function(re){return D[re]})}var W=/\/+/g;function C(O,D){return typeof O=="object"&&O!==null&&O.key!=null?B(""+O.key):D.toString(36)}function ae(O){switch(O.status){case"fulfilled":return O.value;case"rejected":throw O.reason;default:switch(typeof O.status=="string"?O.then(Y,Y):(O.status="pending",O.then(function(D){O.status==="pending"&&(O.status="fulfilled",O.value=D)},function(D){O.status==="pending"&&(O.status="rejected",O.reason=D)})),O.status){case"fulfilled":return O.value;case"rejected":throw O.reason}}throw O}function V(O,D,re,ee,le){var Ee=typeof O;(Ee==="undefined"||Ee==="boolean")&&(O=null);var he=!1;if(O===null)he=!0;else switch(Ee){case"bigint":case"string":case"number":he=!0;break;case"object":switch(O.$$typeof){case n:case r:he=!0;break;case v:return he=O._init,V(he(O._payload),D,re,ee,le)}}if(he)return le=le(O),he=ee===""?"."+C(O,0):ee,U(le)?(re="",he!=null&&(re=he.replace(W,"$&/")+"/"),V(le,D,re,"",function(Me){return Me})):le!=null&&(ge(le)&&(le=se(le,re+(le.key==null||O&&O.key===le.key?"":(""+le.key).replace(W,"$&/")+"/")+he)),D.push(le)),1;he=0;var Se=ee===""?".":ee+":";if(U(O))for(var ke=0;ke<O.length;ke++)ee=O[ke],Ee=Se+C(ee,ke),he+=V(ee,D,re,Ee,le);else if(ke=x(O),typeof ke=="function")for(O=ke.call(O),ke=0;!(ee=O.next()).done;)ee=ee.value,Ee=Se+C(ee,ke++),he+=V(ee,D,re,Ee,le);else if(Ee==="object"){if(typeof O.then=="function")return V(ae(O),D,re,ee,le);throw D=String(O),Error("Objects are not valid as a React child (found: "+(D==="[object Object]"?"object with keys {"+Object.keys(O).join(", ")+"}":D)+"). If you meant to render a collection of children, use an array instead.")}return he}function q(O,D,re){if(O==null)return O;var ee=[],le=0;return V(O,ee,"","",function(Ee){return D.call(re,Ee,le++)}),ee}function Q(O){if(O._status===-1){var D=O._result;D=D(),D.then(function(re){(O._status===0||O._status===-1)&&(O._status=1,O._result=re)},function(re){(O._status===0||O._status===-1)&&(O._status=2,O._result=re)}),O._status===-1&&(O._status=0,O._result=D)}if(O._status===1)return O._result.default;throw O._result}var ne=typeof reportError=="function"?reportError:function(O){if(typeof window=="object"&&typeof window.ErrorEvent=="function"){var D=new window.ErrorEvent("error",{bubbles:!0,cancelable:!0,message:typeof O=="object"&&O!==null&&typeof O.message=="string"?String(O.message):String(O),error:O});if(!window.dispatchEvent(D))return}else if(typeof process=="object"&&typeof process.emit=="function"){process.emit("uncaughtException",O);return}console.error(O)},ve={map:q,forEach:function(O,D,re){q(O,function(){D.apply(this,arguments)},re)},count:function(O){var D=0;return q(O,function(){D++}),D},toArray:function(O){return q(O,function(D){return D})||[]},only:function(O){if(!ge(O))throw Error("React.Children.only expected to receive a single React element child.");return O}};return He.Activity=b,He.Children=ve,He.Component=k,He.Fragment=o,He.Profiler=s,He.PureComponent=N,He.StrictMode=l,He.Suspense=p,He.__CLIENT_INTERNALS_DO_NOT_USE_OR_WARN_USERS_THEY_CANNOT_UPGRADE=H,He.__COMPILER_RUNTIME={__proto__:null,c:function(O){return H.H.useMemoCache(O)}},He.cache=function(O){return function(){return O.apply(null,arguments)}},He.cacheSignal=function(){return null},He.cloneElement=function(O,D,re){if(O==null)throw Error("The argument must be a React element, but you passed "+O+".");var ee=g({},O.props),le=O.key;if(D!=null)for(Ee in D.key!==void 0&&(le=""+D.key),D)!I.call(D,Ee)||Ee==="key"||Ee==="__self"||Ee==="__source"||Ee==="ref"&&D.ref===void 0||(ee[Ee]=D[Ee]);var Ee=arguments.length-2;if(Ee===1)ee.children=re;else if(1<Ee){for(var he=Array(Ee),Se=0;Se<Ee;Se++)he[Se]=arguments[Se+2];ee.children=he}return K(O.type,le,ee)},He.createContext=function(O){return O={$$typeof:f,_currentValue:O,_currentValue2:O,_threadCount:0,Provider:null,Consumer:null},O.Provider=O,O.Consumer={$$typeof:c,_context:O},O},He.createElement=function(O,D,re){var ee,le={},Ee=null;if(D!=null)for(ee in D.key!==void 0&&(Ee=""+D.key),D)I.call(D,ee)&&ee!=="key"&&ee!=="__self"&&ee!=="__source"&&(le[ee]=D[ee]);var he=arguments.length-2;if(he===1)le.children=re;else if(1<he){for(var Se=Array(he),ke=0;ke<he;ke++)Se[ke]=arguments[ke+2];le.children=Se}if(O&&O.defaultProps)for(ee in he=O.defaultProps,he)le[ee]===void 0&&(le[ee]=he[ee]);return K(O,Ee,le)},He.createRef=function(){return{current:null}},He.forwardRef=function(O){return{$$typeof:h,render:O}},He.isValidElement=ge,He.lazy=function(O){return{$$typeof:v,_payload:{_status:-1,_result:O},_init:Q}},He.memo=function(O,D){return{$$typeof:m,type:O,compare:D===void 0?null:D}},He.startTransition=function(O){var D=H.T,re={};H.T=re;try{var ee=O(),le=H.S;le!==null&&le(re,ee),typeof ee=="object"&&ee!==null&&typeof ee.then=="function"&&ee.then(Y,ne)}catch(Ee){ne(Ee)}finally{D!==null&&re.types!==null&&(D.types=re.types),H.T=D}},He.unstable_useCacheRefresh=function(){return H.H.useCacheRefresh()},He.use=function(O){return H.H.use(O)},He.useActionState=function(O,D,re){return H.H.useActionState(O,D,re)},He.useCallback=function(O,D){return H.H.useCallback(O,D)},He.useContext=function(O){return H.H.useContext(O)},He.useDebugValue=function(){},He.useDeferredValue=function(O,D){return H.H.useDeferredValue(O,D)},He.useEffect=function(O,D){return H.H.useEffect(O,D)},He.useEffectEvent=function(O){return H.H.useEffectEvent(O)},He.useId=function(){return H.H.useId()},He.useImperativeHandle=function(O,D,re){return H.H.useImperativeHandle(O,D,re)},He.useInsertionEffect=function(O,D){return H.H.useInsertionEffect(O,D)},He.useLayoutEffect=function(O,D){return H.H.useLayoutEffect(O,D)},He.useMemo=function(O,D){return H.H.useMemo(O,D)},He.useOptimistic=function(O,D){return H.H.useOptimistic(O,D)},He.useReducer=function(O,D,re){return H.H.useReducer(O,D,re)},He.useRef=function(O){return H.H.useRef(O)},He.useState=function(O){return H.H.useState(O)},He.useSyncExternalStore=function(O,D,re){return H.H.useSyncExternalStore(O,D,re)},He.useTransition=function(){return H.H.useTransition()},He.version="19.2.4",He}var ig;function Ud(){return ig||(ig=1,Pu.exports=rw()),Pu.exports}var j=Ud();const Sa=ws(j),Ld=tw({__proto__:null,default:Sa},[j]);var Ju={exports:{}},wo={},Wu={exports:{}},$u={};/**
 * @license React
 * scheduler.production.js
 *
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */var og;function iw(){return og||(og=1,(function(n){function r(V,q){var Q=V.length;V.push(q);e:for(;0<Q;){var ne=Q-1>>>1,ve=V[ne];if(0<s(ve,q))V[ne]=q,V[Q]=ve,Q=ne;else break e}}function o(V){return V.length===0?null:V[0]}function l(V){if(V.length===0)return null;var q=V[0],Q=V.pop();if(Q!==q){V[0]=Q;e:for(var ne=0,ve=V.length,O=ve>>>1;ne<O;){var D=2*(ne+1)-1,re=V[D],ee=D+1,le=V[ee];if(0>s(re,Q))ee<ve&&0>s(le,re)?(V[ne]=le,V[ee]=Q,ne=ee):(V[ne]=re,V[D]=Q,ne=D);else if(ee<ve&&0>s(le,Q))V[ne]=le,V[ee]=Q,ne=ee;else break e}}return q}function s(V,q){var Q=V.sortIndex-q.sortIndex;return Q!==0?Q:V.id-q.id}if(n.unstable_now=void 0,typeof performance=="object"&&typeof performance.now=="function"){var c=performance;n.unstable_now=function(){return c.now()}}else{var f=Date,h=f.now();n.unstable_now=function(){return f.now()-h}}var p=[],m=[],v=1,b=null,E=3,x=!1,z=!1,g=!1,w=!1,k=typeof setTimeout=="function"?setTimeout:null,A=typeof clearTimeout=="function"?clearTimeout:null,N=typeof setImmediate<"u"?setImmediate:null;function R(V){for(var q=o(m);q!==null;){if(q.callback===null)l(m);else if(q.startTime<=V)l(m),q.sortIndex=q.expirationTime,r(p,q);else break;q=o(m)}}function U(V){if(g=!1,R(V),!z)if(o(p)!==null)z=!0,Y||(Y=!0,B());else{var q=o(m);q!==null&&ae(U,q.startTime-V)}}var Y=!1,H=-1,I=5,K=-1;function se(){return w?!0:!(n.unstable_now()-K<I)}function ge(){if(w=!1,Y){var V=n.unstable_now();K=V;var q=!0;try{e:{z=!1,g&&(g=!1,A(H),H=-1),x=!0;var Q=E;try{t:{for(R(V),b=o(p);b!==null&&!(b.expirationTime>V&&se());){var ne=b.callback;if(typeof ne=="function"){b.callback=null,E=b.priorityLevel;var ve=ne(b.expirationTime<=V);if(V=n.unstable_now(),typeof ve=="function"){b.callback=ve,R(V),q=!0;break t}b===o(p)&&l(p),R(V)}else l(p);b=o(p)}if(b!==null)q=!0;else{var O=o(m);O!==null&&ae(U,O.startTime-V),q=!1}}break e}finally{b=null,E=Q,x=!1}q=void 0}}finally{q?B():Y=!1}}}var B;if(typeof N=="function")B=function(){N(ge)};else if(typeof MessageChannel<"u"){var W=new MessageChannel,C=W.port2;W.port1.onmessage=ge,B=function(){C.postMessage(null)}}else B=function(){k(ge,0)};function ae(V,q){H=k(function(){V(n.unstable_now())},q)}n.unstable_IdlePriority=5,n.unstable_ImmediatePriority=1,n.unstable_LowPriority=4,n.unstable_NormalPriority=3,n.unstable_Profiling=null,n.unstable_UserBlockingPriority=2,n.unstable_cancelCallback=function(V){V.callback=null},n.unstable_forceFrameRate=function(V){0>V||125<V?console.error("forceFrameRate takes a positive int between 0 and 125, forcing frame rates higher than 125 fps is not supported"):I=0<V?Math.floor(1e3/V):5},n.unstable_getCurrentPriorityLevel=function(){return E},n.unstable_next=function(V){switch(E){case 1:case 2:case 3:var q=3;break;default:q=E}var Q=E;E=q;try{return V()}finally{E=Q}},n.unstable_requestPaint=function(){w=!0},n.unstable_runWithPriority=function(V,q){switch(V){case 1:case 2:case 3:case 4:case 5:break;default:V=3}var Q=E;E=V;try{return q()}finally{E=Q}},n.unstable_scheduleCallback=function(V,q,Q){var ne=n.unstable_now();switch(typeof Q=="object"&&Q!==null?(Q=Q.delay,Q=typeof Q=="number"&&0<Q?ne+Q:ne):Q=ne,V){case 1:var ve=-1;break;case 2:ve=250;break;case 5:ve=1073741823;break;case 4:ve=1e4;break;default:ve=5e3}return ve=Q+ve,V={id:v++,callback:q,priorityLevel:V,startTime:Q,expirationTime:ve,sortIndex:-1},Q>ne?(V.sortIndex=Q,r(m,V),o(p)===null&&V===o(m)&&(g?(A(H),H=-1):g=!0,ae(U,Q-ne))):(V.sortIndex=ve,r(p,V),z||x||(z=!0,Y||(Y=!0,B()))),V},n.unstable_shouldYield=se,n.unstable_wrapCallback=function(V){var q=E;return function(){var Q=E;E=q;try{return V.apply(this,arguments)}finally{E=Q}}}})($u)),$u}var lg;function ow(){return lg||(lg=1,Wu.exports=iw()),Wu.exports}var ed={exports:{}},qt={};/**
 * @license React
 * react-dom.production.js
 *
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */var sg;function lw(){if(sg)return qt;sg=1;var n=Ud();function r(p){var m="https://react.dev/errors/"+p;if(1<arguments.length){m+="?args[]="+encodeURIComponent(arguments[1]);for(var v=2;v<arguments.length;v++)m+="&args[]="+encodeURIComponent(arguments[v])}return"Minified React error #"+p+"; visit "+m+" for the full message or use the non-minified dev environment for full errors and additional helpful warnings."}function o(){}var l={d:{f:o,r:function(){throw Error(r(522))},D:o,C:o,L:o,m:o,X:o,S:o,M:o},p:0,findDOMNode:null},s=Symbol.for("react.portal");function c(p,m,v){var b=3<arguments.length&&arguments[3]!==void 0?arguments[3]:null;return{$$typeof:s,key:b==null?null:""+b,children:p,containerInfo:m,implementation:v}}var f=n.__CLIENT_INTERNALS_DO_NOT_USE_OR_WARN_USERS_THEY_CANNOT_UPGRADE;function h(p,m){if(p==="font")return"";if(typeof m=="string")return m==="use-credentials"?m:""}return qt.__DOM_INTERNALS_DO_NOT_USE_OR_WARN_USERS_THEY_CANNOT_UPGRADE=l,qt.createPortal=function(p,m){var v=2<arguments.length&&arguments[2]!==void 0?arguments[2]:null;if(!m||m.nodeType!==1&&m.nodeType!==9&&m.nodeType!==11)throw Error(r(299));return c(p,m,null,v)},qt.flushSync=function(p){var m=f.T,v=l.p;try{if(f.T=null,l.p=2,p)return p()}finally{f.T=m,l.p=v,l.d.f()}},qt.preconnect=function(p,m){typeof p=="string"&&(m?(m=m.crossOrigin,m=typeof m=="string"?m==="use-credentials"?m:"":void 0):m=null,l.d.C(p,m))},qt.prefetchDNS=function(p){typeof p=="string"&&l.d.D(p)},qt.preinit=function(p,m){if(typeof p=="string"&&m&&typeof m.as=="string"){var v=m.as,b=h(v,m.crossOrigin),E=typeof m.integrity=="string"?m.integrity:void 0,x=typeof m.fetchPriority=="string"?m.fetchPriority:void 0;v==="style"?l.d.S(p,typeof m.precedence=="string"?m.precedence:void 0,{crossOrigin:b,integrity:E,fetchPriority:x}):v==="script"&&l.d.X(p,{crossOrigin:b,integrity:E,fetchPriority:x,nonce:typeof m.nonce=="string"?m.nonce:void 0})}},qt.preinitModule=function(p,m){if(typeof p=="string")if(typeof m=="object"&&m!==null){if(m.as==null||m.as==="script"){var v=h(m.as,m.crossOrigin);l.d.M(p,{crossOrigin:v,integrity:typeof m.integrity=="string"?m.integrity:void 0,nonce:typeof m.nonce=="string"?m.nonce:void 0})}}else m==null&&l.d.M(p)},qt.preload=function(p,m){if(typeof p=="string"&&typeof m=="object"&&m!==null&&typeof m.as=="string"){var v=m.as,b=h(v,m.crossOrigin);l.d.L(p,v,{crossOrigin:b,integrity:typeof m.integrity=="string"?m.integrity:void 0,nonce:typeof m.nonce=="string"?m.nonce:void 0,type:typeof m.type=="string"?m.type:void 0,fetchPriority:typeof m.fetchPriority=="string"?m.fetchPriority:void 0,referrerPolicy:typeof m.referrerPolicy=="string"?m.referrerPolicy:void 0,imageSrcSet:typeof m.imageSrcSet=="string"?m.imageSrcSet:void 0,imageSizes:typeof m.imageSizes=="string"?m.imageSizes:void 0,media:typeof m.media=="string"?m.media:void 0})}},qt.preloadModule=function(p,m){if(typeof p=="string")if(m){var v=h(m.as,m.crossOrigin);l.d.m(p,{as:typeof m.as=="string"&&m.as!=="script"?m.as:void 0,crossOrigin:v,integrity:typeof m.integrity=="string"?m.integrity:void 0})}else l.d.m(p)},qt.requestFormReset=function(p){l.d.r(p)},qt.unstable_batchedUpdates=function(p,m){return p(m)},qt.useFormState=function(p,m,v){return f.H.useFormState(p,m,v)},qt.useFormStatus=function(){return f.H.useHostTransitionStatus()},qt.version="19.2.4",qt}var cg;function zv(){if(cg)return ed.exports;cg=1;function n(){if(!(typeof __REACT_DEVTOOLS_GLOBAL_HOOK__>"u"||typeof __REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE!="function"))try{__REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE(n)}catch(r){console.error(r)}}return n(),ed.exports=lw(),ed.exports}/**
 * @license React
 * react-dom-client.production.js
 *
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */var ug;function sw(){if(ug)return wo;ug=1;var n=ow(),r=Ud(),o=zv();function l(e){var t="https://react.dev/errors/"+e;if(1<arguments.length){t+="?args[]="+encodeURIComponent(arguments[1]);for(var a=2;a<arguments.length;a++)t+="&args[]="+encodeURIComponent(arguments[a])}return"Minified React error #"+e+"; visit "+t+" for the full message or use the non-minified dev environment for full errors and additional helpful warnings."}function s(e){return!(!e||e.nodeType!==1&&e.nodeType!==9&&e.nodeType!==11)}function c(e){var t=e,a=e;if(e.alternate)for(;t.return;)t=t.return;else{e=t;do t=e,(t.flags&4098)!==0&&(a=t.return),e=t.return;while(e)}return t.tag===3?a:null}function f(e){if(e.tag===13){var t=e.memoizedState;if(t===null&&(e=e.alternate,e!==null&&(t=e.memoizedState)),t!==null)return t.dehydrated}return null}function h(e){if(e.tag===31){var t=e.memoizedState;if(t===null&&(e=e.alternate,e!==null&&(t=e.memoizedState)),t!==null)return t.dehydrated}return null}function p(e){if(c(e)!==e)throw Error(l(188))}function m(e){var t=e.alternate;if(!t){if(t=c(e),t===null)throw Error(l(188));return t!==e?null:e}for(var a=e,i=t;;){var u=a.return;if(u===null)break;var d=u.alternate;if(d===null){if(i=u.return,i!==null){a=i;continue}break}if(u.child===d.child){for(d=u.child;d;){if(d===a)return p(u),e;if(d===i)return p(u),t;d=d.sibling}throw Error(l(188))}if(a.return!==i.return)a=u,i=d;else{for(var y=!1,T=u.child;T;){if(T===a){y=!0,a=u,i=d;break}if(T===i){y=!0,i=u,a=d;break}T=T.sibling}if(!y){for(T=d.child;T;){if(T===a){y=!0,a=d,i=u;break}if(T===i){y=!0,i=d,a=u;break}T=T.sibling}if(!y)throw Error(l(189))}}if(a.alternate!==i)throw Error(l(190))}if(a.tag!==3)throw Error(l(188));return a.stateNode.current===a?e:t}function v(e){var t=e.tag;if(t===5||t===26||t===27||t===6)return e;for(e=e.child;e!==null;){if(t=v(e),t!==null)return t;e=e.sibling}return null}var b=Object.assign,E=Symbol.for("react.element"),x=Symbol.for("react.transitional.element"),z=Symbol.for("react.portal"),g=Symbol.for("react.fragment"),w=Symbol.for("react.strict_mode"),k=Symbol.for("react.profiler"),A=Symbol.for("react.consumer"),N=Symbol.for("react.context"),R=Symbol.for("react.forward_ref"),U=Symbol.for("react.suspense"),Y=Symbol.for("react.suspense_list"),H=Symbol.for("react.memo"),I=Symbol.for("react.lazy"),K=Symbol.for("react.activity"),se=Symbol.for("react.memo_cache_sentinel"),ge=Symbol.iterator;function B(e){return e===null||typeof e!="object"?null:(e=ge&&e[ge]||e["@@iterator"],typeof e=="function"?e:null)}var W=Symbol.for("react.client.reference");function C(e){if(e==null)return null;if(typeof e=="function")return e.$$typeof===W?null:e.displayName||e.name||null;if(typeof e=="string")return e;switch(e){case g:return"Fragment";case k:return"Profiler";case w:return"StrictMode";case U:return"Suspense";case Y:return"SuspenseList";case K:return"Activity"}if(typeof e=="object")switch(e.$$typeof){case z:return"Portal";case N:return e.displayName||"Context";case A:return(e._context.displayName||"Context")+".Consumer";case R:var t=e.render;return e=e.displayName,e||(e=t.displayName||t.name||"",e=e!==""?"ForwardRef("+e+")":"ForwardRef"),e;case H:return t=e.displayName||null,t!==null?t:C(e.type)||"Memo";case I:t=e._payload,e=e._init;try{return C(e(t))}catch{}}return null}var ae=Array.isArray,V=r.__CLIENT_INTERNALS_DO_NOT_USE_OR_WARN_USERS_THEY_CANNOT_UPGRADE,q=o.__DOM_INTERNALS_DO_NOT_USE_OR_WARN_USERS_THEY_CANNOT_UPGRADE,Q={pending:!1,data:null,method:null,action:null},ne=[],ve=-1;function O(e){return{current:e}}function D(e){0>ve||(e.current=ne[ve],ne[ve]=null,ve--)}function re(e,t){ve++,ne[ve]=e.current,e.current=t}var ee=O(null),le=O(null),Ee=O(null),he=O(null);function Se(e,t){switch(re(Ee,t),re(le,e),re(ee,null),t.nodeType){case 9:case 11:e=(e=t.documentElement)&&(e=e.namespaceURI)?Em(e):0;break;default:if(e=t.tagName,t=t.namespaceURI)t=Em(t),e=zm(t,e);else switch(e){case"svg":e=1;break;case"math":e=2;break;default:e=0}}D(ee),re(ee,e)}function ke(){D(ee),D(le),D(Ee)}function Me(e){e.memoizedState!==null&&re(he,e);var t=ee.current,a=zm(t,e.type);t!==a&&(re(le,e),re(ee,a))}function Re(e){le.current===e&&(D(ee),D(le)),he.current===e&&(D(he),go._currentValue=Q)}var Le,st;function S(e){if(Le===void 0)try{throw Error()}catch(a){var t=a.stack.trim().match(/\n( *(at )?)/);Le=t&&t[1]||"",st=-1<a.stack.indexOf(`
    at`)?" (<anonymous>)":-1<a.stack.indexOf("@")?"@unknown:0:0":""}return`
`+Le+e+st}var ue=!1;function ie(e,t){if(!e||ue)return"";ue=!0;var a=Error.prepareStackTrace;Error.prepareStackTrace=void 0;try{var i={DetermineComponentFrameRoot:function(){try{if(t){var fe=function(){throw Error()};if(Object.defineProperty(fe.prototype,"props",{set:function(){throw Error()}}),typeof Reflect=="object"&&Reflect.construct){try{Reflect.construct(fe,[])}catch(oe){var te=oe}Reflect.construct(e,[],fe)}else{try{fe.call()}catch(oe){te=oe}e.call(fe.prototype)}}else{try{throw Error()}catch(oe){te=oe}(fe=e())&&typeof fe.catch=="function"&&fe.catch(function(){})}}catch(oe){if(oe&&te&&typeof oe.stack=="string")return[oe.stack,te.stack]}return[null,null]}};i.DetermineComponentFrameRoot.displayName="DetermineComponentFrameRoot";var u=Object.getOwnPropertyDescriptor(i.DetermineComponentFrameRoot,"name");u&&u.configurable&&Object.defineProperty(i.DetermineComponentFrameRoot,"name",{value:"DetermineComponentFrameRoot"});var d=i.DetermineComponentFrameRoot(),y=d[0],T=d[1];if(y&&T){var Z=y.split(`
`),J=T.split(`
`);for(u=i=0;i<Z.length&&!Z[i].includes("DetermineComponentFrameRoot");)i++;for(;u<J.length&&!J[u].includes("DetermineComponentFrameRoot");)u++;if(i===Z.length||u===J.length)for(i=Z.length-1,u=J.length-1;1<=i&&0<=u&&Z[i]!==J[u];)u--;for(;1<=i&&0<=u;i--,u--)if(Z[i]!==J[u]){if(i!==1||u!==1)do if(i--,u--,0>u||Z[i]!==J[u]){var ce=`
`+Z[i].replace(" at new "," at ");return e.displayName&&ce.includes("<anonymous>")&&(ce=ce.replace("<anonymous>",e.displayName)),ce}while(1<=i&&0<=u);break}}}finally{ue=!1,Error.prepareStackTrace=a}return(a=e?e.displayName||e.name:"")?S(a):""}function L(e,t){switch(e.tag){case 26:case 27:case 5:return S(e.type);case 16:return S("Lazy");case 13:return e.child!==t&&t!==null?S("Suspense Fallback"):S("Suspense");case 19:return S("SuspenseList");case 0:case 15:return ie(e.type,!1);case 11:return ie(e.type.render,!1);case 1:return ie(e.type,!0);case 31:return S("Activity");default:return""}}function M(e){try{var t="",a=null;do t+=L(e,a),a=e,e=e.return;while(e);return t}catch(i){return`
Error generating stack: `+i.message+`
`+i.stack}}var X=Object.prototype.hasOwnProperty,pe=n.unstable_scheduleCallback,me=n.unstable_cancelCallback,$=n.unstable_shouldYield,be=n.unstable_requestPaint,_e=n.unstable_now,xe=n.unstable_getCurrentPriorityLevel,De=n.unstable_ImmediatePriority,it=n.unstable_UserBlockingPriority,Ye=n.unstable_NormalPriority,It=n.unstable_LowPriority,mn=n.unstable_IdlePriority,ua=n.log,$n=n.unstable_setDisableYieldValue,ft=null,Rt=null;function da(e){if(typeof ua=="function"&&$n(e),Rt&&typeof Rt.setStrictMode=="function")try{Rt.setStrictMode(ft,e)}catch{}}var bt=Math.clz32?Math.clz32:Bs,Ro=Math.log,Ds=Math.LN2;function Bs(e){return e>>>=0,e===0?32:31-(Ro(e)/Ds|0)|0}var Er=256,er=262144,Ma=4194304;function fa(e){var t=e&42;if(t!==0)return t;switch(e&-e){case 1:return 1;case 2:return 2;case 4:return 4;case 8:return 8;case 16:return 16;case 32:return 32;case 64:return 64;case 128:return 128;case 256:case 512:case 1024:case 2048:case 4096:case 8192:case 16384:case 32768:case 65536:case 131072:return e&261888;case 262144:case 524288:case 1048576:case 2097152:return e&3932160;case 4194304:case 8388608:case 16777216:case 33554432:return e&62914560;case 67108864:return 67108864;case 134217728:return 134217728;case 268435456:return 268435456;case 536870912:return 536870912;case 1073741824:return 0;default:return e}}function Mo(e,t,a){var i=e.pendingLanes;if(i===0)return 0;var u=0,d=e.suspendedLanes,y=e.pingedLanes;e=e.warmLanes;var T=i&134217727;return T!==0?(i=T&~d,i!==0?u=fa(i):(y&=T,y!==0?u=fa(y):a||(a=T&~e,a!==0&&(u=fa(a))))):(T=i&~d,T!==0?u=fa(T):y!==0?u=fa(y):a||(a=i&~e,a!==0&&(u=fa(a)))),u===0?0:t!==0&&t!==u&&(t&d)===0&&(d=u&-u,a=t&-t,d>=a||d===32&&(a&4194048)!==0)?t:u}function Ai(e,t){return(e.pendingLanes&~(e.suspendedLanes&~e.pingedLanes)&t)===0}function qb(e,t){switch(e){case 1:case 2:case 4:case 8:case 64:return t+250;case 16:case 32:case 128:case 256:case 512:case 1024:case 2048:case 4096:case 8192:case 16384:case 32768:case 65536:case 131072:case 262144:case 524288:case 1048576:case 2097152:return t+5e3;case 4194304:case 8388608:case 16777216:case 33554432:return-1;case 67108864:case 134217728:case 268435456:case 536870912:case 1073741824:return-1;default:return-1}}function of(){var e=Ma;return Ma<<=1,(Ma&62914560)===0&&(Ma=4194304),e}function Us(e){for(var t=[],a=0;31>a;a++)t.push(e);return t}function Ti(e,t){e.pendingLanes|=t,t!==268435456&&(e.suspendedLanes=0,e.pingedLanes=0,e.warmLanes=0)}function Gb(e,t,a,i,u,d){var y=e.pendingLanes;e.pendingLanes=a,e.suspendedLanes=0,e.pingedLanes=0,e.warmLanes=0,e.expiredLanes&=a,e.entangledLanes&=a,e.errorRecoveryDisabledLanes&=a,e.shellSuspendCounter=0;var T=e.entanglements,Z=e.expirationTimes,J=e.hiddenUpdates;for(a=y&~a;0<a;){var ce=31-bt(a),fe=1<<ce;T[ce]=0,Z[ce]=-1;var te=J[ce];if(te!==null)for(J[ce]=null,ce=0;ce<te.length;ce++){var oe=te[ce];oe!==null&&(oe.lane&=-536870913)}a&=~fe}i!==0&&lf(e,i,0),d!==0&&u===0&&e.tag!==0&&(e.suspendedLanes|=d&~(y&~t))}function lf(e,t,a){e.pendingLanes|=t,e.suspendedLanes&=~t;var i=31-bt(t);e.entangledLanes|=t,e.entanglements[i]=e.entanglements[i]|1073741824|a&261930}function sf(e,t){var a=e.entangledLanes|=t;for(e=e.entanglements;a;){var i=31-bt(a),u=1<<i;u&t|e[i]&t&&(e[i]|=t),a&=~u}}function cf(e,t){var a=t&-t;return a=(a&42)!==0?1:Ls(a),(a&(e.suspendedLanes|t))!==0?0:a}function Ls(e){switch(e){case 2:e=1;break;case 8:e=4;break;case 32:e=16;break;case 256:case 512:case 1024:case 2048:case 4096:case 8192:case 16384:case 32768:case 65536:case 131072:case 262144:case 524288:case 1048576:case 2097152:case 4194304:case 8388608:case 16777216:case 33554432:e=128;break;case 268435456:e=134217728;break;default:e=0}return e}function Hs(e){return e&=-e,2<e?8<e?(e&134217727)!==0?32:268435456:8:2}function uf(){var e=q.p;return e!==0?e:(e=window.event,e===void 0?32:Km(e.type))}function df(e,t){var a=q.p;try{return q.p=e,t()}finally{q.p=a}}var gn=Math.random().toString(36).slice(2),Ut="__reactFiber$"+gn,Xt="__reactProps$"+gn,zr="__reactContainer$"+gn,Zs="__reactEvents$"+gn,Yb="__reactListeners$"+gn,Ib="__reactHandles$"+gn,ff="__reactResources$"+gn,Ni="__reactMarker$"+gn;function Vs(e){delete e[Ut],delete e[Xt],delete e[Zs],delete e[Yb],delete e[Ib]}function Cr(e){var t=e[Ut];if(t)return t;for(var a=e.parentNode;a;){if(t=a[zr]||a[Ut]){if(a=t.alternate,t.child!==null||a!==null&&a.child!==null)for(e=Rm(e);e!==null;){if(a=e[Ut])return a;e=Rm(e)}return t}e=a,a=e.parentNode}return null}function Ar(e){if(e=e[Ut]||e[zr]){var t=e.tag;if(t===5||t===6||t===13||t===31||t===26||t===27||t===3)return e}return null}function Oi(e){var t=e.tag;if(t===5||t===26||t===27||t===6)return e.stateNode;throw Error(l(33))}function Tr(e){var t=e[ff];return t||(t=e[ff]={hoistableStyles:new Map,hoistableScripts:new Map}),t}function Mt(e){e[Ni]=!0}var hf=new Set,pf={};function tr(e,t){Nr(e,t),Nr(e+"Capture",t)}function Nr(e,t){for(pf[e]=t,e=0;e<t.length;e++)hf.add(t[e])}var Xb=RegExp("^[:A-Z_a-z\\u00C0-\\u00D6\\u00D8-\\u00F6\\u00F8-\\u02FF\\u0370-\\u037D\\u037F-\\u1FFF\\u200C-\\u200D\\u2070-\\u218F\\u2C00-\\u2FEF\\u3001-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFFD][:A-Z_a-z\\u00C0-\\u00D6\\u00D8-\\u00F6\\u00F8-\\u02FF\\u0370-\\u037D\\u037F-\\u1FFF\\u200C-\\u200D\\u2070-\\u218F\\u2C00-\\u2FEF\\u3001-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFFD\\-.0-9\\u00B7\\u0300-\\u036F\\u203F-\\u2040]*$"),mf={},gf={};function Qb(e){return X.call(gf,e)?!0:X.call(mf,e)?!1:Xb.test(e)?gf[e]=!0:(mf[e]=!0,!1)}function Do(e,t,a){if(Qb(t))if(a===null)e.removeAttribute(t);else{switch(typeof a){case"undefined":case"function":case"symbol":e.removeAttribute(t);return;case"boolean":var i=t.toLowerCase().slice(0,5);if(i!=="data-"&&i!=="aria-"){e.removeAttribute(t);return}}e.setAttribute(t,""+a)}}function Bo(e,t,a){if(a===null)e.removeAttribute(t);else{switch(typeof a){case"undefined":case"function":case"symbol":case"boolean":e.removeAttribute(t);return}e.setAttribute(t,""+a)}}function Ia(e,t,a,i){if(i===null)e.removeAttribute(a);else{switch(typeof i){case"undefined":case"function":case"symbol":case"boolean":e.removeAttribute(a);return}e.setAttributeNS(t,a,""+i)}}function ha(e){switch(typeof e){case"bigint":case"boolean":case"number":case"string":case"undefined":return e;case"object":return e;default:return""}}function vf(e){var t=e.type;return(e=e.nodeName)&&e.toLowerCase()==="input"&&(t==="checkbox"||t==="radio")}function Fb(e,t,a){var i=Object.getOwnPropertyDescriptor(e.constructor.prototype,t);if(!e.hasOwnProperty(t)&&typeof i<"u"&&typeof i.get=="function"&&typeof i.set=="function"){var u=i.get,d=i.set;return Object.defineProperty(e,t,{configurable:!0,get:function(){return u.call(this)},set:function(y){a=""+y,d.call(this,y)}}),Object.defineProperty(e,t,{enumerable:i.enumerable}),{getValue:function(){return a},setValue:function(y){a=""+y},stopTracking:function(){e._valueTracker=null,delete e[t]}}}}function qs(e){if(!e._valueTracker){var t=vf(e)?"checked":"value";e._valueTracker=Fb(e,t,""+e[t])}}function bf(e){if(!e)return!1;var t=e._valueTracker;if(!t)return!0;var a=t.getValue(),i="";return e&&(i=vf(e)?e.checked?"true":"false":e.value),e=i,e!==a?(t.setValue(e),!0):!1}function Uo(e){if(e=e||(typeof document<"u"?document:void 0),typeof e>"u")return null;try{return e.activeElement||e.body}catch{return e.body}}var Kb=/[\n"\\]/g;function pa(e){return e.replace(Kb,function(t){return"\\"+t.charCodeAt(0).toString(16)+" "})}function Gs(e,t,a,i,u,d,y,T){e.name="",y!=null&&typeof y!="function"&&typeof y!="symbol"&&typeof y!="boolean"?e.type=y:e.removeAttribute("type"),t!=null?y==="number"?(t===0&&e.value===""||e.value!=t)&&(e.value=""+ha(t)):e.value!==""+ha(t)&&(e.value=""+ha(t)):y!=="submit"&&y!=="reset"||e.removeAttribute("value"),t!=null?Ys(e,y,ha(t)):a!=null?Ys(e,y,ha(a)):i!=null&&e.removeAttribute("value"),u==null&&d!=null&&(e.defaultChecked=!!d),u!=null&&(e.checked=u&&typeof u!="function"&&typeof u!="symbol"),T!=null&&typeof T!="function"&&typeof T!="symbol"&&typeof T!="boolean"?e.name=""+ha(T):e.removeAttribute("name")}function yf(e,t,a,i,u,d,y,T){if(d!=null&&typeof d!="function"&&typeof d!="symbol"&&typeof d!="boolean"&&(e.type=d),t!=null||a!=null){if(!(d!=="submit"&&d!=="reset"||t!=null)){qs(e);return}a=a!=null?""+ha(a):"",t=t!=null?""+ha(t):a,T||t===e.value||(e.value=t),e.defaultValue=t}i=i??u,i=typeof i!="function"&&typeof i!="symbol"&&!!i,e.checked=T?e.checked:!!i,e.defaultChecked=!!i,y!=null&&typeof y!="function"&&typeof y!="symbol"&&typeof y!="boolean"&&(e.name=y),qs(e)}function Ys(e,t,a){t==="number"&&Uo(e.ownerDocument)===e||e.defaultValue===""+a||(e.defaultValue=""+a)}function Or(e,t,a,i){if(e=e.options,t){t={};for(var u=0;u<a.length;u++)t["$"+a[u]]=!0;for(a=0;a<e.length;a++)u=t.hasOwnProperty("$"+e[a].value),e[a].selected!==u&&(e[a].selected=u),u&&i&&(e[a].defaultSelected=!0)}else{for(a=""+ha(a),t=null,u=0;u<e.length;u++){if(e[u].value===a){e[u].selected=!0,i&&(e[u].defaultSelected=!0);return}t!==null||e[u].disabled||(t=e[u])}t!==null&&(t.selected=!0)}}function xf(e,t,a){if(t!=null&&(t=""+ha(t),t!==e.value&&(e.value=t),a==null)){e.defaultValue!==t&&(e.defaultValue=t);return}e.defaultValue=a!=null?""+ha(a):""}function wf(e,t,a,i){if(t==null){if(i!=null){if(a!=null)throw Error(l(92));if(ae(i)){if(1<i.length)throw Error(l(93));i=i[0]}a=i}a==null&&(a=""),t=a}a=ha(t),e.defaultValue=a,i=e.textContent,i===a&&i!==""&&i!==null&&(e.value=i),qs(e)}function jr(e,t){if(t){var a=e.firstChild;if(a&&a===e.lastChild&&a.nodeType===3){a.nodeValue=t;return}}e.textContent=t}var Pb=new Set("animationIterationCount aspectRatio borderImageOutset borderImageSlice borderImageWidth boxFlex boxFlexGroup boxOrdinalGroup columnCount columns flex flexGrow flexPositive flexShrink flexNegative flexOrder gridArea gridRow gridRowEnd gridRowSpan gridRowStart gridColumn gridColumnEnd gridColumnSpan gridColumnStart fontWeight lineClamp lineHeight opacity order orphans scale tabSize widows zIndex zoom fillOpacity floodOpacity stopOpacity strokeDasharray strokeDashoffset strokeMiterlimit strokeOpacity strokeWidth MozAnimationIterationCount MozBoxFlex MozBoxFlexGroup MozLineClamp msAnimationIterationCount msFlex msZoom msFlexGrow msFlexNegative msFlexOrder msFlexPositive msFlexShrink msGridColumn msGridColumnSpan msGridRow msGridRowSpan WebkitAnimationIterationCount WebkitBoxFlex WebKitBoxFlexGroup WebkitBoxOrdinalGroup WebkitColumnCount WebkitColumns WebkitFlex WebkitFlexGrow WebkitFlexPositive WebkitFlexShrink WebkitLineClamp".split(" "));function _f(e,t,a){var i=t.indexOf("--")===0;a==null||typeof a=="boolean"||a===""?i?e.setProperty(t,""):t==="float"?e.cssFloat="":e[t]="":i?e.setProperty(t,a):typeof a!="number"||a===0||Pb.has(t)?t==="float"?e.cssFloat=a:e[t]=(""+a).trim():e[t]=a+"px"}function Sf(e,t,a){if(t!=null&&typeof t!="object")throw Error(l(62));if(e=e.style,a!=null){for(var i in a)!a.hasOwnProperty(i)||t!=null&&t.hasOwnProperty(i)||(i.indexOf("--")===0?e.setProperty(i,""):i==="float"?e.cssFloat="":e[i]="");for(var u in t)i=t[u],t.hasOwnProperty(u)&&a[u]!==i&&_f(e,u,i)}else for(var d in t)t.hasOwnProperty(d)&&_f(e,d,t[d])}function Is(e){if(e.indexOf("-")===-1)return!1;switch(e){case"annotation-xml":case"color-profile":case"font-face":case"font-face-src":case"font-face-uri":case"font-face-format":case"font-face-name":case"missing-glyph":return!1;default:return!0}}var Jb=new Map([["acceptCharset","accept-charset"],["htmlFor","for"],["httpEquiv","http-equiv"],["crossOrigin","crossorigin"],["accentHeight","accent-height"],["alignmentBaseline","alignment-baseline"],["arabicForm","arabic-form"],["baselineShift","baseline-shift"],["capHeight","cap-height"],["clipPath","clip-path"],["clipRule","clip-rule"],["colorInterpolation","color-interpolation"],["colorInterpolationFilters","color-interpolation-filters"],["colorProfile","color-profile"],["colorRendering","color-rendering"],["dominantBaseline","dominant-baseline"],["enableBackground","enable-background"],["fillOpacity","fill-opacity"],["fillRule","fill-rule"],["floodColor","flood-color"],["floodOpacity","flood-opacity"],["fontFamily","font-family"],["fontSize","font-size"],["fontSizeAdjust","font-size-adjust"],["fontStretch","font-stretch"],["fontStyle","font-style"],["fontVariant","font-variant"],["fontWeight","font-weight"],["glyphName","glyph-name"],["glyphOrientationHorizontal","glyph-orientation-horizontal"],["glyphOrientationVertical","glyph-orientation-vertical"],["horizAdvX","horiz-adv-x"],["horizOriginX","horiz-origin-x"],["imageRendering","image-rendering"],["letterSpacing","letter-spacing"],["lightingColor","lighting-color"],["markerEnd","marker-end"],["markerMid","marker-mid"],["markerStart","marker-start"],["overlinePosition","overline-position"],["overlineThickness","overline-thickness"],["paintOrder","paint-order"],["panose-1","panose-1"],["pointerEvents","pointer-events"],["renderingIntent","rendering-intent"],["shapeRendering","shape-rendering"],["stopColor","stop-color"],["stopOpacity","stop-opacity"],["strikethroughPosition","strikethrough-position"],["strikethroughThickness","strikethrough-thickness"],["strokeDasharray","stroke-dasharray"],["strokeDashoffset","stroke-dashoffset"],["strokeLinecap","stroke-linecap"],["strokeLinejoin","stroke-linejoin"],["strokeMiterlimit","stroke-miterlimit"],["strokeOpacity","stroke-opacity"],["strokeWidth","stroke-width"],["textAnchor","text-anchor"],["textDecoration","text-decoration"],["textRendering","text-rendering"],["transformOrigin","transform-origin"],["underlinePosition","underline-position"],["underlineThickness","underline-thickness"],["unicodeBidi","unicode-bidi"],["unicodeRange","unicode-range"],["unitsPerEm","units-per-em"],["vAlphabetic","v-alphabetic"],["vHanging","v-hanging"],["vIdeographic","v-ideographic"],["vMathematical","v-mathematical"],["vectorEffect","vector-effect"],["vertAdvY","vert-adv-y"],["vertOriginX","vert-origin-x"],["vertOriginY","vert-origin-y"],["wordSpacing","word-spacing"],["writingMode","writing-mode"],["xmlnsXlink","xmlns:xlink"],["xHeight","x-height"]]),Wb=/^[\u0000-\u001F ]*j[\r\n\t]*a[\r\n\t]*v[\r\n\t]*a[\r\n\t]*s[\r\n\t]*c[\r\n\t]*r[\r\n\t]*i[\r\n\t]*p[\r\n\t]*t[\r\n\t]*:/i;function Lo(e){return Wb.test(""+e)?"javascript:throw new Error('React has blocked a javascript: URL as a security precaution.')":e}function Xa(){}var Xs=null;function Qs(e){return e=e.target||e.srcElement||window,e.correspondingUseElement&&(e=e.correspondingUseElement),e.nodeType===3?e.parentNode:e}var Rr=null,Mr=null;function kf(e){var t=Ar(e);if(t&&(e=t.stateNode)){var a=e[Xt]||null;e:switch(e=t.stateNode,t.type){case"input":if(Gs(e,a.value,a.defaultValue,a.defaultValue,a.checked,a.defaultChecked,a.type,a.name),t=a.name,a.type==="radio"&&t!=null){for(a=e;a.parentNode;)a=a.parentNode;for(a=a.querySelectorAll('input[name="'+pa(""+t)+'"][type="radio"]'),t=0;t<a.length;t++){var i=a[t];if(i!==e&&i.form===e.form){var u=i[Xt]||null;if(!u)throw Error(l(90));Gs(i,u.value,u.defaultValue,u.defaultValue,u.checked,u.defaultChecked,u.type,u.name)}}for(t=0;t<a.length;t++)i=a[t],i.form===e.form&&bf(i)}break e;case"textarea":xf(e,a.value,a.defaultValue);break e;case"select":t=a.value,t!=null&&Or(e,!!a.multiple,t,!1)}}}var Fs=!1;function Ef(e,t,a){if(Fs)return e(t,a);Fs=!0;try{var i=e(t);return i}finally{if(Fs=!1,(Rr!==null||Mr!==null)&&(El(),Rr&&(t=Rr,e=Mr,Mr=Rr=null,kf(t),e)))for(t=0;t<e.length;t++)kf(e[t])}}function ji(e,t){var a=e.stateNode;if(a===null)return null;var i=a[Xt]||null;if(i===null)return null;a=i[t];e:switch(t){case"onClick":case"onClickCapture":case"onDoubleClick":case"onDoubleClickCapture":case"onMouseDown":case"onMouseDownCapture":case"onMouseMove":case"onMouseMoveCapture":case"onMouseUp":case"onMouseUpCapture":case"onMouseEnter":(i=!i.disabled)||(e=e.type,i=!(e==="button"||e==="input"||e==="select"||e==="textarea")),e=!i;break e;default:e=!1}if(e)return null;if(a&&typeof a!="function")throw Error(l(231,t,typeof a));return a}var Qa=!(typeof window>"u"||typeof window.document>"u"||typeof window.document.createElement>"u"),Ks=!1;if(Qa)try{var Ri={};Object.defineProperty(Ri,"passive",{get:function(){Ks=!0}}),window.addEventListener("test",Ri,Ri),window.removeEventListener("test",Ri,Ri)}catch{Ks=!1}var vn=null,Ps=null,Ho=null;function zf(){if(Ho)return Ho;var e,t=Ps,a=t.length,i,u="value"in vn?vn.value:vn.textContent,d=u.length;for(e=0;e<a&&t[e]===u[e];e++);var y=a-e;for(i=1;i<=y&&t[a-i]===u[d-i];i++);return Ho=u.slice(e,1<i?1-i:void 0)}function Zo(e){var t=e.keyCode;return"charCode"in e?(e=e.charCode,e===0&&t===13&&(e=13)):e=t,e===10&&(e=13),32<=e||e===13?e:0}function Vo(){return!0}function Cf(){return!1}function Qt(e){function t(a,i,u,d,y){this._reactName=a,this._targetInst=u,this.type=i,this.nativeEvent=d,this.target=y,this.currentTarget=null;for(var T in e)e.hasOwnProperty(T)&&(a=e[T],this[T]=a?a(d):d[T]);return this.isDefaultPrevented=(d.defaultPrevented!=null?d.defaultPrevented:d.returnValue===!1)?Vo:Cf,this.isPropagationStopped=Cf,this}return b(t.prototype,{preventDefault:function(){this.defaultPrevented=!0;var a=this.nativeEvent;a&&(a.preventDefault?a.preventDefault():typeof a.returnValue!="unknown"&&(a.returnValue=!1),this.isDefaultPrevented=Vo)},stopPropagation:function(){var a=this.nativeEvent;a&&(a.stopPropagation?a.stopPropagation():typeof a.cancelBubble!="unknown"&&(a.cancelBubble=!0),this.isPropagationStopped=Vo)},persist:function(){},isPersistent:Vo}),t}var ar={eventPhase:0,bubbles:0,cancelable:0,timeStamp:function(e){return e.timeStamp||Date.now()},defaultPrevented:0,isTrusted:0},qo=Qt(ar),Mi=b({},ar,{view:0,detail:0}),$b=Qt(Mi),Js,Ws,Di,Go=b({},Mi,{screenX:0,screenY:0,clientX:0,clientY:0,pageX:0,pageY:0,ctrlKey:0,shiftKey:0,altKey:0,metaKey:0,getModifierState:ec,button:0,buttons:0,relatedTarget:function(e){return e.relatedTarget===void 0?e.fromElement===e.srcElement?e.toElement:e.fromElement:e.relatedTarget},movementX:function(e){return"movementX"in e?e.movementX:(e!==Di&&(Di&&e.type==="mousemove"?(Js=e.screenX-Di.screenX,Ws=e.screenY-Di.screenY):Ws=Js=0,Di=e),Js)},movementY:function(e){return"movementY"in e?e.movementY:Ws}}),Af=Qt(Go),ey=b({},Go,{dataTransfer:0}),ty=Qt(ey),ay=b({},Mi,{relatedTarget:0}),$s=Qt(ay),ny=b({},ar,{animationName:0,elapsedTime:0,pseudoElement:0}),ry=Qt(ny),iy=b({},ar,{clipboardData:function(e){return"clipboardData"in e?e.clipboardData:window.clipboardData}}),oy=Qt(iy),ly=b({},ar,{data:0}),Tf=Qt(ly),sy={Esc:"Escape",Spacebar:" ",Left:"ArrowLeft",Up:"ArrowUp",Right:"ArrowRight",Down:"ArrowDown",Del:"Delete",Win:"OS",Menu:"ContextMenu",Apps:"ContextMenu",Scroll:"ScrollLock",MozPrintableKey:"Unidentified"},cy={8:"Backspace",9:"Tab",12:"Clear",13:"Enter",16:"Shift",17:"Control",18:"Alt",19:"Pause",20:"CapsLock",27:"Escape",32:" ",33:"PageUp",34:"PageDown",35:"End",36:"Home",37:"ArrowLeft",38:"ArrowUp",39:"ArrowRight",40:"ArrowDown",45:"Insert",46:"Delete",112:"F1",113:"F2",114:"F3",115:"F4",116:"F5",117:"F6",118:"F7",119:"F8",120:"F9",121:"F10",122:"F11",123:"F12",144:"NumLock",145:"ScrollLock",224:"Meta"},uy={Alt:"altKey",Control:"ctrlKey",Meta:"metaKey",Shift:"shiftKey"};function dy(e){var t=this.nativeEvent;return t.getModifierState?t.getModifierState(e):(e=uy[e])?!!t[e]:!1}function ec(){return dy}var fy=b({},Mi,{key:function(e){if(e.key){var t=sy[e.key]||e.key;if(t!=="Unidentified")return t}return e.type==="keypress"?(e=Zo(e),e===13?"Enter":String.fromCharCode(e)):e.type==="keydown"||e.type==="keyup"?cy[e.keyCode]||"Unidentified":""},code:0,location:0,ctrlKey:0,shiftKey:0,altKey:0,metaKey:0,repeat:0,locale:0,getModifierState:ec,charCode:function(e){return e.type==="keypress"?Zo(e):0},keyCode:function(e){return e.type==="keydown"||e.type==="keyup"?e.keyCode:0},which:function(e){return e.type==="keypress"?Zo(e):e.type==="keydown"||e.type==="keyup"?e.keyCode:0}}),hy=Qt(fy),py=b({},Go,{pointerId:0,width:0,height:0,pressure:0,tangentialPressure:0,tiltX:0,tiltY:0,twist:0,pointerType:0,isPrimary:0}),Nf=Qt(py),my=b({},Mi,{touches:0,targetTouches:0,changedTouches:0,altKey:0,metaKey:0,ctrlKey:0,shiftKey:0,getModifierState:ec}),gy=Qt(my),vy=b({},ar,{propertyName:0,elapsedTime:0,pseudoElement:0}),by=Qt(vy),yy=b({},Go,{deltaX:function(e){return"deltaX"in e?e.deltaX:"wheelDeltaX"in e?-e.wheelDeltaX:0},deltaY:function(e){return"deltaY"in e?e.deltaY:"wheelDeltaY"in e?-e.wheelDeltaY:"wheelDelta"in e?-e.wheelDelta:0},deltaZ:0,deltaMode:0}),xy=Qt(yy),wy=b({},ar,{newState:0,oldState:0}),_y=Qt(wy),Sy=[9,13,27,32],tc=Qa&&"CompositionEvent"in window,Bi=null;Qa&&"documentMode"in document&&(Bi=document.documentMode);var ky=Qa&&"TextEvent"in window&&!Bi,Of=Qa&&(!tc||Bi&&8<Bi&&11>=Bi),jf=" ",Rf=!1;function Mf(e,t){switch(e){case"keyup":return Sy.indexOf(t.keyCode)!==-1;case"keydown":return t.keyCode!==229;case"keypress":case"mousedown":case"focusout":return!0;default:return!1}}function Df(e){return e=e.detail,typeof e=="object"&&"data"in e?e.data:null}var Dr=!1;function Ey(e,t){switch(e){case"compositionend":return Df(t);case"keypress":return t.which!==32?null:(Rf=!0,jf);case"textInput":return e=t.data,e===jf&&Rf?null:e;default:return null}}function zy(e,t){if(Dr)return e==="compositionend"||!tc&&Mf(e,t)?(e=zf(),Ho=Ps=vn=null,Dr=!1,e):null;switch(e){case"paste":return null;case"keypress":if(!(t.ctrlKey||t.altKey||t.metaKey)||t.ctrlKey&&t.altKey){if(t.char&&1<t.char.length)return t.char;if(t.which)return String.fromCharCode(t.which)}return null;case"compositionend":return Of&&t.locale!=="ko"?null:t.data;default:return null}}var Cy={color:!0,date:!0,datetime:!0,"datetime-local":!0,email:!0,month:!0,number:!0,password:!0,range:!0,search:!0,tel:!0,text:!0,time:!0,url:!0,week:!0};function Bf(e){var t=e&&e.nodeName&&e.nodeName.toLowerCase();return t==="input"?!!Cy[e.type]:t==="textarea"}function Uf(e,t,a,i){Rr?Mr?Mr.push(i):Mr=[i]:Rr=i,t=jl(t,"onChange"),0<t.length&&(a=new qo("onChange","change",null,a,i),e.push({event:a,listeners:t}))}var Ui=null,Li=null;function Ay(e){ym(e,0)}function Yo(e){var t=Oi(e);if(bf(t))return e}function Lf(e,t){if(e==="change")return t}var Hf=!1;if(Qa){var ac;if(Qa){var nc="oninput"in document;if(!nc){var Zf=document.createElement("div");Zf.setAttribute("oninput","return;"),nc=typeof Zf.oninput=="function"}ac=nc}else ac=!1;Hf=ac&&(!document.documentMode||9<document.documentMode)}function Vf(){Ui&&(Ui.detachEvent("onpropertychange",qf),Li=Ui=null)}function qf(e){if(e.propertyName==="value"&&Yo(Li)){var t=[];Uf(t,Li,e,Qs(e)),Ef(Ay,t)}}function Ty(e,t,a){e==="focusin"?(Vf(),Ui=t,Li=a,Ui.attachEvent("onpropertychange",qf)):e==="focusout"&&Vf()}function Ny(e){if(e==="selectionchange"||e==="keyup"||e==="keydown")return Yo(Li)}function Oy(e,t){if(e==="click")return Yo(t)}function jy(e,t){if(e==="input"||e==="change")return Yo(t)}function Ry(e,t){return e===t&&(e!==0||1/e===1/t)||e!==e&&t!==t}var ea=typeof Object.is=="function"?Object.is:Ry;function Hi(e,t){if(ea(e,t))return!0;if(typeof e!="object"||e===null||typeof t!="object"||t===null)return!1;var a=Object.keys(e),i=Object.keys(t);if(a.length!==i.length)return!1;for(i=0;i<a.length;i++){var u=a[i];if(!X.call(t,u)||!ea(e[u],t[u]))return!1}return!0}function Gf(e){for(;e&&e.firstChild;)e=e.firstChild;return e}function Yf(e,t){var a=Gf(e);e=0;for(var i;a;){if(a.nodeType===3){if(i=e+a.textContent.length,e<=t&&i>=t)return{node:a,offset:t-e};e=i}e:{for(;a;){if(a.nextSibling){a=a.nextSibling;break e}a=a.parentNode}a=void 0}a=Gf(a)}}function If(e,t){return e&&t?e===t?!0:e&&e.nodeType===3?!1:t&&t.nodeType===3?If(e,t.parentNode):"contains"in e?e.contains(t):e.compareDocumentPosition?!!(e.compareDocumentPosition(t)&16):!1:!1}function Xf(e){e=e!=null&&e.ownerDocument!=null&&e.ownerDocument.defaultView!=null?e.ownerDocument.defaultView:window;for(var t=Uo(e.document);t instanceof e.HTMLIFrameElement;){try{var a=typeof t.contentWindow.location.href=="string"}catch{a=!1}if(a)e=t.contentWindow;else break;t=Uo(e.document)}return t}function rc(e){var t=e&&e.nodeName&&e.nodeName.toLowerCase();return t&&(t==="input"&&(e.type==="text"||e.type==="search"||e.type==="tel"||e.type==="url"||e.type==="password")||t==="textarea"||e.contentEditable==="true")}var My=Qa&&"documentMode"in document&&11>=document.documentMode,Br=null,ic=null,Zi=null,oc=!1;function Qf(e,t,a){var i=a.window===a?a.document:a.nodeType===9?a:a.ownerDocument;oc||Br==null||Br!==Uo(i)||(i=Br,"selectionStart"in i&&rc(i)?i={start:i.selectionStart,end:i.selectionEnd}:(i=(i.ownerDocument&&i.ownerDocument.defaultView||window).getSelection(),i={anchorNode:i.anchorNode,anchorOffset:i.anchorOffset,focusNode:i.focusNode,focusOffset:i.focusOffset}),Zi&&Hi(Zi,i)||(Zi=i,i=jl(ic,"onSelect"),0<i.length&&(t=new qo("onSelect","select",null,t,a),e.push({event:t,listeners:i}),t.target=Br)))}function nr(e,t){var a={};return a[e.toLowerCase()]=t.toLowerCase(),a["Webkit"+e]="webkit"+t,a["Moz"+e]="moz"+t,a}var Ur={animationend:nr("Animation","AnimationEnd"),animationiteration:nr("Animation","AnimationIteration"),animationstart:nr("Animation","AnimationStart"),transitionrun:nr("Transition","TransitionRun"),transitionstart:nr("Transition","TransitionStart"),transitioncancel:nr("Transition","TransitionCancel"),transitionend:nr("Transition","TransitionEnd")},lc={},Ff={};Qa&&(Ff=document.createElement("div").style,"AnimationEvent"in window||(delete Ur.animationend.animation,delete Ur.animationiteration.animation,delete Ur.animationstart.animation),"TransitionEvent"in window||delete Ur.transitionend.transition);function rr(e){if(lc[e])return lc[e];if(!Ur[e])return e;var t=Ur[e],a;for(a in t)if(t.hasOwnProperty(a)&&a in Ff)return lc[e]=t[a];return e}var Kf=rr("animationend"),Pf=rr("animationiteration"),Jf=rr("animationstart"),Dy=rr("transitionrun"),By=rr("transitionstart"),Uy=rr("transitioncancel"),Wf=rr("transitionend"),$f=new Map,sc="abort auxClick beforeToggle cancel canPlay canPlayThrough click close contextMenu copy cut drag dragEnd dragEnter dragExit dragLeave dragOver dragStart drop durationChange emptied encrypted ended error gotPointerCapture input invalid keyDown keyPress keyUp load loadedData loadedMetadata loadStart lostPointerCapture mouseDown mouseMove mouseOut mouseOver mouseUp paste pause play playing pointerCancel pointerDown pointerMove pointerOut pointerOver pointerUp progress rateChange reset resize seeked seeking stalled submit suspend timeUpdate touchCancel touchEnd touchStart volumeChange scroll toggle touchMove waiting wheel".split(" ");sc.push("scrollEnd");function Aa(e,t){$f.set(e,t),tr(t,[e])}var Io=typeof reportError=="function"?reportError:function(e){if(typeof window=="object"&&typeof window.ErrorEvent=="function"){var t=new window.ErrorEvent("error",{bubbles:!0,cancelable:!0,message:typeof e=="object"&&e!==null&&typeof e.message=="string"?String(e.message):String(e),error:e});if(!window.dispatchEvent(t))return}else if(typeof process=="object"&&typeof process.emit=="function"){process.emit("uncaughtException",e);return}console.error(e)},ma=[],Lr=0,cc=0;function Xo(){for(var e=Lr,t=cc=Lr=0;t<e;){var a=ma[t];ma[t++]=null;var i=ma[t];ma[t++]=null;var u=ma[t];ma[t++]=null;var d=ma[t];if(ma[t++]=null,i!==null&&u!==null){var y=i.pending;y===null?u.next=u:(u.next=y.next,y.next=u),i.pending=u}d!==0&&eh(a,u,d)}}function Qo(e,t,a,i){ma[Lr++]=e,ma[Lr++]=t,ma[Lr++]=a,ma[Lr++]=i,cc|=i,e.lanes|=i,e=e.alternate,e!==null&&(e.lanes|=i)}function uc(e,t,a,i){return Qo(e,t,a,i),Fo(e)}function ir(e,t){return Qo(e,null,null,t),Fo(e)}function eh(e,t,a){e.lanes|=a;var i=e.alternate;i!==null&&(i.lanes|=a);for(var u=!1,d=e.return;d!==null;)d.childLanes|=a,i=d.alternate,i!==null&&(i.childLanes|=a),d.tag===22&&(e=d.stateNode,e===null||e._visibility&1||(u=!0)),e=d,d=d.return;return e.tag===3?(d=e.stateNode,u&&t!==null&&(u=31-bt(a),e=d.hiddenUpdates,i=e[u],i===null?e[u]=[t]:i.push(t),t.lane=a|536870912),d):null}function Fo(e){if(50<so)throw so=0,yu=null,Error(l(185));for(var t=e.return;t!==null;)e=t,t=e.return;return e.tag===3?e.stateNode:null}var Hr={};function Ly(e,t,a,i){this.tag=e,this.key=a,this.sibling=this.child=this.return=this.stateNode=this.type=this.elementType=null,this.index=0,this.refCleanup=this.ref=null,this.pendingProps=t,this.dependencies=this.memoizedState=this.updateQueue=this.memoizedProps=null,this.mode=i,this.subtreeFlags=this.flags=0,this.deletions=null,this.childLanes=this.lanes=0,this.alternate=null}function ta(e,t,a,i){return new Ly(e,t,a,i)}function dc(e){return e=e.prototype,!(!e||!e.isReactComponent)}function Fa(e,t){var a=e.alternate;return a===null?(a=ta(e.tag,t,e.key,e.mode),a.elementType=e.elementType,a.type=e.type,a.stateNode=e.stateNode,a.alternate=e,e.alternate=a):(a.pendingProps=t,a.type=e.type,a.flags=0,a.subtreeFlags=0,a.deletions=null),a.flags=e.flags&65011712,a.childLanes=e.childLanes,a.lanes=e.lanes,a.child=e.child,a.memoizedProps=e.memoizedProps,a.memoizedState=e.memoizedState,a.updateQueue=e.updateQueue,t=e.dependencies,a.dependencies=t===null?null:{lanes:t.lanes,firstContext:t.firstContext},a.sibling=e.sibling,a.index=e.index,a.ref=e.ref,a.refCleanup=e.refCleanup,a}function th(e,t){e.flags&=65011714;var a=e.alternate;return a===null?(e.childLanes=0,e.lanes=t,e.child=null,e.subtreeFlags=0,e.memoizedProps=null,e.memoizedState=null,e.updateQueue=null,e.dependencies=null,e.stateNode=null):(e.childLanes=a.childLanes,e.lanes=a.lanes,e.child=a.child,e.subtreeFlags=0,e.deletions=null,e.memoizedProps=a.memoizedProps,e.memoizedState=a.memoizedState,e.updateQueue=a.updateQueue,e.type=a.type,t=a.dependencies,e.dependencies=t===null?null:{lanes:t.lanes,firstContext:t.firstContext}),e}function Ko(e,t,a,i,u,d){var y=0;if(i=e,typeof e=="function")dc(e)&&(y=1);else if(typeof e=="string")y=Gx(e,a,ee.current)?26:e==="html"||e==="head"||e==="body"?27:5;else e:switch(e){case K:return e=ta(31,a,t,u),e.elementType=K,e.lanes=d,e;case g:return or(a.children,u,d,t);case w:y=8,u|=24;break;case k:return e=ta(12,a,t,u|2),e.elementType=k,e.lanes=d,e;case U:return e=ta(13,a,t,u),e.elementType=U,e.lanes=d,e;case Y:return e=ta(19,a,t,u),e.elementType=Y,e.lanes=d,e;default:if(typeof e=="object"&&e!==null)switch(e.$$typeof){case N:y=10;break e;case A:y=9;break e;case R:y=11;break e;case H:y=14;break e;case I:y=16,i=null;break e}y=29,a=Error(l(130,e===null?"null":typeof e,"")),i=null}return t=ta(y,a,t,u),t.elementType=e,t.type=i,t.lanes=d,t}function or(e,t,a,i){return e=ta(7,e,i,t),e.lanes=a,e}function fc(e,t,a){return e=ta(6,e,null,t),e.lanes=a,e}function ah(e){var t=ta(18,null,null,0);return t.stateNode=e,t}function hc(e,t,a){return t=ta(4,e.children!==null?e.children:[],e.key,t),t.lanes=a,t.stateNode={containerInfo:e.containerInfo,pendingChildren:null,implementation:e.implementation},t}var nh=new WeakMap;function ga(e,t){if(typeof e=="object"&&e!==null){var a=nh.get(e);return a!==void 0?a:(t={value:e,source:t,stack:M(t)},nh.set(e,t),t)}return{value:e,source:t,stack:M(t)}}var Zr=[],Vr=0,Po=null,Vi=0,va=[],ba=0,bn=null,Da=1,Ba="";function Ka(e,t){Zr[Vr++]=Vi,Zr[Vr++]=Po,Po=e,Vi=t}function rh(e,t,a){va[ba++]=Da,va[ba++]=Ba,va[ba++]=bn,bn=e;var i=Da;e=Ba;var u=32-bt(i)-1;i&=~(1<<u),a+=1;var d=32-bt(t)+u;if(30<d){var y=u-u%5;d=(i&(1<<y)-1).toString(32),i>>=y,u-=y,Da=1<<32-bt(t)+u|a<<u|i,Ba=d+e}else Da=1<<d|a<<u|i,Ba=e}function pc(e){e.return!==null&&(Ka(e,1),rh(e,1,0))}function mc(e){for(;e===Po;)Po=Zr[--Vr],Zr[Vr]=null,Vi=Zr[--Vr],Zr[Vr]=null;for(;e===bn;)bn=va[--ba],va[ba]=null,Ba=va[--ba],va[ba]=null,Da=va[--ba],va[ba]=null}function ih(e,t){va[ba++]=Da,va[ba++]=Ba,va[ba++]=bn,Da=t.id,Ba=t.overflow,bn=e}var Lt=null,pt=null,Je=!1,yn=null,ya=!1,gc=Error(l(519));function xn(e){var t=Error(l(418,1<arguments.length&&arguments[1]!==void 0&&arguments[1]?"text":"HTML",""));throw qi(ga(t,e)),gc}function oh(e){var t=e.stateNode,a=e.type,i=e.memoizedProps;switch(t[Ut]=e,t[Xt]=i,a){case"dialog":Fe("cancel",t),Fe("close",t);break;case"iframe":case"object":case"embed":Fe("load",t);break;case"video":case"audio":for(a=0;a<uo.length;a++)Fe(uo[a],t);break;case"source":Fe("error",t);break;case"img":case"image":case"link":Fe("error",t),Fe("load",t);break;case"details":Fe("toggle",t);break;case"input":Fe("invalid",t),yf(t,i.value,i.defaultValue,i.checked,i.defaultChecked,i.type,i.name,!0);break;case"select":Fe("invalid",t);break;case"textarea":Fe("invalid",t),wf(t,i.value,i.defaultValue,i.children)}a=i.children,typeof a!="string"&&typeof a!="number"&&typeof a!="bigint"||t.textContent===""+a||i.suppressHydrationWarning===!0||Sm(t.textContent,a)?(i.popover!=null&&(Fe("beforetoggle",t),Fe("toggle",t)),i.onScroll!=null&&Fe("scroll",t),i.onScrollEnd!=null&&Fe("scrollend",t),i.onClick!=null&&(t.onclick=Xa),t=!0):t=!1,t||xn(e,!0)}function lh(e){for(Lt=e.return;Lt;)switch(Lt.tag){case 5:case 31:case 13:ya=!1;return;case 27:case 3:ya=!0;return;default:Lt=Lt.return}}function qr(e){if(e!==Lt)return!1;if(!Je)return lh(e),Je=!0,!1;var t=e.tag,a;if((a=t!==3&&t!==27)&&((a=t===5)&&(a=e.type,a=!(a!=="form"&&a!=="button")||Mu(e.type,e.memoizedProps)),a=!a),a&&pt&&xn(e),lh(e),t===13){if(e=e.memoizedState,e=e!==null?e.dehydrated:null,!e)throw Error(l(317));pt=jm(e)}else if(t===31){if(e=e.memoizedState,e=e!==null?e.dehydrated:null,!e)throw Error(l(317));pt=jm(e)}else t===27?(t=pt,Mn(e.type)?(e=Hu,Hu=null,pt=e):pt=t):pt=Lt?wa(e.stateNode.nextSibling):null;return!0}function lr(){pt=Lt=null,Je=!1}function vc(){var e=yn;return e!==null&&(Jt===null?Jt=e:Jt.push.apply(Jt,e),yn=null),e}function qi(e){yn===null?yn=[e]:yn.push(e)}var bc=O(null),sr=null,Pa=null;function wn(e,t,a){re(bc,t._currentValue),t._currentValue=a}function Ja(e){e._currentValue=bc.current,D(bc)}function yc(e,t,a){for(;e!==null;){var i=e.alternate;if((e.childLanes&t)!==t?(e.childLanes|=t,i!==null&&(i.childLanes|=t)):i!==null&&(i.childLanes&t)!==t&&(i.childLanes|=t),e===a)break;e=e.return}}function xc(e,t,a,i){var u=e.child;for(u!==null&&(u.return=e);u!==null;){var d=u.dependencies;if(d!==null){var y=u.child;d=d.firstContext;e:for(;d!==null;){var T=d;d=u;for(var Z=0;Z<t.length;Z++)if(T.context===t[Z]){d.lanes|=a,T=d.alternate,T!==null&&(T.lanes|=a),yc(d.return,a,e),i||(y=null);break e}d=T.next}}else if(u.tag===18){if(y=u.return,y===null)throw Error(l(341));y.lanes|=a,d=y.alternate,d!==null&&(d.lanes|=a),yc(y,a,e),y=null}else y=u.child;if(y!==null)y.return=u;else for(y=u;y!==null;){if(y===e){y=null;break}if(u=y.sibling,u!==null){u.return=y.return,y=u;break}y=y.return}u=y}}function Gr(e,t,a,i){e=null;for(var u=t,d=!1;u!==null;){if(!d){if((u.flags&524288)!==0)d=!0;else if((u.flags&262144)!==0)break}if(u.tag===10){var y=u.alternate;if(y===null)throw Error(l(387));if(y=y.memoizedProps,y!==null){var T=u.type;ea(u.pendingProps.value,y.value)||(e!==null?e.push(T):e=[T])}}else if(u===he.current){if(y=u.alternate,y===null)throw Error(l(387));y.memoizedState.memoizedState!==u.memoizedState.memoizedState&&(e!==null?e.push(go):e=[go])}u=u.return}e!==null&&xc(t,e,a,i),t.flags|=262144}function Jo(e){for(e=e.firstContext;e!==null;){if(!ea(e.context._currentValue,e.memoizedValue))return!0;e=e.next}return!1}function cr(e){sr=e,Pa=null,e=e.dependencies,e!==null&&(e.firstContext=null)}function Ht(e){return sh(sr,e)}function Wo(e,t){return sr===null&&cr(e),sh(e,t)}function sh(e,t){var a=t._currentValue;if(t={context:t,memoizedValue:a,next:null},Pa===null){if(e===null)throw Error(l(308));Pa=t,e.dependencies={lanes:0,firstContext:t},e.flags|=524288}else Pa=Pa.next=t;return a}var Hy=typeof AbortController<"u"?AbortController:function(){var e=[],t=this.signal={aborted:!1,addEventListener:function(a,i){e.push(i)}};this.abort=function(){t.aborted=!0,e.forEach(function(a){return a()})}},Zy=n.unstable_scheduleCallback,Vy=n.unstable_NormalPriority,Et={$$typeof:N,Consumer:null,Provider:null,_currentValue:null,_currentValue2:null,_threadCount:0};function wc(){return{controller:new Hy,data:new Map,refCount:0}}function Gi(e){e.refCount--,e.refCount===0&&Zy(Vy,function(){e.controller.abort()})}var Yi=null,_c=0,Yr=0,Ir=null;function qy(e,t){if(Yi===null){var a=Yi=[];_c=0,Yr=Eu(),Ir={status:"pending",value:void 0,then:function(i){a.push(i)}}}return _c++,t.then(ch,ch),t}function ch(){if(--_c===0&&Yi!==null){Ir!==null&&(Ir.status="fulfilled");var e=Yi;Yi=null,Yr=0,Ir=null;for(var t=0;t<e.length;t++)(0,e[t])()}}function Gy(e,t){var a=[],i={status:"pending",value:null,reason:null,then:function(u){a.push(u)}};return e.then(function(){i.status="fulfilled",i.value=t;for(var u=0;u<a.length;u++)(0,a[u])(t)},function(u){for(i.status="rejected",i.reason=u,u=0;u<a.length;u++)(0,a[u])(void 0)}),i}var uh=V.S;V.S=function(e,t){Qp=_e(),typeof t=="object"&&t!==null&&typeof t.then=="function"&&qy(e,t),uh!==null&&uh(e,t)};var ur=O(null);function Sc(){var e=ur.current;return e!==null?e:ht.pooledCache}function $o(e,t){t===null?re(ur,ur.current):re(ur,t.pool)}function dh(){var e=Sc();return e===null?null:{parent:Et._currentValue,pool:e}}var Xr=Error(l(460)),kc=Error(l(474)),el=Error(l(542)),tl={then:function(){}};function fh(e){return e=e.status,e==="fulfilled"||e==="rejected"}function hh(e,t,a){switch(a=e[a],a===void 0?e.push(t):a!==t&&(t.then(Xa,Xa),t=a),t.status){case"fulfilled":return t.value;case"rejected":throw e=t.reason,mh(e),e;default:if(typeof t.status=="string")t.then(Xa,Xa);else{if(e=ht,e!==null&&100<e.shellSuspendCounter)throw Error(l(482));e=t,e.status="pending",e.then(function(i){if(t.status==="pending"){var u=t;u.status="fulfilled",u.value=i}},function(i){if(t.status==="pending"){var u=t;u.status="rejected",u.reason=i}})}switch(t.status){case"fulfilled":return t.value;case"rejected":throw e=t.reason,mh(e),e}throw fr=t,Xr}}function dr(e){try{var t=e._init;return t(e._payload)}catch(a){throw a!==null&&typeof a=="object"&&typeof a.then=="function"?(fr=a,Xr):a}}var fr=null;function ph(){if(fr===null)throw Error(l(459));var e=fr;return fr=null,e}function mh(e){if(e===Xr||e===el)throw Error(l(483))}var Qr=null,Ii=0;function al(e){var t=Ii;return Ii+=1,Qr===null&&(Qr=[]),hh(Qr,e,t)}function Xi(e,t){t=t.props.ref,e.ref=t!==void 0?t:null}function nl(e,t){throw t.$$typeof===E?Error(l(525)):(e=Object.prototype.toString.call(t),Error(l(31,e==="[object Object]"?"object with keys {"+Object.keys(t).join(", ")+"}":e)))}function gh(e){function t(F,G){if(e){var P=F.deletions;P===null?(F.deletions=[G],F.flags|=16):P.push(G)}}function a(F,G){if(!e)return null;for(;G!==null;)t(F,G),G=G.sibling;return null}function i(F){for(var G=new Map;F!==null;)F.key!==null?G.set(F.key,F):G.set(F.index,F),F=F.sibling;return G}function u(F,G){return F=Fa(F,G),F.index=0,F.sibling=null,F}function d(F,G,P){return F.index=P,e?(P=F.alternate,P!==null?(P=P.index,P<G?(F.flags|=67108866,G):P):(F.flags|=67108866,G)):(F.flags|=1048576,G)}function y(F){return e&&F.alternate===null&&(F.flags|=67108866),F}function T(F,G,P,de){return G===null||G.tag!==6?(G=fc(P,F.mode,de),G.return=F,G):(G=u(G,P),G.return=F,G)}function Z(F,G,P,de){var Be=P.type;return Be===g?ce(F,G,P.props.children,de,P.key):G!==null&&(G.elementType===Be||typeof Be=="object"&&Be!==null&&Be.$$typeof===I&&dr(Be)===G.type)?(G=u(G,P.props),Xi(G,P),G.return=F,G):(G=Ko(P.type,P.key,P.props,null,F.mode,de),Xi(G,P),G.return=F,G)}function J(F,G,P,de){return G===null||G.tag!==4||G.stateNode.containerInfo!==P.containerInfo||G.stateNode.implementation!==P.implementation?(G=hc(P,F.mode,de),G.return=F,G):(G=u(G,P.children||[]),G.return=F,G)}function ce(F,G,P,de,Be){return G===null||G.tag!==7?(G=or(P,F.mode,de,Be),G.return=F,G):(G=u(G,P),G.return=F,G)}function fe(F,G,P){if(typeof G=="string"&&G!==""||typeof G=="number"||typeof G=="bigint")return G=fc(""+G,F.mode,P),G.return=F,G;if(typeof G=="object"&&G!==null){switch(G.$$typeof){case x:return P=Ko(G.type,G.key,G.props,null,F.mode,P),Xi(P,G),P.return=F,P;case z:return G=hc(G,F.mode,P),G.return=F,G;case I:return G=dr(G),fe(F,G,P)}if(ae(G)||B(G))return G=or(G,F.mode,P,null),G.return=F,G;if(typeof G.then=="function")return fe(F,al(G),P);if(G.$$typeof===N)return fe(F,Wo(F,G),P);nl(F,G)}return null}function te(F,G,P,de){var Be=G!==null?G.key:null;if(typeof P=="string"&&P!==""||typeof P=="number"||typeof P=="bigint")return Be!==null?null:T(F,G,""+P,de);if(typeof P=="object"&&P!==null){switch(P.$$typeof){case x:return P.key===Be?Z(F,G,P,de):null;case z:return P.key===Be?J(F,G,P,de):null;case I:return P=dr(P),te(F,G,P,de)}if(ae(P)||B(P))return Be!==null?null:ce(F,G,P,de,null);if(typeof P.then=="function")return te(F,G,al(P),de);if(P.$$typeof===N)return te(F,G,Wo(F,P),de);nl(F,P)}return null}function oe(F,G,P,de,Be){if(typeof de=="string"&&de!==""||typeof de=="number"||typeof de=="bigint")return F=F.get(P)||null,T(G,F,""+de,Be);if(typeof de=="object"&&de!==null){switch(de.$$typeof){case x:return F=F.get(de.key===null?P:de.key)||null,Z(G,F,de,Be);case z:return F=F.get(de.key===null?P:de.key)||null,J(G,F,de,Be);case I:return de=dr(de),oe(F,G,P,de,Be)}if(ae(de)||B(de))return F=F.get(P)||null,ce(G,F,de,Be,null);if(typeof de.then=="function")return oe(F,G,P,al(de),Be);if(de.$$typeof===N)return oe(F,G,P,Wo(G,de),Be);nl(G,de)}return null}function Ce(F,G,P,de){for(var Be=null,$e=null,Oe=G,Ge=G=0,Pe=null;Oe!==null&&Ge<P.length;Ge++){Oe.index>Ge?(Pe=Oe,Oe=null):Pe=Oe.sibling;var et=te(F,Oe,P[Ge],de);if(et===null){Oe===null&&(Oe=Pe);break}e&&Oe&&et.alternate===null&&t(F,Oe),G=d(et,G,Ge),$e===null?Be=et:$e.sibling=et,$e=et,Oe=Pe}if(Ge===P.length)return a(F,Oe),Je&&Ka(F,Ge),Be;if(Oe===null){for(;Ge<P.length;Ge++)Oe=fe(F,P[Ge],de),Oe!==null&&(G=d(Oe,G,Ge),$e===null?Be=Oe:$e.sibling=Oe,$e=Oe);return Je&&Ka(F,Ge),Be}for(Oe=i(Oe);Ge<P.length;Ge++)Pe=oe(Oe,F,Ge,P[Ge],de),Pe!==null&&(e&&Pe.alternate!==null&&Oe.delete(Pe.key===null?Ge:Pe.key),G=d(Pe,G,Ge),$e===null?Be=Pe:$e.sibling=Pe,$e=Pe);return e&&Oe.forEach(function(Hn){return t(F,Hn)}),Je&&Ka(F,Ge),Be}function Ue(F,G,P,de){if(P==null)throw Error(l(151));for(var Be=null,$e=null,Oe=G,Ge=G=0,Pe=null,et=P.next();Oe!==null&&!et.done;Ge++,et=P.next()){Oe.index>Ge?(Pe=Oe,Oe=null):Pe=Oe.sibling;var Hn=te(F,Oe,et.value,de);if(Hn===null){Oe===null&&(Oe=Pe);break}e&&Oe&&Hn.alternate===null&&t(F,Oe),G=d(Hn,G,Ge),$e===null?Be=Hn:$e.sibling=Hn,$e=Hn,Oe=Pe}if(et.done)return a(F,Oe),Je&&Ka(F,Ge),Be;if(Oe===null){for(;!et.done;Ge++,et=P.next())et=fe(F,et.value,de),et!==null&&(G=d(et,G,Ge),$e===null?Be=et:$e.sibling=et,$e=et);return Je&&Ka(F,Ge),Be}for(Oe=i(Oe);!et.done;Ge++,et=P.next())et=oe(Oe,F,Ge,et.value,de),et!==null&&(e&&et.alternate!==null&&Oe.delete(et.key===null?Ge:et.key),G=d(et,G,Ge),$e===null?Be=et:$e.sibling=et,$e=et);return e&&Oe.forEach(function(ew){return t(F,ew)}),Je&&Ka(F,Ge),Be}function dt(F,G,P,de){if(typeof P=="object"&&P!==null&&P.type===g&&P.key===null&&(P=P.props.children),typeof P=="object"&&P!==null){switch(P.$$typeof){case x:e:{for(var Be=P.key;G!==null;){if(G.key===Be){if(Be=P.type,Be===g){if(G.tag===7){a(F,G.sibling),de=u(G,P.props.children),de.return=F,F=de;break e}}else if(G.elementType===Be||typeof Be=="object"&&Be!==null&&Be.$$typeof===I&&dr(Be)===G.type){a(F,G.sibling),de=u(G,P.props),Xi(de,P),de.return=F,F=de;break e}a(F,G);break}else t(F,G);G=G.sibling}P.type===g?(de=or(P.props.children,F.mode,de,P.key),de.return=F,F=de):(de=Ko(P.type,P.key,P.props,null,F.mode,de),Xi(de,P),de.return=F,F=de)}return y(F);case z:e:{for(Be=P.key;G!==null;){if(G.key===Be)if(G.tag===4&&G.stateNode.containerInfo===P.containerInfo&&G.stateNode.implementation===P.implementation){a(F,G.sibling),de=u(G,P.children||[]),de.return=F,F=de;break e}else{a(F,G);break}else t(F,G);G=G.sibling}de=hc(P,F.mode,de),de.return=F,F=de}return y(F);case I:return P=dr(P),dt(F,G,P,de)}if(ae(P))return Ce(F,G,P,de);if(B(P)){if(Be=B(P),typeof Be!="function")throw Error(l(150));return P=Be.call(P),Ue(F,G,P,de)}if(typeof P.then=="function")return dt(F,G,al(P),de);if(P.$$typeof===N)return dt(F,G,Wo(F,P),de);nl(F,P)}return typeof P=="string"&&P!==""||typeof P=="number"||typeof P=="bigint"?(P=""+P,G!==null&&G.tag===6?(a(F,G.sibling),de=u(G,P),de.return=F,F=de):(a(F,G),de=fc(P,F.mode,de),de.return=F,F=de),y(F)):a(F,G)}return function(F,G,P,de){try{Ii=0;var Be=dt(F,G,P,de);return Qr=null,Be}catch(Oe){if(Oe===Xr||Oe===el)throw Oe;var $e=ta(29,Oe,null,F.mode);return $e.lanes=de,$e.return=F,$e}finally{}}}var hr=gh(!0),vh=gh(!1),_n=!1;function Ec(e){e.updateQueue={baseState:e.memoizedState,firstBaseUpdate:null,lastBaseUpdate:null,shared:{pending:null,lanes:0,hiddenCallbacks:null},callbacks:null}}function zc(e,t){e=e.updateQueue,t.updateQueue===e&&(t.updateQueue={baseState:e.baseState,firstBaseUpdate:e.firstBaseUpdate,lastBaseUpdate:e.lastBaseUpdate,shared:e.shared,callbacks:null})}function Sn(e){return{lane:e,tag:0,payload:null,callback:null,next:null}}function kn(e,t,a){var i=e.updateQueue;if(i===null)return null;if(i=i.shared,(at&2)!==0){var u=i.pending;return u===null?t.next=t:(t.next=u.next,u.next=t),i.pending=t,t=Fo(e),eh(e,null,a),t}return Qo(e,i,t,a),Fo(e)}function Qi(e,t,a){if(t=t.updateQueue,t!==null&&(t=t.shared,(a&4194048)!==0)){var i=t.lanes;i&=e.pendingLanes,a|=i,t.lanes=a,sf(e,a)}}function Cc(e,t){var a=e.updateQueue,i=e.alternate;if(i!==null&&(i=i.updateQueue,a===i)){var u=null,d=null;if(a=a.firstBaseUpdate,a!==null){do{var y={lane:a.lane,tag:a.tag,payload:a.payload,callback:null,next:null};d===null?u=d=y:d=d.next=y,a=a.next}while(a!==null);d===null?u=d=t:d=d.next=t}else u=d=t;a={baseState:i.baseState,firstBaseUpdate:u,lastBaseUpdate:d,shared:i.shared,callbacks:i.callbacks},e.updateQueue=a;return}e=a.lastBaseUpdate,e===null?a.firstBaseUpdate=t:e.next=t,a.lastBaseUpdate=t}var Ac=!1;function Fi(){if(Ac){var e=Ir;if(e!==null)throw e}}function Ki(e,t,a,i){Ac=!1;var u=e.updateQueue;_n=!1;var d=u.firstBaseUpdate,y=u.lastBaseUpdate,T=u.shared.pending;if(T!==null){u.shared.pending=null;var Z=T,J=Z.next;Z.next=null,y===null?d=J:y.next=J,y=Z;var ce=e.alternate;ce!==null&&(ce=ce.updateQueue,T=ce.lastBaseUpdate,T!==y&&(T===null?ce.firstBaseUpdate=J:T.next=J,ce.lastBaseUpdate=Z))}if(d!==null){var fe=u.baseState;y=0,ce=J=Z=null,T=d;do{var te=T.lane&-536870913,oe=te!==T.lane;if(oe?(Ke&te)===te:(i&te)===te){te!==0&&te===Yr&&(Ac=!0),ce!==null&&(ce=ce.next={lane:0,tag:T.tag,payload:T.payload,callback:null,next:null});e:{var Ce=e,Ue=T;te=t;var dt=a;switch(Ue.tag){case 1:if(Ce=Ue.payload,typeof Ce=="function"){fe=Ce.call(dt,fe,te);break e}fe=Ce;break e;case 3:Ce.flags=Ce.flags&-65537|128;case 0:if(Ce=Ue.payload,te=typeof Ce=="function"?Ce.call(dt,fe,te):Ce,te==null)break e;fe=b({},fe,te);break e;case 2:_n=!0}}te=T.callback,te!==null&&(e.flags|=64,oe&&(e.flags|=8192),oe=u.callbacks,oe===null?u.callbacks=[te]:oe.push(te))}else oe={lane:te,tag:T.tag,payload:T.payload,callback:T.callback,next:null},ce===null?(J=ce=oe,Z=fe):ce=ce.next=oe,y|=te;if(T=T.next,T===null){if(T=u.shared.pending,T===null)break;oe=T,T=oe.next,oe.next=null,u.lastBaseUpdate=oe,u.shared.pending=null}}while(!0);ce===null&&(Z=fe),u.baseState=Z,u.firstBaseUpdate=J,u.lastBaseUpdate=ce,d===null&&(u.shared.lanes=0),Tn|=y,e.lanes=y,e.memoizedState=fe}}function bh(e,t){if(typeof e!="function")throw Error(l(191,e));e.call(t)}function yh(e,t){var a=e.callbacks;if(a!==null)for(e.callbacks=null,e=0;e<a.length;e++)bh(a[e],t)}var Fr=O(null),rl=O(0);function xh(e,t){e=ln,re(rl,e),re(Fr,t),ln=e|t.baseLanes}function Tc(){re(rl,ln),re(Fr,Fr.current)}function Nc(){ln=rl.current,D(Fr),D(rl)}var aa=O(null),xa=null;function En(e){var t=e.alternate;re(St,St.current&1),re(aa,e),xa===null&&(t===null||Fr.current!==null||t.memoizedState!==null)&&(xa=e)}function Oc(e){re(St,St.current),re(aa,e),xa===null&&(xa=e)}function wh(e){e.tag===22?(re(St,St.current),re(aa,e),xa===null&&(xa=e)):zn()}function zn(){re(St,St.current),re(aa,aa.current)}function na(e){D(aa),xa===e&&(xa=null),D(St)}var St=O(0);function il(e){for(var t=e;t!==null;){if(t.tag===13){var a=t.memoizedState;if(a!==null&&(a=a.dehydrated,a===null||Uu(a)||Lu(a)))return t}else if(t.tag===19&&(t.memoizedProps.revealOrder==="forwards"||t.memoizedProps.revealOrder==="backwards"||t.memoizedProps.revealOrder==="unstable_legacy-backwards"||t.memoizedProps.revealOrder==="together")){if((t.flags&128)!==0)return t}else if(t.child!==null){t.child.return=t,t=t.child;continue}if(t===e)break;for(;t.sibling===null;){if(t.return===null||t.return===e)return null;t=t.return}t.sibling.return=t.return,t=t.sibling}return null}var Wa=0,qe=null,ct=null,zt=null,ol=!1,Kr=!1,pr=!1,ll=0,Pi=0,Pr=null,Yy=0;function xt(){throw Error(l(321))}function jc(e,t){if(t===null)return!1;for(var a=0;a<t.length&&a<e.length;a++)if(!ea(e[a],t[a]))return!1;return!0}function Rc(e,t,a,i,u,d){return Wa=d,qe=t,t.memoizedState=null,t.updateQueue=null,t.lanes=0,V.H=e===null||e.memoizedState===null?rp:Fc,pr=!1,d=a(i,u),pr=!1,Kr&&(d=Sh(t,a,i,u)),_h(e),d}function _h(e){V.H=$i;var t=ct!==null&&ct.next!==null;if(Wa=0,zt=ct=qe=null,ol=!1,Pi=0,Pr=null,t)throw Error(l(300));e===null||Ct||(e=e.dependencies,e!==null&&Jo(e)&&(Ct=!0))}function Sh(e,t,a,i){qe=e;var u=0;do{if(Kr&&(Pr=null),Pi=0,Kr=!1,25<=u)throw Error(l(301));if(u+=1,zt=ct=null,e.updateQueue!=null){var d=e.updateQueue;d.lastEffect=null,d.events=null,d.stores=null,d.memoCache!=null&&(d.memoCache.index=0)}V.H=ip,d=t(a,i)}while(Kr);return d}function Iy(){var e=V.H,t=e.useState()[0];return t=typeof t.then=="function"?Ji(t):t,e=e.useState()[0],(ct!==null?ct.memoizedState:null)!==e&&(qe.flags|=1024),t}function Mc(){var e=ll!==0;return ll=0,e}function Dc(e,t,a){t.updateQueue=e.updateQueue,t.flags&=-2053,e.lanes&=~a}function Bc(e){if(ol){for(e=e.memoizedState;e!==null;){var t=e.queue;t!==null&&(t.pending=null),e=e.next}ol=!1}Wa=0,zt=ct=qe=null,Kr=!1,Pi=ll=0,Pr=null}function Yt(){var e={memoizedState:null,baseState:null,baseQueue:null,queue:null,next:null};return zt===null?qe.memoizedState=zt=e:zt=zt.next=e,zt}function kt(){if(ct===null){var e=qe.alternate;e=e!==null?e.memoizedState:null}else e=ct.next;var t=zt===null?qe.memoizedState:zt.next;if(t!==null)zt=t,ct=e;else{if(e===null)throw qe.alternate===null?Error(l(467)):Error(l(310));ct=e,e={memoizedState:ct.memoizedState,baseState:ct.baseState,baseQueue:ct.baseQueue,queue:ct.queue,next:null},zt===null?qe.memoizedState=zt=e:zt=zt.next=e}return zt}function sl(){return{lastEffect:null,events:null,stores:null,memoCache:null}}function Ji(e){var t=Pi;return Pi+=1,Pr===null&&(Pr=[]),e=hh(Pr,e,t),t=qe,(zt===null?t.memoizedState:zt.next)===null&&(t=t.alternate,V.H=t===null||t.memoizedState===null?rp:Fc),e}function cl(e){if(e!==null&&typeof e=="object"){if(typeof e.then=="function")return Ji(e);if(e.$$typeof===N)return Ht(e)}throw Error(l(438,String(e)))}function Uc(e){var t=null,a=qe.updateQueue;if(a!==null&&(t=a.memoCache),t==null){var i=qe.alternate;i!==null&&(i=i.updateQueue,i!==null&&(i=i.memoCache,i!=null&&(t={data:i.data.map(function(u){return u.slice()}),index:0})))}if(t==null&&(t={data:[],index:0}),a===null&&(a=sl(),qe.updateQueue=a),a.memoCache=t,a=t.data[t.index],a===void 0)for(a=t.data[t.index]=Array(e),i=0;i<e;i++)a[i]=se;return t.index++,a}function $a(e,t){return typeof t=="function"?t(e):t}function ul(e){var t=kt();return Lc(t,ct,e)}function Lc(e,t,a){var i=e.queue;if(i===null)throw Error(l(311));i.lastRenderedReducer=a;var u=e.baseQueue,d=i.pending;if(d!==null){if(u!==null){var y=u.next;u.next=d.next,d.next=y}t.baseQueue=u=d,i.pending=null}if(d=e.baseState,u===null)e.memoizedState=d;else{t=u.next;var T=y=null,Z=null,J=t,ce=!1;do{var fe=J.lane&-536870913;if(fe!==J.lane?(Ke&fe)===fe:(Wa&fe)===fe){var te=J.revertLane;if(te===0)Z!==null&&(Z=Z.next={lane:0,revertLane:0,gesture:null,action:J.action,hasEagerState:J.hasEagerState,eagerState:J.eagerState,next:null}),fe===Yr&&(ce=!0);else if((Wa&te)===te){J=J.next,te===Yr&&(ce=!0);continue}else fe={lane:0,revertLane:J.revertLane,gesture:null,action:J.action,hasEagerState:J.hasEagerState,eagerState:J.eagerState,next:null},Z===null?(T=Z=fe,y=d):Z=Z.next=fe,qe.lanes|=te,Tn|=te;fe=J.action,pr&&a(d,fe),d=J.hasEagerState?J.eagerState:a(d,fe)}else te={lane:fe,revertLane:J.revertLane,gesture:J.gesture,action:J.action,hasEagerState:J.hasEagerState,eagerState:J.eagerState,next:null},Z===null?(T=Z=te,y=d):Z=Z.next=te,qe.lanes|=fe,Tn|=fe;J=J.next}while(J!==null&&J!==t);if(Z===null?y=d:Z.next=T,!ea(d,e.memoizedState)&&(Ct=!0,ce&&(a=Ir,a!==null)))throw a;e.memoizedState=d,e.baseState=y,e.baseQueue=Z,i.lastRenderedState=d}return u===null&&(i.lanes=0),[e.memoizedState,i.dispatch]}function Hc(e){var t=kt(),a=t.queue;if(a===null)throw Error(l(311));a.lastRenderedReducer=e;var i=a.dispatch,u=a.pending,d=t.memoizedState;if(u!==null){a.pending=null;var y=u=u.next;do d=e(d,y.action),y=y.next;while(y!==u);ea(d,t.memoizedState)||(Ct=!0),t.memoizedState=d,t.baseQueue===null&&(t.baseState=d),a.lastRenderedState=d}return[d,i]}function kh(e,t,a){var i=qe,u=kt(),d=Je;if(d){if(a===void 0)throw Error(l(407));a=a()}else a=t();var y=!ea((ct||u).memoizedState,a);if(y&&(u.memoizedState=a,Ct=!0),u=u.queue,qc(Ch.bind(null,i,u,e),[e]),u.getSnapshot!==t||y||zt!==null&&zt.memoizedState.tag&1){if(i.flags|=2048,Jr(9,{destroy:void 0},zh.bind(null,i,u,a,t),null),ht===null)throw Error(l(349));d||(Wa&127)!==0||Eh(i,t,a)}return a}function Eh(e,t,a){e.flags|=16384,e={getSnapshot:t,value:a},t=qe.updateQueue,t===null?(t=sl(),qe.updateQueue=t,t.stores=[e]):(a=t.stores,a===null?t.stores=[e]:a.push(e))}function zh(e,t,a,i){t.value=a,t.getSnapshot=i,Ah(t)&&Th(e)}function Ch(e,t,a){return a(function(){Ah(t)&&Th(e)})}function Ah(e){var t=e.getSnapshot;e=e.value;try{var a=t();return!ea(e,a)}catch{return!0}}function Th(e){var t=ir(e,2);t!==null&&Wt(t,e,2)}function Zc(e){var t=Yt();if(typeof e=="function"){var a=e;if(e=a(),pr){da(!0);try{a()}finally{da(!1)}}}return t.memoizedState=t.baseState=e,t.queue={pending:null,lanes:0,dispatch:null,lastRenderedReducer:$a,lastRenderedState:e},t}function Nh(e,t,a,i){return e.baseState=a,Lc(e,ct,typeof i=="function"?i:$a)}function Xy(e,t,a,i,u){if(hl(e))throw Error(l(485));if(e=t.action,e!==null){var d={payload:u,action:e,next:null,isTransition:!0,status:"pending",value:null,reason:null,listeners:[],then:function(y){d.listeners.push(y)}};V.T!==null?a(!0):d.isTransition=!1,i(d),a=t.pending,a===null?(d.next=t.pending=d,Oh(t,d)):(d.next=a.next,t.pending=a.next=d)}}function Oh(e,t){var a=t.action,i=t.payload,u=e.state;if(t.isTransition){var d=V.T,y={};V.T=y;try{var T=a(u,i),Z=V.S;Z!==null&&Z(y,T),jh(e,t,T)}catch(J){Vc(e,t,J)}finally{d!==null&&y.types!==null&&(d.types=y.types),V.T=d}}else try{d=a(u,i),jh(e,t,d)}catch(J){Vc(e,t,J)}}function jh(e,t,a){a!==null&&typeof a=="object"&&typeof a.then=="function"?a.then(function(i){Rh(e,t,i)},function(i){return Vc(e,t,i)}):Rh(e,t,a)}function Rh(e,t,a){t.status="fulfilled",t.value=a,Mh(t),e.state=a,t=e.pending,t!==null&&(a=t.next,a===t?e.pending=null:(a=a.next,t.next=a,Oh(e,a)))}function Vc(e,t,a){var i=e.pending;if(e.pending=null,i!==null){i=i.next;do t.status="rejected",t.reason=a,Mh(t),t=t.next;while(t!==i)}e.action=null}function Mh(e){e=e.listeners;for(var t=0;t<e.length;t++)(0,e[t])()}function Dh(e,t){return t}function Bh(e,t){if(Je){var a=ht.formState;if(a!==null){e:{var i=qe;if(Je){if(pt){t:{for(var u=pt,d=ya;u.nodeType!==8;){if(!d){u=null;break t}if(u=wa(u.nextSibling),u===null){u=null;break t}}d=u.data,u=d==="F!"||d==="F"?u:null}if(u){pt=wa(u.nextSibling),i=u.data==="F!";break e}}xn(i)}i=!1}i&&(t=a[0])}}return a=Yt(),a.memoizedState=a.baseState=t,i={pending:null,lanes:0,dispatch:null,lastRenderedReducer:Dh,lastRenderedState:t},a.queue=i,a=tp.bind(null,qe,i),i.dispatch=a,i=Zc(!1),d=Qc.bind(null,qe,!1,i.queue),i=Yt(),u={state:t,dispatch:null,action:e,pending:null},i.queue=u,a=Xy.bind(null,qe,u,d,a),u.dispatch=a,i.memoizedState=e,[t,a,!1]}function Uh(e){var t=kt();return Lh(t,ct,e)}function Lh(e,t,a){if(t=Lc(e,t,Dh)[0],e=ul($a)[0],typeof t=="object"&&t!==null&&typeof t.then=="function")try{var i=Ji(t)}catch(y){throw y===Xr?el:y}else i=t;t=kt();var u=t.queue,d=u.dispatch;return a!==t.memoizedState&&(qe.flags|=2048,Jr(9,{destroy:void 0},Qy.bind(null,u,a),null)),[i,d,e]}function Qy(e,t){e.action=t}function Hh(e){var t=kt(),a=ct;if(a!==null)return Lh(t,a,e);kt(),t=t.memoizedState,a=kt();var i=a.queue.dispatch;return a.memoizedState=e,[t,i,!1]}function Jr(e,t,a,i){return e={tag:e,create:a,deps:i,inst:t,next:null},t=qe.updateQueue,t===null&&(t=sl(),qe.updateQueue=t),a=t.lastEffect,a===null?t.lastEffect=e.next=e:(i=a.next,a.next=e,e.next=i,t.lastEffect=e),e}function Zh(){return kt().memoizedState}function dl(e,t,a,i){var u=Yt();qe.flags|=e,u.memoizedState=Jr(1|t,{destroy:void 0},a,i===void 0?null:i)}function fl(e,t,a,i){var u=kt();i=i===void 0?null:i;var d=u.memoizedState.inst;ct!==null&&i!==null&&jc(i,ct.memoizedState.deps)?u.memoizedState=Jr(t,d,a,i):(qe.flags|=e,u.memoizedState=Jr(1|t,d,a,i))}function Vh(e,t){dl(8390656,8,e,t)}function qc(e,t){fl(2048,8,e,t)}function Fy(e){qe.flags|=4;var t=qe.updateQueue;if(t===null)t=sl(),qe.updateQueue=t,t.events=[e];else{var a=t.events;a===null?t.events=[e]:a.push(e)}}function qh(e){var t=kt().memoizedState;return Fy({ref:t,nextImpl:e}),function(){if((at&2)!==0)throw Error(l(440));return t.impl.apply(void 0,arguments)}}function Gh(e,t){return fl(4,2,e,t)}function Yh(e,t){return fl(4,4,e,t)}function Ih(e,t){if(typeof t=="function"){e=e();var a=t(e);return function(){typeof a=="function"?a():t(null)}}if(t!=null)return e=e(),t.current=e,function(){t.current=null}}function Xh(e,t,a){a=a!=null?a.concat([e]):null,fl(4,4,Ih.bind(null,t,e),a)}function Gc(){}function Qh(e,t){var a=kt();t=t===void 0?null:t;var i=a.memoizedState;return t!==null&&jc(t,i[1])?i[0]:(a.memoizedState=[e,t],e)}function Fh(e,t){var a=kt();t=t===void 0?null:t;var i=a.memoizedState;if(t!==null&&jc(t,i[1]))return i[0];if(i=e(),pr){da(!0);try{e()}finally{da(!1)}}return a.memoizedState=[i,t],i}function Yc(e,t,a){return a===void 0||(Wa&1073741824)!==0&&(Ke&261930)===0?e.memoizedState=t:(e.memoizedState=a,e=Kp(),qe.lanes|=e,Tn|=e,a)}function Kh(e,t,a,i){return ea(a,t)?a:Fr.current!==null?(e=Yc(e,a,i),ea(e,t)||(Ct=!0),e):(Wa&42)===0||(Wa&1073741824)!==0&&(Ke&261930)===0?(Ct=!0,e.memoizedState=a):(e=Kp(),qe.lanes|=e,Tn|=e,t)}function Ph(e,t,a,i,u){var d=q.p;q.p=d!==0&&8>d?d:8;var y=V.T,T={};V.T=T,Qc(e,!1,t,a);try{var Z=u(),J=V.S;if(J!==null&&J(T,Z),Z!==null&&typeof Z=="object"&&typeof Z.then=="function"){var ce=Gy(Z,i);Wi(e,t,ce,oa(e))}else Wi(e,t,i,oa(e))}catch(fe){Wi(e,t,{then:function(){},status:"rejected",reason:fe},oa())}finally{q.p=d,y!==null&&T.types!==null&&(y.types=T.types),V.T=y}}function Ky(){}function Ic(e,t,a,i){if(e.tag!==5)throw Error(l(476));var u=Jh(e).queue;Ph(e,u,t,Q,a===null?Ky:function(){return Wh(e),a(i)})}function Jh(e){var t=e.memoizedState;if(t!==null)return t;t={memoizedState:Q,baseState:Q,baseQueue:null,queue:{pending:null,lanes:0,dispatch:null,lastRenderedReducer:$a,lastRenderedState:Q},next:null};var a={};return t.next={memoizedState:a,baseState:a,baseQueue:null,queue:{pending:null,lanes:0,dispatch:null,lastRenderedReducer:$a,lastRenderedState:a},next:null},e.memoizedState=t,e=e.alternate,e!==null&&(e.memoizedState=t),t}function Wh(e){var t=Jh(e);t.next===null&&(t=e.alternate.memoizedState),Wi(e,t.next.queue,{},oa())}function Xc(){return Ht(go)}function $h(){return kt().memoizedState}function ep(){return kt().memoizedState}function Py(e){for(var t=e.return;t!==null;){switch(t.tag){case 24:case 3:var a=oa();e=Sn(a);var i=kn(t,e,a);i!==null&&(Wt(i,t,a),Qi(i,t,a)),t={cache:wc()},e.payload=t;return}t=t.return}}function Jy(e,t,a){var i=oa();a={lane:i,revertLane:0,gesture:null,action:a,hasEagerState:!1,eagerState:null,next:null},hl(e)?ap(t,a):(a=uc(e,t,a,i),a!==null&&(Wt(a,e,i),np(a,t,i)))}function tp(e,t,a){var i=oa();Wi(e,t,a,i)}function Wi(e,t,a,i){var u={lane:i,revertLane:0,gesture:null,action:a,hasEagerState:!1,eagerState:null,next:null};if(hl(e))ap(t,u);else{var d=e.alternate;if(e.lanes===0&&(d===null||d.lanes===0)&&(d=t.lastRenderedReducer,d!==null))try{var y=t.lastRenderedState,T=d(y,a);if(u.hasEagerState=!0,u.eagerState=T,ea(T,y))return Qo(e,t,u,0),ht===null&&Xo(),!1}catch{}finally{}if(a=uc(e,t,u,i),a!==null)return Wt(a,e,i),np(a,t,i),!0}return!1}function Qc(e,t,a,i){if(i={lane:2,revertLane:Eu(),gesture:null,action:i,hasEagerState:!1,eagerState:null,next:null},hl(e)){if(t)throw Error(l(479))}else t=uc(e,a,i,2),t!==null&&Wt(t,e,2)}function hl(e){var t=e.alternate;return e===qe||t!==null&&t===qe}function ap(e,t){Kr=ol=!0;var a=e.pending;a===null?t.next=t:(t.next=a.next,a.next=t),e.pending=t}function np(e,t,a){if((a&4194048)!==0){var i=t.lanes;i&=e.pendingLanes,a|=i,t.lanes=a,sf(e,a)}}var $i={readContext:Ht,use:cl,useCallback:xt,useContext:xt,useEffect:xt,useImperativeHandle:xt,useLayoutEffect:xt,useInsertionEffect:xt,useMemo:xt,useReducer:xt,useRef:xt,useState:xt,useDebugValue:xt,useDeferredValue:xt,useTransition:xt,useSyncExternalStore:xt,useId:xt,useHostTransitionStatus:xt,useFormState:xt,useActionState:xt,useOptimistic:xt,useMemoCache:xt,useCacheRefresh:xt};$i.useEffectEvent=xt;var rp={readContext:Ht,use:cl,useCallback:function(e,t){return Yt().memoizedState=[e,t===void 0?null:t],e},useContext:Ht,useEffect:Vh,useImperativeHandle:function(e,t,a){a=a!=null?a.concat([e]):null,dl(4194308,4,Ih.bind(null,t,e),a)},useLayoutEffect:function(e,t){return dl(4194308,4,e,t)},useInsertionEffect:function(e,t){dl(4,2,e,t)},useMemo:function(e,t){var a=Yt();t=t===void 0?null:t;var i=e();if(pr){da(!0);try{e()}finally{da(!1)}}return a.memoizedState=[i,t],i},useReducer:function(e,t,a){var i=Yt();if(a!==void 0){var u=a(t);if(pr){da(!0);try{a(t)}finally{da(!1)}}}else u=t;return i.memoizedState=i.baseState=u,e={pending:null,lanes:0,dispatch:null,lastRenderedReducer:e,lastRenderedState:u},i.queue=e,e=e.dispatch=Jy.bind(null,qe,e),[i.memoizedState,e]},useRef:function(e){var t=Yt();return e={current:e},t.memoizedState=e},useState:function(e){e=Zc(e);var t=e.queue,a=tp.bind(null,qe,t);return t.dispatch=a,[e.memoizedState,a]},useDebugValue:Gc,useDeferredValue:function(e,t){var a=Yt();return Yc(a,e,t)},useTransition:function(){var e=Zc(!1);return e=Ph.bind(null,qe,e.queue,!0,!1),Yt().memoizedState=e,[!1,e]},useSyncExternalStore:function(e,t,a){var i=qe,u=Yt();if(Je){if(a===void 0)throw Error(l(407));a=a()}else{if(a=t(),ht===null)throw Error(l(349));(Ke&127)!==0||Eh(i,t,a)}u.memoizedState=a;var d={value:a,getSnapshot:t};return u.queue=d,Vh(Ch.bind(null,i,d,e),[e]),i.flags|=2048,Jr(9,{destroy:void 0},zh.bind(null,i,d,a,t),null),a},useId:function(){var e=Yt(),t=ht.identifierPrefix;if(Je){var a=Ba,i=Da;a=(i&~(1<<32-bt(i)-1)).toString(32)+a,t="_"+t+"R_"+a,a=ll++,0<a&&(t+="H"+a.toString(32)),t+="_"}else a=Yy++,t="_"+t+"r_"+a.toString(32)+"_";return e.memoizedState=t},useHostTransitionStatus:Xc,useFormState:Bh,useActionState:Bh,useOptimistic:function(e){var t=Yt();t.memoizedState=t.baseState=e;var a={pending:null,lanes:0,dispatch:null,lastRenderedReducer:null,lastRenderedState:null};return t.queue=a,t=Qc.bind(null,qe,!0,a),a.dispatch=t,[e,t]},useMemoCache:Uc,useCacheRefresh:function(){return Yt().memoizedState=Py.bind(null,qe)},useEffectEvent:function(e){var t=Yt(),a={impl:e};return t.memoizedState=a,function(){if((at&2)!==0)throw Error(l(440));return a.impl.apply(void 0,arguments)}}},Fc={readContext:Ht,use:cl,useCallback:Qh,useContext:Ht,useEffect:qc,useImperativeHandle:Xh,useInsertionEffect:Gh,useLayoutEffect:Yh,useMemo:Fh,useReducer:ul,useRef:Zh,useState:function(){return ul($a)},useDebugValue:Gc,useDeferredValue:function(e,t){var a=kt();return Kh(a,ct.memoizedState,e,t)},useTransition:function(){var e=ul($a)[0],t=kt().memoizedState;return[typeof e=="boolean"?e:Ji(e),t]},useSyncExternalStore:kh,useId:$h,useHostTransitionStatus:Xc,useFormState:Uh,useActionState:Uh,useOptimistic:function(e,t){var a=kt();return Nh(a,ct,e,t)},useMemoCache:Uc,useCacheRefresh:ep};Fc.useEffectEvent=qh;var ip={readContext:Ht,use:cl,useCallback:Qh,useContext:Ht,useEffect:qc,useImperativeHandle:Xh,useInsertionEffect:Gh,useLayoutEffect:Yh,useMemo:Fh,useReducer:Hc,useRef:Zh,useState:function(){return Hc($a)},useDebugValue:Gc,useDeferredValue:function(e,t){var a=kt();return ct===null?Yc(a,e,t):Kh(a,ct.memoizedState,e,t)},useTransition:function(){var e=Hc($a)[0],t=kt().memoizedState;return[typeof e=="boolean"?e:Ji(e),t]},useSyncExternalStore:kh,useId:$h,useHostTransitionStatus:Xc,useFormState:Hh,useActionState:Hh,useOptimistic:function(e,t){var a=kt();return ct!==null?Nh(a,ct,e,t):(a.baseState=e,[e,a.queue.dispatch])},useMemoCache:Uc,useCacheRefresh:ep};ip.useEffectEvent=qh;function Kc(e,t,a,i){t=e.memoizedState,a=a(i,t),a=a==null?t:b({},t,a),e.memoizedState=a,e.lanes===0&&(e.updateQueue.baseState=a)}var Pc={enqueueSetState:function(e,t,a){e=e._reactInternals;var i=oa(),u=Sn(i);u.payload=t,a!=null&&(u.callback=a),t=kn(e,u,i),t!==null&&(Wt(t,e,i),Qi(t,e,i))},enqueueReplaceState:function(e,t,a){e=e._reactInternals;var i=oa(),u=Sn(i);u.tag=1,u.payload=t,a!=null&&(u.callback=a),t=kn(e,u,i),t!==null&&(Wt(t,e,i),Qi(t,e,i))},enqueueForceUpdate:function(e,t){e=e._reactInternals;var a=oa(),i=Sn(a);i.tag=2,t!=null&&(i.callback=t),t=kn(e,i,a),t!==null&&(Wt(t,e,a),Qi(t,e,a))}};function op(e,t,a,i,u,d,y){return e=e.stateNode,typeof e.shouldComponentUpdate=="function"?e.shouldComponentUpdate(i,d,y):t.prototype&&t.prototype.isPureReactComponent?!Hi(a,i)||!Hi(u,d):!0}function lp(e,t,a,i){e=t.state,typeof t.componentWillReceiveProps=="function"&&t.componentWillReceiveProps(a,i),typeof t.UNSAFE_componentWillReceiveProps=="function"&&t.UNSAFE_componentWillReceiveProps(a,i),t.state!==e&&Pc.enqueueReplaceState(t,t.state,null)}function mr(e,t){var a=t;if("ref"in t){a={};for(var i in t)i!=="ref"&&(a[i]=t[i])}if(e=e.defaultProps){a===t&&(a=b({},a));for(var u in e)a[u]===void 0&&(a[u]=e[u])}return a}function sp(e){Io(e)}function cp(e){console.error(e)}function up(e){Io(e)}function pl(e,t){try{var a=e.onUncaughtError;a(t.value,{componentStack:t.stack})}catch(i){setTimeout(function(){throw i})}}function dp(e,t,a){try{var i=e.onCaughtError;i(a.value,{componentStack:a.stack,errorBoundary:t.tag===1?t.stateNode:null})}catch(u){setTimeout(function(){throw u})}}function Jc(e,t,a){return a=Sn(a),a.tag=3,a.payload={element:null},a.callback=function(){pl(e,t)},a}function fp(e){return e=Sn(e),e.tag=3,e}function hp(e,t,a,i){var u=a.type.getDerivedStateFromError;if(typeof u=="function"){var d=i.value;e.payload=function(){return u(d)},e.callback=function(){dp(t,a,i)}}var y=a.stateNode;y!==null&&typeof y.componentDidCatch=="function"&&(e.callback=function(){dp(t,a,i),typeof u!="function"&&(Nn===null?Nn=new Set([this]):Nn.add(this));var T=i.stack;this.componentDidCatch(i.value,{componentStack:T!==null?T:""})})}function Wy(e,t,a,i,u){if(a.flags|=32768,i!==null&&typeof i=="object"&&typeof i.then=="function"){if(t=a.alternate,t!==null&&Gr(t,a,u,!0),a=aa.current,a!==null){switch(a.tag){case 31:case 13:return xa===null?zl():a.alternate===null&&wt===0&&(wt=3),a.flags&=-257,a.flags|=65536,a.lanes=u,i===tl?a.flags|=16384:(t=a.updateQueue,t===null?a.updateQueue=new Set([i]):t.add(i),_u(e,i,u)),!1;case 22:return a.flags|=65536,i===tl?a.flags|=16384:(t=a.updateQueue,t===null?(t={transitions:null,markerInstances:null,retryQueue:new Set([i])},a.updateQueue=t):(a=t.retryQueue,a===null?t.retryQueue=new Set([i]):a.add(i)),_u(e,i,u)),!1}throw Error(l(435,a.tag))}return _u(e,i,u),zl(),!1}if(Je)return t=aa.current,t!==null?((t.flags&65536)===0&&(t.flags|=256),t.flags|=65536,t.lanes=u,i!==gc&&(e=Error(l(422),{cause:i}),qi(ga(e,a)))):(i!==gc&&(t=Error(l(423),{cause:i}),qi(ga(t,a))),e=e.current.alternate,e.flags|=65536,u&=-u,e.lanes|=u,i=ga(i,a),u=Jc(e.stateNode,i,u),Cc(e,u),wt!==4&&(wt=2)),!1;var d=Error(l(520),{cause:i});if(d=ga(d,a),lo===null?lo=[d]:lo.push(d),wt!==4&&(wt=2),t===null)return!0;i=ga(i,a),a=t;do{switch(a.tag){case 3:return a.flags|=65536,e=u&-u,a.lanes|=e,e=Jc(a.stateNode,i,e),Cc(a,e),!1;case 1:if(t=a.type,d=a.stateNode,(a.flags&128)===0&&(typeof t.getDerivedStateFromError=="function"||d!==null&&typeof d.componentDidCatch=="function"&&(Nn===null||!Nn.has(d))))return a.flags|=65536,u&=-u,a.lanes|=u,u=fp(u),hp(u,e,a,i),Cc(a,u),!1}a=a.return}while(a!==null);return!1}var Wc=Error(l(461)),Ct=!1;function Zt(e,t,a,i){t.child=e===null?vh(t,null,a,i):hr(t,e.child,a,i)}function pp(e,t,a,i,u){a=a.render;var d=t.ref;if("ref"in i){var y={};for(var T in i)T!=="ref"&&(y[T]=i[T])}else y=i;return cr(t),i=Rc(e,t,a,y,d,u),T=Mc(),e!==null&&!Ct?(Dc(e,t,u),en(e,t,u)):(Je&&T&&pc(t),t.flags|=1,Zt(e,t,i,u),t.child)}function mp(e,t,a,i,u){if(e===null){var d=a.type;return typeof d=="function"&&!dc(d)&&d.defaultProps===void 0&&a.compare===null?(t.tag=15,t.type=d,gp(e,t,d,i,u)):(e=Ko(a.type,null,i,t,t.mode,u),e.ref=t.ref,e.return=t,t.child=e)}if(d=e.child,!ou(e,u)){var y=d.memoizedProps;if(a=a.compare,a=a!==null?a:Hi,a(y,i)&&e.ref===t.ref)return en(e,t,u)}return t.flags|=1,e=Fa(d,i),e.ref=t.ref,e.return=t,t.child=e}function gp(e,t,a,i,u){if(e!==null){var d=e.memoizedProps;if(Hi(d,i)&&e.ref===t.ref)if(Ct=!1,t.pendingProps=i=d,ou(e,u))(e.flags&131072)!==0&&(Ct=!0);else return t.lanes=e.lanes,en(e,t,u)}return $c(e,t,a,i,u)}function vp(e,t,a,i){var u=i.children,d=e!==null?e.memoizedState:null;if(e===null&&t.stateNode===null&&(t.stateNode={_visibility:1,_pendingMarkers:null,_retryCache:null,_transitions:null}),i.mode==="hidden"){if((t.flags&128)!==0){if(d=d!==null?d.baseLanes|a:a,e!==null){for(i=t.child=e.child,u=0;i!==null;)u=u|i.lanes|i.childLanes,i=i.sibling;i=u&~d}else i=0,t.child=null;return bp(e,t,d,a,i)}if((a&536870912)!==0)t.memoizedState={baseLanes:0,cachePool:null},e!==null&&$o(t,d!==null?d.cachePool:null),d!==null?xh(t,d):Tc(),wh(t);else return i=t.lanes=536870912,bp(e,t,d!==null?d.baseLanes|a:a,a,i)}else d!==null?($o(t,d.cachePool),xh(t,d),zn(),t.memoizedState=null):(e!==null&&$o(t,null),Tc(),zn());return Zt(e,t,u,a),t.child}function eo(e,t){return e!==null&&e.tag===22||t.stateNode!==null||(t.stateNode={_visibility:1,_pendingMarkers:null,_retryCache:null,_transitions:null}),t.sibling}function bp(e,t,a,i,u){var d=Sc();return d=d===null?null:{parent:Et._currentValue,pool:d},t.memoizedState={baseLanes:a,cachePool:d},e!==null&&$o(t,null),Tc(),wh(t),e!==null&&Gr(e,t,i,!0),t.childLanes=u,null}function ml(e,t){return t=vl({mode:t.mode,children:t.children},e.mode),t.ref=e.ref,e.child=t,t.return=e,t}function yp(e,t,a){return hr(t,e.child,null,a),e=ml(t,t.pendingProps),e.flags|=2,na(t),t.memoizedState=null,e}function $y(e,t,a){var i=t.pendingProps,u=(t.flags&128)!==0;if(t.flags&=-129,e===null){if(Je){if(i.mode==="hidden")return e=ml(t,i),t.lanes=536870912,eo(null,e);if(Oc(t),(e=pt)?(e=Om(e,ya),e=e!==null&&e.data==="&"?e:null,e!==null&&(t.memoizedState={dehydrated:e,treeContext:bn!==null?{id:Da,overflow:Ba}:null,retryLane:536870912,hydrationErrors:null},a=ah(e),a.return=t,t.child=a,Lt=t,pt=null)):e=null,e===null)throw xn(t);return t.lanes=536870912,null}return ml(t,i)}var d=e.memoizedState;if(d!==null){var y=d.dehydrated;if(Oc(t),u)if(t.flags&256)t.flags&=-257,t=yp(e,t,a);else if(t.memoizedState!==null)t.child=e.child,t.flags|=128,t=null;else throw Error(l(558));else if(Ct||Gr(e,t,a,!1),u=(a&e.childLanes)!==0,Ct||u){if(i=ht,i!==null&&(y=cf(i,a),y!==0&&y!==d.retryLane))throw d.retryLane=y,ir(e,y),Wt(i,e,y),Wc;zl(),t=yp(e,t,a)}else e=d.treeContext,pt=wa(y.nextSibling),Lt=t,Je=!0,yn=null,ya=!1,e!==null&&ih(t,e),t=ml(t,i),t.flags|=4096;return t}return e=Fa(e.child,{mode:i.mode,children:i.children}),e.ref=t.ref,t.child=e,e.return=t,e}function gl(e,t){var a=t.ref;if(a===null)e!==null&&e.ref!==null&&(t.flags|=4194816);else{if(typeof a!="function"&&typeof a!="object")throw Error(l(284));(e===null||e.ref!==a)&&(t.flags|=4194816)}}function $c(e,t,a,i,u){return cr(t),a=Rc(e,t,a,i,void 0,u),i=Mc(),e!==null&&!Ct?(Dc(e,t,u),en(e,t,u)):(Je&&i&&pc(t),t.flags|=1,Zt(e,t,a,u),t.child)}function xp(e,t,a,i,u,d){return cr(t),t.updateQueue=null,a=Sh(t,i,a,u),_h(e),i=Mc(),e!==null&&!Ct?(Dc(e,t,d),en(e,t,d)):(Je&&i&&pc(t),t.flags|=1,Zt(e,t,a,d),t.child)}function wp(e,t,a,i,u){if(cr(t),t.stateNode===null){var d=Hr,y=a.contextType;typeof y=="object"&&y!==null&&(d=Ht(y)),d=new a(i,d),t.memoizedState=d.state!==null&&d.state!==void 0?d.state:null,d.updater=Pc,t.stateNode=d,d._reactInternals=t,d=t.stateNode,d.props=i,d.state=t.memoizedState,d.refs={},Ec(t),y=a.contextType,d.context=typeof y=="object"&&y!==null?Ht(y):Hr,d.state=t.memoizedState,y=a.getDerivedStateFromProps,typeof y=="function"&&(Kc(t,a,y,i),d.state=t.memoizedState),typeof a.getDerivedStateFromProps=="function"||typeof d.getSnapshotBeforeUpdate=="function"||typeof d.UNSAFE_componentWillMount!="function"&&typeof d.componentWillMount!="function"||(y=d.state,typeof d.componentWillMount=="function"&&d.componentWillMount(),typeof d.UNSAFE_componentWillMount=="function"&&d.UNSAFE_componentWillMount(),y!==d.state&&Pc.enqueueReplaceState(d,d.state,null),Ki(t,i,d,u),Fi(),d.state=t.memoizedState),typeof d.componentDidMount=="function"&&(t.flags|=4194308),i=!0}else if(e===null){d=t.stateNode;var T=t.memoizedProps,Z=mr(a,T);d.props=Z;var J=d.context,ce=a.contextType;y=Hr,typeof ce=="object"&&ce!==null&&(y=Ht(ce));var fe=a.getDerivedStateFromProps;ce=typeof fe=="function"||typeof d.getSnapshotBeforeUpdate=="function",T=t.pendingProps!==T,ce||typeof d.UNSAFE_componentWillReceiveProps!="function"&&typeof d.componentWillReceiveProps!="function"||(T||J!==y)&&lp(t,d,i,y),_n=!1;var te=t.memoizedState;d.state=te,Ki(t,i,d,u),Fi(),J=t.memoizedState,T||te!==J||_n?(typeof fe=="function"&&(Kc(t,a,fe,i),J=t.memoizedState),(Z=_n||op(t,a,Z,i,te,J,y))?(ce||typeof d.UNSAFE_componentWillMount!="function"&&typeof d.componentWillMount!="function"||(typeof d.componentWillMount=="function"&&d.componentWillMount(),typeof d.UNSAFE_componentWillMount=="function"&&d.UNSAFE_componentWillMount()),typeof d.componentDidMount=="function"&&(t.flags|=4194308)):(typeof d.componentDidMount=="function"&&(t.flags|=4194308),t.memoizedProps=i,t.memoizedState=J),d.props=i,d.state=J,d.context=y,i=Z):(typeof d.componentDidMount=="function"&&(t.flags|=4194308),i=!1)}else{d=t.stateNode,zc(e,t),y=t.memoizedProps,ce=mr(a,y),d.props=ce,fe=t.pendingProps,te=d.context,J=a.contextType,Z=Hr,typeof J=="object"&&J!==null&&(Z=Ht(J)),T=a.getDerivedStateFromProps,(J=typeof T=="function"||typeof d.getSnapshotBeforeUpdate=="function")||typeof d.UNSAFE_componentWillReceiveProps!="function"&&typeof d.componentWillReceiveProps!="function"||(y!==fe||te!==Z)&&lp(t,d,i,Z),_n=!1,te=t.memoizedState,d.state=te,Ki(t,i,d,u),Fi();var oe=t.memoizedState;y!==fe||te!==oe||_n||e!==null&&e.dependencies!==null&&Jo(e.dependencies)?(typeof T=="function"&&(Kc(t,a,T,i),oe=t.memoizedState),(ce=_n||op(t,a,ce,i,te,oe,Z)||e!==null&&e.dependencies!==null&&Jo(e.dependencies))?(J||typeof d.UNSAFE_componentWillUpdate!="function"&&typeof d.componentWillUpdate!="function"||(typeof d.componentWillUpdate=="function"&&d.componentWillUpdate(i,oe,Z),typeof d.UNSAFE_componentWillUpdate=="function"&&d.UNSAFE_componentWillUpdate(i,oe,Z)),typeof d.componentDidUpdate=="function"&&(t.flags|=4),typeof d.getSnapshotBeforeUpdate=="function"&&(t.flags|=1024)):(typeof d.componentDidUpdate!="function"||y===e.memoizedProps&&te===e.memoizedState||(t.flags|=4),typeof d.getSnapshotBeforeUpdate!="function"||y===e.memoizedProps&&te===e.memoizedState||(t.flags|=1024),t.memoizedProps=i,t.memoizedState=oe),d.props=i,d.state=oe,d.context=Z,i=ce):(typeof d.componentDidUpdate!="function"||y===e.memoizedProps&&te===e.memoizedState||(t.flags|=4),typeof d.getSnapshotBeforeUpdate!="function"||y===e.memoizedProps&&te===e.memoizedState||(t.flags|=1024),i=!1)}return d=i,gl(e,t),i=(t.flags&128)!==0,d||i?(d=t.stateNode,a=i&&typeof a.getDerivedStateFromError!="function"?null:d.render(),t.flags|=1,e!==null&&i?(t.child=hr(t,e.child,null,u),t.child=hr(t,null,a,u)):Zt(e,t,a,u),t.memoizedState=d.state,e=t.child):e=en(e,t,u),e}function _p(e,t,a,i){return lr(),t.flags|=256,Zt(e,t,a,i),t.child}var eu={dehydrated:null,treeContext:null,retryLane:0,hydrationErrors:null};function tu(e){return{baseLanes:e,cachePool:dh()}}function au(e,t,a){return e=e!==null?e.childLanes&~a:0,t&&(e|=ia),e}function Sp(e,t,a){var i=t.pendingProps,u=!1,d=(t.flags&128)!==0,y;if((y=d)||(y=e!==null&&e.memoizedState===null?!1:(St.current&2)!==0),y&&(u=!0,t.flags&=-129),y=(t.flags&32)!==0,t.flags&=-33,e===null){if(Je){if(u?En(t):zn(),(e=pt)?(e=Om(e,ya),e=e!==null&&e.data!=="&"?e:null,e!==null&&(t.memoizedState={dehydrated:e,treeContext:bn!==null?{id:Da,overflow:Ba}:null,retryLane:536870912,hydrationErrors:null},a=ah(e),a.return=t,t.child=a,Lt=t,pt=null)):e=null,e===null)throw xn(t);return Lu(e)?t.lanes=32:t.lanes=536870912,null}var T=i.children;return i=i.fallback,u?(zn(),u=t.mode,T=vl({mode:"hidden",children:T},u),i=or(i,u,a,null),T.return=t,i.return=t,T.sibling=i,t.child=T,i=t.child,i.memoizedState=tu(a),i.childLanes=au(e,y,a),t.memoizedState=eu,eo(null,i)):(En(t),nu(t,T))}var Z=e.memoizedState;if(Z!==null&&(T=Z.dehydrated,T!==null)){if(d)t.flags&256?(En(t),t.flags&=-257,t=ru(e,t,a)):t.memoizedState!==null?(zn(),t.child=e.child,t.flags|=128,t=null):(zn(),T=i.fallback,u=t.mode,i=vl({mode:"visible",children:i.children},u),T=or(T,u,a,null),T.flags|=2,i.return=t,T.return=t,i.sibling=T,t.child=i,hr(t,e.child,null,a),i=t.child,i.memoizedState=tu(a),i.childLanes=au(e,y,a),t.memoizedState=eu,t=eo(null,i));else if(En(t),Lu(T)){if(y=T.nextSibling&&T.nextSibling.dataset,y)var J=y.dgst;y=J,i=Error(l(419)),i.stack="",i.digest=y,qi({value:i,source:null,stack:null}),t=ru(e,t,a)}else if(Ct||Gr(e,t,a,!1),y=(a&e.childLanes)!==0,Ct||y){if(y=ht,y!==null&&(i=cf(y,a),i!==0&&i!==Z.retryLane))throw Z.retryLane=i,ir(e,i),Wt(y,e,i),Wc;Uu(T)||zl(),t=ru(e,t,a)}else Uu(T)?(t.flags|=192,t.child=e.child,t=null):(e=Z.treeContext,pt=wa(T.nextSibling),Lt=t,Je=!0,yn=null,ya=!1,e!==null&&ih(t,e),t=nu(t,i.children),t.flags|=4096);return t}return u?(zn(),T=i.fallback,u=t.mode,Z=e.child,J=Z.sibling,i=Fa(Z,{mode:"hidden",children:i.children}),i.subtreeFlags=Z.subtreeFlags&65011712,J!==null?T=Fa(J,T):(T=or(T,u,a,null),T.flags|=2),T.return=t,i.return=t,i.sibling=T,t.child=i,eo(null,i),i=t.child,T=e.child.memoizedState,T===null?T=tu(a):(u=T.cachePool,u!==null?(Z=Et._currentValue,u=u.parent!==Z?{parent:Z,pool:Z}:u):u=dh(),T={baseLanes:T.baseLanes|a,cachePool:u}),i.memoizedState=T,i.childLanes=au(e,y,a),t.memoizedState=eu,eo(e.child,i)):(En(t),a=e.child,e=a.sibling,a=Fa(a,{mode:"visible",children:i.children}),a.return=t,a.sibling=null,e!==null&&(y=t.deletions,y===null?(t.deletions=[e],t.flags|=16):y.push(e)),t.child=a,t.memoizedState=null,a)}function nu(e,t){return t=vl({mode:"visible",children:t},e.mode),t.return=e,e.child=t}function vl(e,t){return e=ta(22,e,null,t),e.lanes=0,e}function ru(e,t,a){return hr(t,e.child,null,a),e=nu(t,t.pendingProps.children),e.flags|=2,t.memoizedState=null,e}function kp(e,t,a){e.lanes|=t;var i=e.alternate;i!==null&&(i.lanes|=t),yc(e.return,t,a)}function iu(e,t,a,i,u,d){var y=e.memoizedState;y===null?e.memoizedState={isBackwards:t,rendering:null,renderingStartTime:0,last:i,tail:a,tailMode:u,treeForkCount:d}:(y.isBackwards=t,y.rendering=null,y.renderingStartTime=0,y.last=i,y.tail=a,y.tailMode=u,y.treeForkCount=d)}function Ep(e,t,a){var i=t.pendingProps,u=i.revealOrder,d=i.tail;i=i.children;var y=St.current,T=(y&2)!==0;if(T?(y=y&1|2,t.flags|=128):y&=1,re(St,y),Zt(e,t,i,a),i=Je?Vi:0,!T&&e!==null&&(e.flags&128)!==0)e:for(e=t.child;e!==null;){if(e.tag===13)e.memoizedState!==null&&kp(e,a,t);else if(e.tag===19)kp(e,a,t);else if(e.child!==null){e.child.return=e,e=e.child;continue}if(e===t)break e;for(;e.sibling===null;){if(e.return===null||e.return===t)break e;e=e.return}e.sibling.return=e.return,e=e.sibling}switch(u){case"forwards":for(a=t.child,u=null;a!==null;)e=a.alternate,e!==null&&il(e)===null&&(u=a),a=a.sibling;a=u,a===null?(u=t.child,t.child=null):(u=a.sibling,a.sibling=null),iu(t,!1,u,a,d,i);break;case"backwards":case"unstable_legacy-backwards":for(a=null,u=t.child,t.child=null;u!==null;){if(e=u.alternate,e!==null&&il(e)===null){t.child=u;break}e=u.sibling,u.sibling=a,a=u,u=e}iu(t,!0,a,null,d,i);break;case"together":iu(t,!1,null,null,void 0,i);break;default:t.memoizedState=null}return t.child}function en(e,t,a){if(e!==null&&(t.dependencies=e.dependencies),Tn|=t.lanes,(a&t.childLanes)===0)if(e!==null){if(Gr(e,t,a,!1),(a&t.childLanes)===0)return null}else return null;if(e!==null&&t.child!==e.child)throw Error(l(153));if(t.child!==null){for(e=t.child,a=Fa(e,e.pendingProps),t.child=a,a.return=t;e.sibling!==null;)e=e.sibling,a=a.sibling=Fa(e,e.pendingProps),a.return=t;a.sibling=null}return t.child}function ou(e,t){return(e.lanes&t)!==0?!0:(e=e.dependencies,!!(e!==null&&Jo(e)))}function ex(e,t,a){switch(t.tag){case 3:Se(t,t.stateNode.containerInfo),wn(t,Et,e.memoizedState.cache),lr();break;case 27:case 5:Me(t);break;case 4:Se(t,t.stateNode.containerInfo);break;case 10:wn(t,t.type,t.memoizedProps.value);break;case 31:if(t.memoizedState!==null)return t.flags|=128,Oc(t),null;break;case 13:var i=t.memoizedState;if(i!==null)return i.dehydrated!==null?(En(t),t.flags|=128,null):(a&t.child.childLanes)!==0?Sp(e,t,a):(En(t),e=en(e,t,a),e!==null?e.sibling:null);En(t);break;case 19:var u=(e.flags&128)!==0;if(i=(a&t.childLanes)!==0,i||(Gr(e,t,a,!1),i=(a&t.childLanes)!==0),u){if(i)return Ep(e,t,a);t.flags|=128}if(u=t.memoizedState,u!==null&&(u.rendering=null,u.tail=null,u.lastEffect=null),re(St,St.current),i)break;return null;case 22:return t.lanes=0,vp(e,t,a,t.pendingProps);case 24:wn(t,Et,e.memoizedState.cache)}return en(e,t,a)}function zp(e,t,a){if(e!==null)if(e.memoizedProps!==t.pendingProps)Ct=!0;else{if(!ou(e,a)&&(t.flags&128)===0)return Ct=!1,ex(e,t,a);Ct=(e.flags&131072)!==0}else Ct=!1,Je&&(t.flags&1048576)!==0&&rh(t,Vi,t.index);switch(t.lanes=0,t.tag){case 16:e:{var i=t.pendingProps;if(e=dr(t.elementType),t.type=e,typeof e=="function")dc(e)?(i=mr(e,i),t.tag=1,t=wp(null,t,e,i,a)):(t.tag=0,t=$c(null,t,e,i,a));else{if(e!=null){var u=e.$$typeof;if(u===R){t.tag=11,t=pp(null,t,e,i,a);break e}else if(u===H){t.tag=14,t=mp(null,t,e,i,a);break e}}throw t=C(e)||e,Error(l(306,t,""))}}return t;case 0:return $c(e,t,t.type,t.pendingProps,a);case 1:return i=t.type,u=mr(i,t.pendingProps),wp(e,t,i,u,a);case 3:e:{if(Se(t,t.stateNode.containerInfo),e===null)throw Error(l(387));i=t.pendingProps;var d=t.memoizedState;u=d.element,zc(e,t),Ki(t,i,null,a);var y=t.memoizedState;if(i=y.cache,wn(t,Et,i),i!==d.cache&&xc(t,[Et],a,!0),Fi(),i=y.element,d.isDehydrated)if(d={element:i,isDehydrated:!1,cache:y.cache},t.updateQueue.baseState=d,t.memoizedState=d,t.flags&256){t=_p(e,t,i,a);break e}else if(i!==u){u=ga(Error(l(424)),t),qi(u),t=_p(e,t,i,a);break e}else{switch(e=t.stateNode.containerInfo,e.nodeType){case 9:e=e.body;break;default:e=e.nodeName==="HTML"?e.ownerDocument.body:e}for(pt=wa(e.firstChild),Lt=t,Je=!0,yn=null,ya=!0,a=vh(t,null,i,a),t.child=a;a;)a.flags=a.flags&-3|4096,a=a.sibling}else{if(lr(),i===u){t=en(e,t,a);break e}Zt(e,t,i,a)}t=t.child}return t;case 26:return gl(e,t),e===null?(a=Um(t.type,null,t.pendingProps,null))?t.memoizedState=a:Je||(a=t.type,e=t.pendingProps,i=Rl(Ee.current).createElement(a),i[Ut]=t,i[Xt]=e,Vt(i,a,e),Mt(i),t.stateNode=i):t.memoizedState=Um(t.type,e.memoizedProps,t.pendingProps,e.memoizedState),null;case 27:return Me(t),e===null&&Je&&(i=t.stateNode=Mm(t.type,t.pendingProps,Ee.current),Lt=t,ya=!0,u=pt,Mn(t.type)?(Hu=u,pt=wa(i.firstChild)):pt=u),Zt(e,t,t.pendingProps.children,a),gl(e,t),e===null&&(t.flags|=4194304),t.child;case 5:return e===null&&Je&&((u=i=pt)&&(i=Nx(i,t.type,t.pendingProps,ya),i!==null?(t.stateNode=i,Lt=t,pt=wa(i.firstChild),ya=!1,u=!0):u=!1),u||xn(t)),Me(t),u=t.type,d=t.pendingProps,y=e!==null?e.memoizedProps:null,i=d.children,Mu(u,d)?i=null:y!==null&&Mu(u,y)&&(t.flags|=32),t.memoizedState!==null&&(u=Rc(e,t,Iy,null,null,a),go._currentValue=u),gl(e,t),Zt(e,t,i,a),t.child;case 6:return e===null&&Je&&((e=a=pt)&&(a=Ox(a,t.pendingProps,ya),a!==null?(t.stateNode=a,Lt=t,pt=null,e=!0):e=!1),e||xn(t)),null;case 13:return Sp(e,t,a);case 4:return Se(t,t.stateNode.containerInfo),i=t.pendingProps,e===null?t.child=hr(t,null,i,a):Zt(e,t,i,a),t.child;case 11:return pp(e,t,t.type,t.pendingProps,a);case 7:return Zt(e,t,t.pendingProps,a),t.child;case 8:return Zt(e,t,t.pendingProps.children,a),t.child;case 12:return Zt(e,t,t.pendingProps.children,a),t.child;case 10:return i=t.pendingProps,wn(t,t.type,i.value),Zt(e,t,i.children,a),t.child;case 9:return u=t.type._context,i=t.pendingProps.children,cr(t),u=Ht(u),i=i(u),t.flags|=1,Zt(e,t,i,a),t.child;case 14:return mp(e,t,t.type,t.pendingProps,a);case 15:return gp(e,t,t.type,t.pendingProps,a);case 19:return Ep(e,t,a);case 31:return $y(e,t,a);case 22:return vp(e,t,a,t.pendingProps);case 24:return cr(t),i=Ht(Et),e===null?(u=Sc(),u===null&&(u=ht,d=wc(),u.pooledCache=d,d.refCount++,d!==null&&(u.pooledCacheLanes|=a),u=d),t.memoizedState={parent:i,cache:u},Ec(t),wn(t,Et,u)):((e.lanes&a)!==0&&(zc(e,t),Ki(t,null,null,a),Fi()),u=e.memoizedState,d=t.memoizedState,u.parent!==i?(u={parent:i,cache:i},t.memoizedState=u,t.lanes===0&&(t.memoizedState=t.updateQueue.baseState=u),wn(t,Et,i)):(i=d.cache,wn(t,Et,i),i!==u.cache&&xc(t,[Et],a,!0))),Zt(e,t,t.pendingProps.children,a),t.child;case 29:throw t.pendingProps}throw Error(l(156,t.tag))}function tn(e){e.flags|=4}function lu(e,t,a,i,u){if((t=(e.mode&32)!==0)&&(t=!1),t){if(e.flags|=16777216,(u&335544128)===u)if(e.stateNode.complete)e.flags|=8192;else if($p())e.flags|=8192;else throw fr=tl,kc}else e.flags&=-16777217}function Cp(e,t){if(t.type!=="stylesheet"||(t.state.loading&4)!==0)e.flags&=-16777217;else if(e.flags|=16777216,!qm(t))if($p())e.flags|=8192;else throw fr=tl,kc}function bl(e,t){t!==null&&(e.flags|=4),e.flags&16384&&(t=e.tag!==22?of():536870912,e.lanes|=t,ti|=t)}function to(e,t){if(!Je)switch(e.tailMode){case"hidden":t=e.tail;for(var a=null;t!==null;)t.alternate!==null&&(a=t),t=t.sibling;a===null?e.tail=null:a.sibling=null;break;case"collapsed":a=e.tail;for(var i=null;a!==null;)a.alternate!==null&&(i=a),a=a.sibling;i===null?t||e.tail===null?e.tail=null:e.tail.sibling=null:i.sibling=null}}function mt(e){var t=e.alternate!==null&&e.alternate.child===e.child,a=0,i=0;if(t)for(var u=e.child;u!==null;)a|=u.lanes|u.childLanes,i|=u.subtreeFlags&65011712,i|=u.flags&65011712,u.return=e,u=u.sibling;else for(u=e.child;u!==null;)a|=u.lanes|u.childLanes,i|=u.subtreeFlags,i|=u.flags,u.return=e,u=u.sibling;return e.subtreeFlags|=i,e.childLanes=a,t}function tx(e,t,a){var i=t.pendingProps;switch(mc(t),t.tag){case 16:case 15:case 0:case 11:case 7:case 8:case 12:case 9:case 14:return mt(t),null;case 1:return mt(t),null;case 3:return a=t.stateNode,i=null,e!==null&&(i=e.memoizedState.cache),t.memoizedState.cache!==i&&(t.flags|=2048),Ja(Et),ke(),a.pendingContext&&(a.context=a.pendingContext,a.pendingContext=null),(e===null||e.child===null)&&(qr(t)?tn(t):e===null||e.memoizedState.isDehydrated&&(t.flags&256)===0||(t.flags|=1024,vc())),mt(t),null;case 26:var u=t.type,d=t.memoizedState;return e===null?(tn(t),d!==null?(mt(t),Cp(t,d)):(mt(t),lu(t,u,null,i,a))):d?d!==e.memoizedState?(tn(t),mt(t),Cp(t,d)):(mt(t),t.flags&=-16777217):(e=e.memoizedProps,e!==i&&tn(t),mt(t),lu(t,u,e,i,a)),null;case 27:if(Re(t),a=Ee.current,u=t.type,e!==null&&t.stateNode!=null)e.memoizedProps!==i&&tn(t);else{if(!i){if(t.stateNode===null)throw Error(l(166));return mt(t),null}e=ee.current,qr(t)?oh(t):(e=Mm(u,i,a),t.stateNode=e,tn(t))}return mt(t),null;case 5:if(Re(t),u=t.type,e!==null&&t.stateNode!=null)e.memoizedProps!==i&&tn(t);else{if(!i){if(t.stateNode===null)throw Error(l(166));return mt(t),null}if(d=ee.current,qr(t))oh(t);else{var y=Rl(Ee.current);switch(d){case 1:d=y.createElementNS("http://www.w3.org/2000/svg",u);break;case 2:d=y.createElementNS("http://www.w3.org/1998/Math/MathML",u);break;default:switch(u){case"svg":d=y.createElementNS("http://www.w3.org/2000/svg",u);break;case"math":d=y.createElementNS("http://www.w3.org/1998/Math/MathML",u);break;case"script":d=y.createElement("div"),d.innerHTML="<script><\/script>",d=d.removeChild(d.firstChild);break;case"select":d=typeof i.is=="string"?y.createElement("select",{is:i.is}):y.createElement("select"),i.multiple?d.multiple=!0:i.size&&(d.size=i.size);break;default:d=typeof i.is=="string"?y.createElement(u,{is:i.is}):y.createElement(u)}}d[Ut]=t,d[Xt]=i;e:for(y=t.child;y!==null;){if(y.tag===5||y.tag===6)d.appendChild(y.stateNode);else if(y.tag!==4&&y.tag!==27&&y.child!==null){y.child.return=y,y=y.child;continue}if(y===t)break e;for(;y.sibling===null;){if(y.return===null||y.return===t)break e;y=y.return}y.sibling.return=y.return,y=y.sibling}t.stateNode=d;e:switch(Vt(d,u,i),u){case"button":case"input":case"select":case"textarea":i=!!i.autoFocus;break e;case"img":i=!0;break e;default:i=!1}i&&tn(t)}}return mt(t),lu(t,t.type,e===null?null:e.memoizedProps,t.pendingProps,a),null;case 6:if(e&&t.stateNode!=null)e.memoizedProps!==i&&tn(t);else{if(typeof i!="string"&&t.stateNode===null)throw Error(l(166));if(e=Ee.current,qr(t)){if(e=t.stateNode,a=t.memoizedProps,i=null,u=Lt,u!==null)switch(u.tag){case 27:case 5:i=u.memoizedProps}e[Ut]=t,e=!!(e.nodeValue===a||i!==null&&i.suppressHydrationWarning===!0||Sm(e.nodeValue,a)),e||xn(t,!0)}else e=Rl(e).createTextNode(i),e[Ut]=t,t.stateNode=e}return mt(t),null;case 31:if(a=t.memoizedState,e===null||e.memoizedState!==null){if(i=qr(t),a!==null){if(e===null){if(!i)throw Error(l(318));if(e=t.memoizedState,e=e!==null?e.dehydrated:null,!e)throw Error(l(557));e[Ut]=t}else lr(),(t.flags&128)===0&&(t.memoizedState=null),t.flags|=4;mt(t),e=!1}else a=vc(),e!==null&&e.memoizedState!==null&&(e.memoizedState.hydrationErrors=a),e=!0;if(!e)return t.flags&256?(na(t),t):(na(t),null);if((t.flags&128)!==0)throw Error(l(558))}return mt(t),null;case 13:if(i=t.memoizedState,e===null||e.memoizedState!==null&&e.memoizedState.dehydrated!==null){if(u=qr(t),i!==null&&i.dehydrated!==null){if(e===null){if(!u)throw Error(l(318));if(u=t.memoizedState,u=u!==null?u.dehydrated:null,!u)throw Error(l(317));u[Ut]=t}else lr(),(t.flags&128)===0&&(t.memoizedState=null),t.flags|=4;mt(t),u=!1}else u=vc(),e!==null&&e.memoizedState!==null&&(e.memoizedState.hydrationErrors=u),u=!0;if(!u)return t.flags&256?(na(t),t):(na(t),null)}return na(t),(t.flags&128)!==0?(t.lanes=a,t):(a=i!==null,e=e!==null&&e.memoizedState!==null,a&&(i=t.child,u=null,i.alternate!==null&&i.alternate.memoizedState!==null&&i.alternate.memoizedState.cachePool!==null&&(u=i.alternate.memoizedState.cachePool.pool),d=null,i.memoizedState!==null&&i.memoizedState.cachePool!==null&&(d=i.memoizedState.cachePool.pool),d!==u&&(i.flags|=2048)),a!==e&&a&&(t.child.flags|=8192),bl(t,t.updateQueue),mt(t),null);case 4:return ke(),e===null&&Tu(t.stateNode.containerInfo),mt(t),null;case 10:return Ja(t.type),mt(t),null;case 19:if(D(St),i=t.memoizedState,i===null)return mt(t),null;if(u=(t.flags&128)!==0,d=i.rendering,d===null)if(u)to(i,!1);else{if(wt!==0||e!==null&&(e.flags&128)!==0)for(e=t.child;e!==null;){if(d=il(e),d!==null){for(t.flags|=128,to(i,!1),e=d.updateQueue,t.updateQueue=e,bl(t,e),t.subtreeFlags=0,e=a,a=t.child;a!==null;)th(a,e),a=a.sibling;return re(St,St.current&1|2),Je&&Ka(t,i.treeForkCount),t.child}e=e.sibling}i.tail!==null&&_e()>Sl&&(t.flags|=128,u=!0,to(i,!1),t.lanes=4194304)}else{if(!u)if(e=il(d),e!==null){if(t.flags|=128,u=!0,e=e.updateQueue,t.updateQueue=e,bl(t,e),to(i,!0),i.tail===null&&i.tailMode==="hidden"&&!d.alternate&&!Je)return mt(t),null}else 2*_e()-i.renderingStartTime>Sl&&a!==536870912&&(t.flags|=128,u=!0,to(i,!1),t.lanes=4194304);i.isBackwards?(d.sibling=t.child,t.child=d):(e=i.last,e!==null?e.sibling=d:t.child=d,i.last=d)}return i.tail!==null?(e=i.tail,i.rendering=e,i.tail=e.sibling,i.renderingStartTime=_e(),e.sibling=null,a=St.current,re(St,u?a&1|2:a&1),Je&&Ka(t,i.treeForkCount),e):(mt(t),null);case 22:case 23:return na(t),Nc(),i=t.memoizedState!==null,e!==null?e.memoizedState!==null!==i&&(t.flags|=8192):i&&(t.flags|=8192),i?(a&536870912)!==0&&(t.flags&128)===0&&(mt(t),t.subtreeFlags&6&&(t.flags|=8192)):mt(t),a=t.updateQueue,a!==null&&bl(t,a.retryQueue),a=null,e!==null&&e.memoizedState!==null&&e.memoizedState.cachePool!==null&&(a=e.memoizedState.cachePool.pool),i=null,t.memoizedState!==null&&t.memoizedState.cachePool!==null&&(i=t.memoizedState.cachePool.pool),i!==a&&(t.flags|=2048),e!==null&&D(ur),null;case 24:return a=null,e!==null&&(a=e.memoizedState.cache),t.memoizedState.cache!==a&&(t.flags|=2048),Ja(Et),mt(t),null;case 25:return null;case 30:return null}throw Error(l(156,t.tag))}function ax(e,t){switch(mc(t),t.tag){case 1:return e=t.flags,e&65536?(t.flags=e&-65537|128,t):null;case 3:return Ja(Et),ke(),e=t.flags,(e&65536)!==0&&(e&128)===0?(t.flags=e&-65537|128,t):null;case 26:case 27:case 5:return Re(t),null;case 31:if(t.memoizedState!==null){if(na(t),t.alternate===null)throw Error(l(340));lr()}return e=t.flags,e&65536?(t.flags=e&-65537|128,t):null;case 13:if(na(t),e=t.memoizedState,e!==null&&e.dehydrated!==null){if(t.alternate===null)throw Error(l(340));lr()}return e=t.flags,e&65536?(t.flags=e&-65537|128,t):null;case 19:return D(St),null;case 4:return ke(),null;case 10:return Ja(t.type),null;case 22:case 23:return na(t),Nc(),e!==null&&D(ur),e=t.flags,e&65536?(t.flags=e&-65537|128,t):null;case 24:return Ja(Et),null;case 25:return null;default:return null}}function Ap(e,t){switch(mc(t),t.tag){case 3:Ja(Et),ke();break;case 26:case 27:case 5:Re(t);break;case 4:ke();break;case 31:t.memoizedState!==null&&na(t);break;case 13:na(t);break;case 19:D(St);break;case 10:Ja(t.type);break;case 22:case 23:na(t),Nc(),e!==null&&D(ur);break;case 24:Ja(Et)}}function ao(e,t){try{var a=t.updateQueue,i=a!==null?a.lastEffect:null;if(i!==null){var u=i.next;a=u;do{if((a.tag&e)===e){i=void 0;var d=a.create,y=a.inst;i=d(),y.destroy=i}a=a.next}while(a!==u)}}catch(T){lt(t,t.return,T)}}function Cn(e,t,a){try{var i=t.updateQueue,u=i!==null?i.lastEffect:null;if(u!==null){var d=u.next;i=d;do{if((i.tag&e)===e){var y=i.inst,T=y.destroy;if(T!==void 0){y.destroy=void 0,u=t;var Z=a,J=T;try{J()}catch(ce){lt(u,Z,ce)}}}i=i.next}while(i!==d)}}catch(ce){lt(t,t.return,ce)}}function Tp(e){var t=e.updateQueue;if(t!==null){var a=e.stateNode;try{yh(t,a)}catch(i){lt(e,e.return,i)}}}function Np(e,t,a){a.props=mr(e.type,e.memoizedProps),a.state=e.memoizedState;try{a.componentWillUnmount()}catch(i){lt(e,t,i)}}function no(e,t){try{var a=e.ref;if(a!==null){switch(e.tag){case 26:case 27:case 5:var i=e.stateNode;break;case 30:i=e.stateNode;break;default:i=e.stateNode}typeof a=="function"?e.refCleanup=a(i):a.current=i}}catch(u){lt(e,t,u)}}function Ua(e,t){var a=e.ref,i=e.refCleanup;if(a!==null)if(typeof i=="function")try{i()}catch(u){lt(e,t,u)}finally{e.refCleanup=null,e=e.alternate,e!=null&&(e.refCleanup=null)}else if(typeof a=="function")try{a(null)}catch(u){lt(e,t,u)}else a.current=null}function Op(e){var t=e.type,a=e.memoizedProps,i=e.stateNode;try{e:switch(t){case"button":case"input":case"select":case"textarea":a.autoFocus&&i.focus();break e;case"img":a.src?i.src=a.src:a.srcSet&&(i.srcset=a.srcSet)}}catch(u){lt(e,e.return,u)}}function su(e,t,a){try{var i=e.stateNode;kx(i,e.type,a,t),i[Xt]=t}catch(u){lt(e,e.return,u)}}function jp(e){return e.tag===5||e.tag===3||e.tag===26||e.tag===27&&Mn(e.type)||e.tag===4}function cu(e){e:for(;;){for(;e.sibling===null;){if(e.return===null||jp(e.return))return null;e=e.return}for(e.sibling.return=e.return,e=e.sibling;e.tag!==5&&e.tag!==6&&e.tag!==18;){if(e.tag===27&&Mn(e.type)||e.flags&2||e.child===null||e.tag===4)continue e;e.child.return=e,e=e.child}if(!(e.flags&2))return e.stateNode}}function uu(e,t,a){var i=e.tag;if(i===5||i===6)e=e.stateNode,t?(a.nodeType===9?a.body:a.nodeName==="HTML"?a.ownerDocument.body:a).insertBefore(e,t):(t=a.nodeType===9?a.body:a.nodeName==="HTML"?a.ownerDocument.body:a,t.appendChild(e),a=a._reactRootContainer,a!=null||t.onclick!==null||(t.onclick=Xa));else if(i!==4&&(i===27&&Mn(e.type)&&(a=e.stateNode,t=null),e=e.child,e!==null))for(uu(e,t,a),e=e.sibling;e!==null;)uu(e,t,a),e=e.sibling}function yl(e,t,a){var i=e.tag;if(i===5||i===6)e=e.stateNode,t?a.insertBefore(e,t):a.appendChild(e);else if(i!==4&&(i===27&&Mn(e.type)&&(a=e.stateNode),e=e.child,e!==null))for(yl(e,t,a),e=e.sibling;e!==null;)yl(e,t,a),e=e.sibling}function Rp(e){var t=e.stateNode,a=e.memoizedProps;try{for(var i=e.type,u=t.attributes;u.length;)t.removeAttributeNode(u[0]);Vt(t,i,a),t[Ut]=e,t[Xt]=a}catch(d){lt(e,e.return,d)}}var an=!1,At=!1,du=!1,Mp=typeof WeakSet=="function"?WeakSet:Set,Dt=null;function nx(e,t){if(e=e.containerInfo,ju=Zl,e=Xf(e),rc(e)){if("selectionStart"in e)var a={start:e.selectionStart,end:e.selectionEnd};else e:{a=(a=e.ownerDocument)&&a.defaultView||window;var i=a.getSelection&&a.getSelection();if(i&&i.rangeCount!==0){a=i.anchorNode;var u=i.anchorOffset,d=i.focusNode;i=i.focusOffset;try{a.nodeType,d.nodeType}catch{a=null;break e}var y=0,T=-1,Z=-1,J=0,ce=0,fe=e,te=null;t:for(;;){for(var oe;fe!==a||u!==0&&fe.nodeType!==3||(T=y+u),fe!==d||i!==0&&fe.nodeType!==3||(Z=y+i),fe.nodeType===3&&(y+=fe.nodeValue.length),(oe=fe.firstChild)!==null;)te=fe,fe=oe;for(;;){if(fe===e)break t;if(te===a&&++J===u&&(T=y),te===d&&++ce===i&&(Z=y),(oe=fe.nextSibling)!==null)break;fe=te,te=fe.parentNode}fe=oe}a=T===-1||Z===-1?null:{start:T,end:Z}}else a=null}a=a||{start:0,end:0}}else a=null;for(Ru={focusedElem:e,selectionRange:a},Zl=!1,Dt=t;Dt!==null;)if(t=Dt,e=t.child,(t.subtreeFlags&1028)!==0&&e!==null)e.return=t,Dt=e;else for(;Dt!==null;){switch(t=Dt,d=t.alternate,e=t.flags,t.tag){case 0:if((e&4)!==0&&(e=t.updateQueue,e=e!==null?e.events:null,e!==null))for(a=0;a<e.length;a++)u=e[a],u.ref.impl=u.nextImpl;break;case 11:case 15:break;case 1:if((e&1024)!==0&&d!==null){e=void 0,a=t,u=d.memoizedProps,d=d.memoizedState,i=a.stateNode;try{var Ce=mr(a.type,u);e=i.getSnapshotBeforeUpdate(Ce,d),i.__reactInternalSnapshotBeforeUpdate=e}catch(Ue){lt(a,a.return,Ue)}}break;case 3:if((e&1024)!==0){if(e=t.stateNode.containerInfo,a=e.nodeType,a===9)Bu(e);else if(a===1)switch(e.nodeName){case"HEAD":case"HTML":case"BODY":Bu(e);break;default:e.textContent=""}}break;case 5:case 26:case 27:case 6:case 4:case 17:break;default:if((e&1024)!==0)throw Error(l(163))}if(e=t.sibling,e!==null){e.return=t.return,Dt=e;break}Dt=t.return}}function Dp(e,t,a){var i=a.flags;switch(a.tag){case 0:case 11:case 15:rn(e,a),i&4&&ao(5,a);break;case 1:if(rn(e,a),i&4)if(e=a.stateNode,t===null)try{e.componentDidMount()}catch(y){lt(a,a.return,y)}else{var u=mr(a.type,t.memoizedProps);t=t.memoizedState;try{e.componentDidUpdate(u,t,e.__reactInternalSnapshotBeforeUpdate)}catch(y){lt(a,a.return,y)}}i&64&&Tp(a),i&512&&no(a,a.return);break;case 3:if(rn(e,a),i&64&&(e=a.updateQueue,e!==null)){if(t=null,a.child!==null)switch(a.child.tag){case 27:case 5:t=a.child.stateNode;break;case 1:t=a.child.stateNode}try{yh(e,t)}catch(y){lt(a,a.return,y)}}break;case 27:t===null&&i&4&&Rp(a);case 26:case 5:rn(e,a),t===null&&i&4&&Op(a),i&512&&no(a,a.return);break;case 12:rn(e,a);break;case 31:rn(e,a),i&4&&Lp(e,a);break;case 13:rn(e,a),i&4&&Hp(e,a),i&64&&(e=a.memoizedState,e!==null&&(e=e.dehydrated,e!==null&&(a=fx.bind(null,a),jx(e,a))));break;case 22:if(i=a.memoizedState!==null||an,!i){t=t!==null&&t.memoizedState!==null||At,u=an;var d=At;an=i,(At=t)&&!d?on(e,a,(a.subtreeFlags&8772)!==0):rn(e,a),an=u,At=d}break;case 30:break;default:rn(e,a)}}function Bp(e){var t=e.alternate;t!==null&&(e.alternate=null,Bp(t)),e.child=null,e.deletions=null,e.sibling=null,e.tag===5&&(t=e.stateNode,t!==null&&Vs(t)),e.stateNode=null,e.return=null,e.dependencies=null,e.memoizedProps=null,e.memoizedState=null,e.pendingProps=null,e.stateNode=null,e.updateQueue=null}var vt=null,Ft=!1;function nn(e,t,a){for(a=a.child;a!==null;)Up(e,t,a),a=a.sibling}function Up(e,t,a){if(Rt&&typeof Rt.onCommitFiberUnmount=="function")try{Rt.onCommitFiberUnmount(ft,a)}catch{}switch(a.tag){case 26:At||Ua(a,t),nn(e,t,a),a.memoizedState?a.memoizedState.count--:a.stateNode&&(a=a.stateNode,a.parentNode.removeChild(a));break;case 27:At||Ua(a,t);var i=vt,u=Ft;Mn(a.type)&&(vt=a.stateNode,Ft=!1),nn(e,t,a),ho(a.stateNode),vt=i,Ft=u;break;case 5:At||Ua(a,t);case 6:if(i=vt,u=Ft,vt=null,nn(e,t,a),vt=i,Ft=u,vt!==null)if(Ft)try{(vt.nodeType===9?vt.body:vt.nodeName==="HTML"?vt.ownerDocument.body:vt).removeChild(a.stateNode)}catch(d){lt(a,t,d)}else try{vt.removeChild(a.stateNode)}catch(d){lt(a,t,d)}break;case 18:vt!==null&&(Ft?(e=vt,Tm(e.nodeType===9?e.body:e.nodeName==="HTML"?e.ownerDocument.body:e,a.stateNode),ci(e)):Tm(vt,a.stateNode));break;case 4:i=vt,u=Ft,vt=a.stateNode.containerInfo,Ft=!0,nn(e,t,a),vt=i,Ft=u;break;case 0:case 11:case 14:case 15:Cn(2,a,t),At||Cn(4,a,t),nn(e,t,a);break;case 1:At||(Ua(a,t),i=a.stateNode,typeof i.componentWillUnmount=="function"&&Np(a,t,i)),nn(e,t,a);break;case 21:nn(e,t,a);break;case 22:At=(i=At)||a.memoizedState!==null,nn(e,t,a),At=i;break;default:nn(e,t,a)}}function Lp(e,t){if(t.memoizedState===null&&(e=t.alternate,e!==null&&(e=e.memoizedState,e!==null))){e=e.dehydrated;try{ci(e)}catch(a){lt(t,t.return,a)}}}function Hp(e,t){if(t.memoizedState===null&&(e=t.alternate,e!==null&&(e=e.memoizedState,e!==null&&(e=e.dehydrated,e!==null))))try{ci(e)}catch(a){lt(t,t.return,a)}}function rx(e){switch(e.tag){case 31:case 13:case 19:var t=e.stateNode;return t===null&&(t=e.stateNode=new Mp),t;case 22:return e=e.stateNode,t=e._retryCache,t===null&&(t=e._retryCache=new Mp),t;default:throw Error(l(435,e.tag))}}function xl(e,t){var a=rx(e);t.forEach(function(i){if(!a.has(i)){a.add(i);var u=hx.bind(null,e,i);i.then(u,u)}})}function Kt(e,t){var a=t.deletions;if(a!==null)for(var i=0;i<a.length;i++){var u=a[i],d=e,y=t,T=y;e:for(;T!==null;){switch(T.tag){case 27:if(Mn(T.type)){vt=T.stateNode,Ft=!1;break e}break;case 5:vt=T.stateNode,Ft=!1;break e;case 3:case 4:vt=T.stateNode.containerInfo,Ft=!0;break e}T=T.return}if(vt===null)throw Error(l(160));Up(d,y,u),vt=null,Ft=!1,d=u.alternate,d!==null&&(d.return=null),u.return=null}if(t.subtreeFlags&13886)for(t=t.child;t!==null;)Zp(t,e),t=t.sibling}var Ta=null;function Zp(e,t){var a=e.alternate,i=e.flags;switch(e.tag){case 0:case 11:case 14:case 15:Kt(t,e),Pt(e),i&4&&(Cn(3,e,e.return),ao(3,e),Cn(5,e,e.return));break;case 1:Kt(t,e),Pt(e),i&512&&(At||a===null||Ua(a,a.return)),i&64&&an&&(e=e.updateQueue,e!==null&&(i=e.callbacks,i!==null&&(a=e.shared.hiddenCallbacks,e.shared.hiddenCallbacks=a===null?i:a.concat(i))));break;case 26:var u=Ta;if(Kt(t,e),Pt(e),i&512&&(At||a===null||Ua(a,a.return)),i&4){var d=a!==null?a.memoizedState:null;if(i=e.memoizedState,a===null)if(i===null)if(e.stateNode===null){e:{i=e.type,a=e.memoizedProps,u=u.ownerDocument||u;t:switch(i){case"title":d=u.getElementsByTagName("title")[0],(!d||d[Ni]||d[Ut]||d.namespaceURI==="http://www.w3.org/2000/svg"||d.hasAttribute("itemprop"))&&(d=u.createElement(i),u.head.insertBefore(d,u.querySelector("head > title"))),Vt(d,i,a),d[Ut]=e,Mt(d),i=d;break e;case"link":var y=Zm("link","href",u).get(i+(a.href||""));if(y){for(var T=0;T<y.length;T++)if(d=y[T],d.getAttribute("href")===(a.href==null||a.href===""?null:a.href)&&d.getAttribute("rel")===(a.rel==null?null:a.rel)&&d.getAttribute("title")===(a.title==null?null:a.title)&&d.getAttribute("crossorigin")===(a.crossOrigin==null?null:a.crossOrigin)){y.splice(T,1);break t}}d=u.createElement(i),Vt(d,i,a),u.head.appendChild(d);break;case"meta":if(y=Zm("meta","content",u).get(i+(a.content||""))){for(T=0;T<y.length;T++)if(d=y[T],d.getAttribute("content")===(a.content==null?null:""+a.content)&&d.getAttribute("name")===(a.name==null?null:a.name)&&d.getAttribute("property")===(a.property==null?null:a.property)&&d.getAttribute("http-equiv")===(a.httpEquiv==null?null:a.httpEquiv)&&d.getAttribute("charset")===(a.charSet==null?null:a.charSet)){y.splice(T,1);break t}}d=u.createElement(i),Vt(d,i,a),u.head.appendChild(d);break;default:throw Error(l(468,i))}d[Ut]=e,Mt(d),i=d}e.stateNode=i}else Vm(u,e.type,e.stateNode);else e.stateNode=Hm(u,i,e.memoizedProps);else d!==i?(d===null?a.stateNode!==null&&(a=a.stateNode,a.parentNode.removeChild(a)):d.count--,i===null?Vm(u,e.type,e.stateNode):Hm(u,i,e.memoizedProps)):i===null&&e.stateNode!==null&&su(e,e.memoizedProps,a.memoizedProps)}break;case 27:Kt(t,e),Pt(e),i&512&&(At||a===null||Ua(a,a.return)),a!==null&&i&4&&su(e,e.memoizedProps,a.memoizedProps);break;case 5:if(Kt(t,e),Pt(e),i&512&&(At||a===null||Ua(a,a.return)),e.flags&32){u=e.stateNode;try{jr(u,"")}catch(Ce){lt(e,e.return,Ce)}}i&4&&e.stateNode!=null&&(u=e.memoizedProps,su(e,u,a!==null?a.memoizedProps:u)),i&1024&&(du=!0);break;case 6:if(Kt(t,e),Pt(e),i&4){if(e.stateNode===null)throw Error(l(162));i=e.memoizedProps,a=e.stateNode;try{a.nodeValue=i}catch(Ce){lt(e,e.return,Ce)}}break;case 3:if(Bl=null,u=Ta,Ta=Ml(t.containerInfo),Kt(t,e),Ta=u,Pt(e),i&4&&a!==null&&a.memoizedState.isDehydrated)try{ci(t.containerInfo)}catch(Ce){lt(e,e.return,Ce)}du&&(du=!1,Vp(e));break;case 4:i=Ta,Ta=Ml(e.stateNode.containerInfo),Kt(t,e),Pt(e),Ta=i;break;case 12:Kt(t,e),Pt(e);break;case 31:Kt(t,e),Pt(e),i&4&&(i=e.updateQueue,i!==null&&(e.updateQueue=null,xl(e,i)));break;case 13:Kt(t,e),Pt(e),e.child.flags&8192&&e.memoizedState!==null!=(a!==null&&a.memoizedState!==null)&&(_l=_e()),i&4&&(i=e.updateQueue,i!==null&&(e.updateQueue=null,xl(e,i)));break;case 22:u=e.memoizedState!==null;var Z=a!==null&&a.memoizedState!==null,J=an,ce=At;if(an=J||u,At=ce||Z,Kt(t,e),At=ce,an=J,Pt(e),i&8192)e:for(t=e.stateNode,t._visibility=u?t._visibility&-2:t._visibility|1,u&&(a===null||Z||an||At||gr(e)),a=null,t=e;;){if(t.tag===5||t.tag===26){if(a===null){Z=a=t;try{if(d=Z.stateNode,u)y=d.style,typeof y.setProperty=="function"?y.setProperty("display","none","important"):y.display="none";else{T=Z.stateNode;var fe=Z.memoizedProps.style,te=fe!=null&&fe.hasOwnProperty("display")?fe.display:null;T.style.display=te==null||typeof te=="boolean"?"":(""+te).trim()}}catch(Ce){lt(Z,Z.return,Ce)}}}else if(t.tag===6){if(a===null){Z=t;try{Z.stateNode.nodeValue=u?"":Z.memoizedProps}catch(Ce){lt(Z,Z.return,Ce)}}}else if(t.tag===18){if(a===null){Z=t;try{var oe=Z.stateNode;u?Nm(oe,!0):Nm(Z.stateNode,!1)}catch(Ce){lt(Z,Z.return,Ce)}}}else if((t.tag!==22&&t.tag!==23||t.memoizedState===null||t===e)&&t.child!==null){t.child.return=t,t=t.child;continue}if(t===e)break e;for(;t.sibling===null;){if(t.return===null||t.return===e)break e;a===t&&(a=null),t=t.return}a===t&&(a=null),t.sibling.return=t.return,t=t.sibling}i&4&&(i=e.updateQueue,i!==null&&(a=i.retryQueue,a!==null&&(i.retryQueue=null,xl(e,a))));break;case 19:Kt(t,e),Pt(e),i&4&&(i=e.updateQueue,i!==null&&(e.updateQueue=null,xl(e,i)));break;case 30:break;case 21:break;default:Kt(t,e),Pt(e)}}function Pt(e){var t=e.flags;if(t&2){try{for(var a,i=e.return;i!==null;){if(jp(i)){a=i;break}i=i.return}if(a==null)throw Error(l(160));switch(a.tag){case 27:var u=a.stateNode,d=cu(e);yl(e,d,u);break;case 5:var y=a.stateNode;a.flags&32&&(jr(y,""),a.flags&=-33);var T=cu(e);yl(e,T,y);break;case 3:case 4:var Z=a.stateNode.containerInfo,J=cu(e);uu(e,J,Z);break;default:throw Error(l(161))}}catch(ce){lt(e,e.return,ce)}e.flags&=-3}t&4096&&(e.flags&=-4097)}function Vp(e){if(e.subtreeFlags&1024)for(e=e.child;e!==null;){var t=e;Vp(t),t.tag===5&&t.flags&1024&&t.stateNode.reset(),e=e.sibling}}function rn(e,t){if(t.subtreeFlags&8772)for(t=t.child;t!==null;)Dp(e,t.alternate,t),t=t.sibling}function gr(e){for(e=e.child;e!==null;){var t=e;switch(t.tag){case 0:case 11:case 14:case 15:Cn(4,t,t.return),gr(t);break;case 1:Ua(t,t.return);var a=t.stateNode;typeof a.componentWillUnmount=="function"&&Np(t,t.return,a),gr(t);break;case 27:ho(t.stateNode);case 26:case 5:Ua(t,t.return),gr(t);break;case 22:t.memoizedState===null&&gr(t);break;case 30:gr(t);break;default:gr(t)}e=e.sibling}}function on(e,t,a){for(a=a&&(t.subtreeFlags&8772)!==0,t=t.child;t!==null;){var i=t.alternate,u=e,d=t,y=d.flags;switch(d.tag){case 0:case 11:case 15:on(u,d,a),ao(4,d);break;case 1:if(on(u,d,a),i=d,u=i.stateNode,typeof u.componentDidMount=="function")try{u.componentDidMount()}catch(J){lt(i,i.return,J)}if(i=d,u=i.updateQueue,u!==null){var T=i.stateNode;try{var Z=u.shared.hiddenCallbacks;if(Z!==null)for(u.shared.hiddenCallbacks=null,u=0;u<Z.length;u++)bh(Z[u],T)}catch(J){lt(i,i.return,J)}}a&&y&64&&Tp(d),no(d,d.return);break;case 27:Rp(d);case 26:case 5:on(u,d,a),a&&i===null&&y&4&&Op(d),no(d,d.return);break;case 12:on(u,d,a);break;case 31:on(u,d,a),a&&y&4&&Lp(u,d);break;case 13:on(u,d,a),a&&y&4&&Hp(u,d);break;case 22:d.memoizedState===null&&on(u,d,a),no(d,d.return);break;case 30:break;default:on(u,d,a)}t=t.sibling}}function fu(e,t){var a=null;e!==null&&e.memoizedState!==null&&e.memoizedState.cachePool!==null&&(a=e.memoizedState.cachePool.pool),e=null,t.memoizedState!==null&&t.memoizedState.cachePool!==null&&(e=t.memoizedState.cachePool.pool),e!==a&&(e!=null&&e.refCount++,a!=null&&Gi(a))}function hu(e,t){e=null,t.alternate!==null&&(e=t.alternate.memoizedState.cache),t=t.memoizedState.cache,t!==e&&(t.refCount++,e!=null&&Gi(e))}function Na(e,t,a,i){if(t.subtreeFlags&10256)for(t=t.child;t!==null;)qp(e,t,a,i),t=t.sibling}function qp(e,t,a,i){var u=t.flags;switch(t.tag){case 0:case 11:case 15:Na(e,t,a,i),u&2048&&ao(9,t);break;case 1:Na(e,t,a,i);break;case 3:Na(e,t,a,i),u&2048&&(e=null,t.alternate!==null&&(e=t.alternate.memoizedState.cache),t=t.memoizedState.cache,t!==e&&(t.refCount++,e!=null&&Gi(e)));break;case 12:if(u&2048){Na(e,t,a,i),e=t.stateNode;try{var d=t.memoizedProps,y=d.id,T=d.onPostCommit;typeof T=="function"&&T(y,t.alternate===null?"mount":"update",e.passiveEffectDuration,-0)}catch(Z){lt(t,t.return,Z)}}else Na(e,t,a,i);break;case 31:Na(e,t,a,i);break;case 13:Na(e,t,a,i);break;case 23:break;case 22:d=t.stateNode,y=t.alternate,t.memoizedState!==null?d._visibility&2?Na(e,t,a,i):ro(e,t):d._visibility&2?Na(e,t,a,i):(d._visibility|=2,Wr(e,t,a,i,(t.subtreeFlags&10256)!==0||!1)),u&2048&&fu(y,t);break;case 24:Na(e,t,a,i),u&2048&&hu(t.alternate,t);break;default:Na(e,t,a,i)}}function Wr(e,t,a,i,u){for(u=u&&((t.subtreeFlags&10256)!==0||!1),t=t.child;t!==null;){var d=e,y=t,T=a,Z=i,J=y.flags;switch(y.tag){case 0:case 11:case 15:Wr(d,y,T,Z,u),ao(8,y);break;case 23:break;case 22:var ce=y.stateNode;y.memoizedState!==null?ce._visibility&2?Wr(d,y,T,Z,u):ro(d,y):(ce._visibility|=2,Wr(d,y,T,Z,u)),u&&J&2048&&fu(y.alternate,y);break;case 24:Wr(d,y,T,Z,u),u&&J&2048&&hu(y.alternate,y);break;default:Wr(d,y,T,Z,u)}t=t.sibling}}function ro(e,t){if(t.subtreeFlags&10256)for(t=t.child;t!==null;){var a=e,i=t,u=i.flags;switch(i.tag){case 22:ro(a,i),u&2048&&fu(i.alternate,i);break;case 24:ro(a,i),u&2048&&hu(i.alternate,i);break;default:ro(a,i)}t=t.sibling}}var io=8192;function $r(e,t,a){if(e.subtreeFlags&io)for(e=e.child;e!==null;)Gp(e,t,a),e=e.sibling}function Gp(e,t,a){switch(e.tag){case 26:$r(e,t,a),e.flags&io&&e.memoizedState!==null&&Yx(a,Ta,e.memoizedState,e.memoizedProps);break;case 5:$r(e,t,a);break;case 3:case 4:var i=Ta;Ta=Ml(e.stateNode.containerInfo),$r(e,t,a),Ta=i;break;case 22:e.memoizedState===null&&(i=e.alternate,i!==null&&i.memoizedState!==null?(i=io,io=16777216,$r(e,t,a),io=i):$r(e,t,a));break;default:$r(e,t,a)}}function Yp(e){var t=e.alternate;if(t!==null&&(e=t.child,e!==null)){t.child=null;do t=e.sibling,e.sibling=null,e=t;while(e!==null)}}function oo(e){var t=e.deletions;if((e.flags&16)!==0){if(t!==null)for(var a=0;a<t.length;a++){var i=t[a];Dt=i,Xp(i,e)}Yp(e)}if(e.subtreeFlags&10256)for(e=e.child;e!==null;)Ip(e),e=e.sibling}function Ip(e){switch(e.tag){case 0:case 11:case 15:oo(e),e.flags&2048&&Cn(9,e,e.return);break;case 3:oo(e);break;case 12:oo(e);break;case 22:var t=e.stateNode;e.memoizedState!==null&&t._visibility&2&&(e.return===null||e.return.tag!==13)?(t._visibility&=-3,wl(e)):oo(e);break;default:oo(e)}}function wl(e){var t=e.deletions;if((e.flags&16)!==0){if(t!==null)for(var a=0;a<t.length;a++){var i=t[a];Dt=i,Xp(i,e)}Yp(e)}for(e=e.child;e!==null;){switch(t=e,t.tag){case 0:case 11:case 15:Cn(8,t,t.return),wl(t);break;case 22:a=t.stateNode,a._visibility&2&&(a._visibility&=-3,wl(t));break;default:wl(t)}e=e.sibling}}function Xp(e,t){for(;Dt!==null;){var a=Dt;switch(a.tag){case 0:case 11:case 15:Cn(8,a,t);break;case 23:case 22:if(a.memoizedState!==null&&a.memoizedState.cachePool!==null){var i=a.memoizedState.cachePool.pool;i!=null&&i.refCount++}break;case 24:Gi(a.memoizedState.cache)}if(i=a.child,i!==null)i.return=a,Dt=i;else e:for(a=e;Dt!==null;){i=Dt;var u=i.sibling,d=i.return;if(Bp(i),i===a){Dt=null;break e}if(u!==null){u.return=d,Dt=u;break e}Dt=d}}}var ix={getCacheForType:function(e){var t=Ht(Et),a=t.data.get(e);return a===void 0&&(a=e(),t.data.set(e,a)),a},cacheSignal:function(){return Ht(Et).controller.signal}},ox=typeof WeakMap=="function"?WeakMap:Map,at=0,ht=null,Qe=null,Ke=0,ot=0,ra=null,An=!1,ei=!1,pu=!1,ln=0,wt=0,Tn=0,vr=0,mu=0,ia=0,ti=0,lo=null,Jt=null,gu=!1,_l=0,Qp=0,Sl=1/0,kl=null,Nn=null,Ot=0,On=null,ai=null,sn=0,vu=0,bu=null,Fp=null,so=0,yu=null;function oa(){return(at&2)!==0&&Ke!==0?Ke&-Ke:V.T!==null?Eu():uf()}function Kp(){if(ia===0)if((Ke&536870912)===0||Je){var e=er;er<<=1,(er&3932160)===0&&(er=262144),ia=e}else ia=536870912;return e=aa.current,e!==null&&(e.flags|=32),ia}function Wt(e,t,a){(e===ht&&(ot===2||ot===9)||e.cancelPendingCommit!==null)&&(ni(e,0),jn(e,Ke,ia,!1)),Ti(e,a),((at&2)===0||e!==ht)&&(e===ht&&((at&2)===0&&(vr|=a),wt===4&&jn(e,Ke,ia,!1)),La(e))}function Pp(e,t,a){if((at&6)!==0)throw Error(l(327));var i=!a&&(t&127)===0&&(t&e.expiredLanes)===0||Ai(e,t),u=i?cx(e,t):wu(e,t,!0),d=i;do{if(u===0){ei&&!i&&jn(e,t,0,!1);break}else{if(a=e.current.alternate,d&&!lx(a)){u=wu(e,t,!1),d=!1;continue}if(u===2){if(d=t,e.errorRecoveryDisabledLanes&d)var y=0;else y=e.pendingLanes&-536870913,y=y!==0?y:y&536870912?536870912:0;if(y!==0){t=y;e:{var T=e;u=lo;var Z=T.current.memoizedState.isDehydrated;if(Z&&(ni(T,y).flags|=256),y=wu(T,y,!1),y!==2){if(pu&&!Z){T.errorRecoveryDisabledLanes|=d,vr|=d,u=4;break e}d=Jt,Jt=u,d!==null&&(Jt===null?Jt=d:Jt.push.apply(Jt,d))}u=y}if(d=!1,u!==2)continue}}if(u===1){ni(e,0),jn(e,t,0,!0);break}e:{switch(i=e,d=u,d){case 0:case 1:throw Error(l(345));case 4:if((t&4194048)!==t)break;case 6:jn(i,t,ia,!An);break e;case 2:Jt=null;break;case 3:case 5:break;default:throw Error(l(329))}if((t&62914560)===t&&(u=_l+300-_e(),10<u)){if(jn(i,t,ia,!An),Mo(i,0,!0)!==0)break e;sn=t,i.timeoutHandle=Cm(Jp.bind(null,i,a,Jt,kl,gu,t,ia,vr,ti,An,d,"Throttled",-0,0),u);break e}Jp(i,a,Jt,kl,gu,t,ia,vr,ti,An,d,null,-0,0)}}break}while(!0);La(e)}function Jp(e,t,a,i,u,d,y,T,Z,J,ce,fe,te,oe){if(e.timeoutHandle=-1,fe=t.subtreeFlags,fe&8192||(fe&16785408)===16785408){fe={stylesheets:null,count:0,imgCount:0,imgBytes:0,suspenseyImages:[],waitingForImages:!0,waitingForViewTransition:!1,unsuspend:Xa},Gp(t,d,fe);var Ce=(d&62914560)===d?_l-_e():(d&4194048)===d?Qp-_e():0;if(Ce=Ix(fe,Ce),Ce!==null){sn=d,e.cancelPendingCommit=Ce(im.bind(null,e,t,d,a,i,u,y,T,Z,ce,fe,null,te,oe)),jn(e,d,y,!J);return}}im(e,t,d,a,i,u,y,T,Z)}function lx(e){for(var t=e;;){var a=t.tag;if((a===0||a===11||a===15)&&t.flags&16384&&(a=t.updateQueue,a!==null&&(a=a.stores,a!==null)))for(var i=0;i<a.length;i++){var u=a[i],d=u.getSnapshot;u=u.value;try{if(!ea(d(),u))return!1}catch{return!1}}if(a=t.child,t.subtreeFlags&16384&&a!==null)a.return=t,t=a;else{if(t===e)break;for(;t.sibling===null;){if(t.return===null||t.return===e)return!0;t=t.return}t.sibling.return=t.return,t=t.sibling}}return!0}function jn(e,t,a,i){t&=~mu,t&=~vr,e.suspendedLanes|=t,e.pingedLanes&=~t,i&&(e.warmLanes|=t),i=e.expirationTimes;for(var u=t;0<u;){var d=31-bt(u),y=1<<d;i[d]=-1,u&=~y}a!==0&&lf(e,a,t)}function El(){return(at&6)===0?(co(0),!1):!0}function xu(){if(Qe!==null){if(ot===0)var e=Qe.return;else e=Qe,Pa=sr=null,Bc(e),Qr=null,Ii=0,e=Qe;for(;e!==null;)Ap(e.alternate,e),e=e.return;Qe=null}}function ni(e,t){var a=e.timeoutHandle;a!==-1&&(e.timeoutHandle=-1,Cx(a)),a=e.cancelPendingCommit,a!==null&&(e.cancelPendingCommit=null,a()),sn=0,xu(),ht=e,Qe=a=Fa(e.current,null),Ke=t,ot=0,ra=null,An=!1,ei=Ai(e,t),pu=!1,ti=ia=mu=vr=Tn=wt=0,Jt=lo=null,gu=!1,(t&8)!==0&&(t|=t&32);var i=e.entangledLanes;if(i!==0)for(e=e.entanglements,i&=t;0<i;){var u=31-bt(i),d=1<<u;t|=e[u],i&=~d}return ln=t,Xo(),a}function Wp(e,t){qe=null,V.H=$i,t===Xr||t===el?(t=ph(),ot=3):t===kc?(t=ph(),ot=4):ot=t===Wc?8:t!==null&&typeof t=="object"&&typeof t.then=="function"?6:1,ra=t,Qe===null&&(wt=1,pl(e,ga(t,e.current)))}function $p(){var e=aa.current;return e===null?!0:(Ke&4194048)===Ke?xa===null:(Ke&62914560)===Ke||(Ke&536870912)!==0?e===xa:!1}function em(){var e=V.H;return V.H=$i,e===null?$i:e}function tm(){var e=V.A;return V.A=ix,e}function zl(){wt=4,An||(Ke&4194048)!==Ke&&aa.current!==null||(ei=!0),(Tn&134217727)===0&&(vr&134217727)===0||ht===null||jn(ht,Ke,ia,!1)}function wu(e,t,a){var i=at;at|=2;var u=em(),d=tm();(ht!==e||Ke!==t)&&(kl=null,ni(e,t)),t=!1;var y=wt;e:do try{if(ot!==0&&Qe!==null){var T=Qe,Z=ra;switch(ot){case 8:xu(),y=6;break e;case 3:case 2:case 9:case 6:aa.current===null&&(t=!0);var J=ot;if(ot=0,ra=null,ri(e,T,Z,J),a&&ei){y=0;break e}break;default:J=ot,ot=0,ra=null,ri(e,T,Z,J)}}sx(),y=wt;break}catch(ce){Wp(e,ce)}while(!0);return t&&e.shellSuspendCounter++,Pa=sr=null,at=i,V.H=u,V.A=d,Qe===null&&(ht=null,Ke=0,Xo()),y}function sx(){for(;Qe!==null;)am(Qe)}function cx(e,t){var a=at;at|=2;var i=em(),u=tm();ht!==e||Ke!==t?(kl=null,Sl=_e()+500,ni(e,t)):ei=Ai(e,t);e:do try{if(ot!==0&&Qe!==null){t=Qe;var d=ra;t:switch(ot){case 1:ot=0,ra=null,ri(e,t,d,1);break;case 2:case 9:if(fh(d)){ot=0,ra=null,nm(t);break}t=function(){ot!==2&&ot!==9||ht!==e||(ot=7),La(e)},d.then(t,t);break e;case 3:ot=7;break e;case 4:ot=5;break e;case 7:fh(d)?(ot=0,ra=null,nm(t)):(ot=0,ra=null,ri(e,t,d,7));break;case 5:var y=null;switch(Qe.tag){case 26:y=Qe.memoizedState;case 5:case 27:var T=Qe;if(y?qm(y):T.stateNode.complete){ot=0,ra=null;var Z=T.sibling;if(Z!==null)Qe=Z;else{var J=T.return;J!==null?(Qe=J,Cl(J)):Qe=null}break t}}ot=0,ra=null,ri(e,t,d,5);break;case 6:ot=0,ra=null,ri(e,t,d,6);break;case 8:xu(),wt=6;break e;default:throw Error(l(462))}}ux();break}catch(ce){Wp(e,ce)}while(!0);return Pa=sr=null,V.H=i,V.A=u,at=a,Qe!==null?0:(ht=null,Ke=0,Xo(),wt)}function ux(){for(;Qe!==null&&!$();)am(Qe)}function am(e){var t=zp(e.alternate,e,ln);e.memoizedProps=e.pendingProps,t===null?Cl(e):Qe=t}function nm(e){var t=e,a=t.alternate;switch(t.tag){case 15:case 0:t=xp(a,t,t.pendingProps,t.type,void 0,Ke);break;case 11:t=xp(a,t,t.pendingProps,t.type.render,t.ref,Ke);break;case 5:Bc(t);default:Ap(a,t),t=Qe=th(t,ln),t=zp(a,t,ln)}e.memoizedProps=e.pendingProps,t===null?Cl(e):Qe=t}function ri(e,t,a,i){Pa=sr=null,Bc(t),Qr=null,Ii=0;var u=t.return;try{if(Wy(e,u,t,a,Ke)){wt=1,pl(e,ga(a,e.current)),Qe=null;return}}catch(d){if(u!==null)throw Qe=u,d;wt=1,pl(e,ga(a,e.current)),Qe=null;return}t.flags&32768?(Je||i===1?e=!0:ei||(Ke&536870912)!==0?e=!1:(An=e=!0,(i===2||i===9||i===3||i===6)&&(i=aa.current,i!==null&&i.tag===13&&(i.flags|=16384))),rm(t,e)):Cl(t)}function Cl(e){var t=e;do{if((t.flags&32768)!==0){rm(t,An);return}e=t.return;var a=tx(t.alternate,t,ln);if(a!==null){Qe=a;return}if(t=t.sibling,t!==null){Qe=t;return}Qe=t=e}while(t!==null);wt===0&&(wt=5)}function rm(e,t){do{var a=ax(e.alternate,e);if(a!==null){a.flags&=32767,Qe=a;return}if(a=e.return,a!==null&&(a.flags|=32768,a.subtreeFlags=0,a.deletions=null),!t&&(e=e.sibling,e!==null)){Qe=e;return}Qe=e=a}while(e!==null);wt=6,Qe=null}function im(e,t,a,i,u,d,y,T,Z){e.cancelPendingCommit=null;do Al();while(Ot!==0);if((at&6)!==0)throw Error(l(327));if(t!==null){if(t===e.current)throw Error(l(177));if(d=t.lanes|t.childLanes,d|=cc,Gb(e,a,d,y,T,Z),e===ht&&(Qe=ht=null,Ke=0),ai=t,On=e,sn=a,vu=d,bu=u,Fp=i,(t.subtreeFlags&10256)!==0||(t.flags&10256)!==0?(e.callbackNode=null,e.callbackPriority=0,px(Ye,function(){return um(),null})):(e.callbackNode=null,e.callbackPriority=0),i=(t.flags&13878)!==0,(t.subtreeFlags&13878)!==0||i){i=V.T,V.T=null,u=q.p,q.p=2,y=at,at|=4;try{nx(e,t,a)}finally{at=y,q.p=u,V.T=i}}Ot=1,om(),lm(),sm()}}function om(){if(Ot===1){Ot=0;var e=On,t=ai,a=(t.flags&13878)!==0;if((t.subtreeFlags&13878)!==0||a){a=V.T,V.T=null;var i=q.p;q.p=2;var u=at;at|=4;try{Zp(t,e);var d=Ru,y=Xf(e.containerInfo),T=d.focusedElem,Z=d.selectionRange;if(y!==T&&T&&T.ownerDocument&&If(T.ownerDocument.documentElement,T)){if(Z!==null&&rc(T)){var J=Z.start,ce=Z.end;if(ce===void 0&&(ce=J),"selectionStart"in T)T.selectionStart=J,T.selectionEnd=Math.min(ce,T.value.length);else{var fe=T.ownerDocument||document,te=fe&&fe.defaultView||window;if(te.getSelection){var oe=te.getSelection(),Ce=T.textContent.length,Ue=Math.min(Z.start,Ce),dt=Z.end===void 0?Ue:Math.min(Z.end,Ce);!oe.extend&&Ue>dt&&(y=dt,dt=Ue,Ue=y);var F=Yf(T,Ue),G=Yf(T,dt);if(F&&G&&(oe.rangeCount!==1||oe.anchorNode!==F.node||oe.anchorOffset!==F.offset||oe.focusNode!==G.node||oe.focusOffset!==G.offset)){var P=fe.createRange();P.setStart(F.node,F.offset),oe.removeAllRanges(),Ue>dt?(oe.addRange(P),oe.extend(G.node,G.offset)):(P.setEnd(G.node,G.offset),oe.addRange(P))}}}}for(fe=[],oe=T;oe=oe.parentNode;)oe.nodeType===1&&fe.push({element:oe,left:oe.scrollLeft,top:oe.scrollTop});for(typeof T.focus=="function"&&T.focus(),T=0;T<fe.length;T++){var de=fe[T];de.element.scrollLeft=de.left,de.element.scrollTop=de.top}}Zl=!!ju,Ru=ju=null}finally{at=u,q.p=i,V.T=a}}e.current=t,Ot=2}}function lm(){if(Ot===2){Ot=0;var e=On,t=ai,a=(t.flags&8772)!==0;if((t.subtreeFlags&8772)!==0||a){a=V.T,V.T=null;var i=q.p;q.p=2;var u=at;at|=4;try{Dp(e,t.alternate,t)}finally{at=u,q.p=i,V.T=a}}Ot=3}}function sm(){if(Ot===4||Ot===3){Ot=0,be();var e=On,t=ai,a=sn,i=Fp;(t.subtreeFlags&10256)!==0||(t.flags&10256)!==0?Ot=5:(Ot=0,ai=On=null,cm(e,e.pendingLanes));var u=e.pendingLanes;if(u===0&&(Nn=null),Hs(a),t=t.stateNode,Rt&&typeof Rt.onCommitFiberRoot=="function")try{Rt.onCommitFiberRoot(ft,t,void 0,(t.current.flags&128)===128)}catch{}if(i!==null){t=V.T,u=q.p,q.p=2,V.T=null;try{for(var d=e.onRecoverableError,y=0;y<i.length;y++){var T=i[y];d(T.value,{componentStack:T.stack})}}finally{V.T=t,q.p=u}}(sn&3)!==0&&Al(),La(e),u=e.pendingLanes,(a&261930)!==0&&(u&42)!==0?e===yu?so++:(so=0,yu=e):so=0,co(0)}}function cm(e,t){(e.pooledCacheLanes&=t)===0&&(t=e.pooledCache,t!=null&&(e.pooledCache=null,Gi(t)))}function Al(){return om(),lm(),sm(),um()}function um(){if(Ot!==5)return!1;var e=On,t=vu;vu=0;var a=Hs(sn),i=V.T,u=q.p;try{q.p=32>a?32:a,V.T=null,a=bu,bu=null;var d=On,y=sn;if(Ot=0,ai=On=null,sn=0,(at&6)!==0)throw Error(l(331));var T=at;if(at|=4,Ip(d.current),qp(d,d.current,y,a),at=T,co(0,!1),Rt&&typeof Rt.onPostCommitFiberRoot=="function")try{Rt.onPostCommitFiberRoot(ft,d)}catch{}return!0}finally{q.p=u,V.T=i,cm(e,t)}}function dm(e,t,a){t=ga(a,t),t=Jc(e.stateNode,t,2),e=kn(e,t,2),e!==null&&(Ti(e,2),La(e))}function lt(e,t,a){if(e.tag===3)dm(e,e,a);else for(;t!==null;){if(t.tag===3){dm(t,e,a);break}else if(t.tag===1){var i=t.stateNode;if(typeof t.type.getDerivedStateFromError=="function"||typeof i.componentDidCatch=="function"&&(Nn===null||!Nn.has(i))){e=ga(a,e),a=fp(2),i=kn(t,a,2),i!==null&&(hp(a,i,t,e),Ti(i,2),La(i));break}}t=t.return}}function _u(e,t,a){var i=e.pingCache;if(i===null){i=e.pingCache=new ox;var u=new Set;i.set(t,u)}else u=i.get(t),u===void 0&&(u=new Set,i.set(t,u));u.has(a)||(pu=!0,u.add(a),e=dx.bind(null,e,t,a),t.then(e,e))}function dx(e,t,a){var i=e.pingCache;i!==null&&i.delete(t),e.pingedLanes|=e.suspendedLanes&a,e.warmLanes&=~a,ht===e&&(Ke&a)===a&&(wt===4||wt===3&&(Ke&62914560)===Ke&&300>_e()-_l?(at&2)===0&&ni(e,0):mu|=a,ti===Ke&&(ti=0)),La(e)}function fm(e,t){t===0&&(t=of()),e=ir(e,t),e!==null&&(Ti(e,t),La(e))}function fx(e){var t=e.memoizedState,a=0;t!==null&&(a=t.retryLane),fm(e,a)}function hx(e,t){var a=0;switch(e.tag){case 31:case 13:var i=e.stateNode,u=e.memoizedState;u!==null&&(a=u.retryLane);break;case 19:i=e.stateNode;break;case 22:i=e.stateNode._retryCache;break;default:throw Error(l(314))}i!==null&&i.delete(t),fm(e,a)}function px(e,t){return pe(e,t)}var Tl=null,ii=null,Su=!1,Nl=!1,ku=!1,Rn=0;function La(e){e!==ii&&e.next===null&&(ii===null?Tl=ii=e:ii=ii.next=e),Nl=!0,Su||(Su=!0,gx())}function co(e,t){if(!ku&&Nl){ku=!0;do for(var a=!1,i=Tl;i!==null;){if(e!==0){var u=i.pendingLanes;if(u===0)var d=0;else{var y=i.suspendedLanes,T=i.pingedLanes;d=(1<<31-bt(42|e)+1)-1,d&=u&~(y&~T),d=d&201326741?d&201326741|1:d?d|2:0}d!==0&&(a=!0,gm(i,d))}else d=Ke,d=Mo(i,i===ht?d:0,i.cancelPendingCommit!==null||i.timeoutHandle!==-1),(d&3)===0||Ai(i,d)||(a=!0,gm(i,d));i=i.next}while(a);ku=!1}}function mx(){hm()}function hm(){Nl=Su=!1;var e=0;Rn!==0&&zx()&&(e=Rn);for(var t=_e(),a=null,i=Tl;i!==null;){var u=i.next,d=pm(i,t);d===0?(i.next=null,a===null?Tl=u:a.next=u,u===null&&(ii=a)):(a=i,(e!==0||(d&3)!==0)&&(Nl=!0)),i=u}Ot!==0&&Ot!==5||co(e),Rn!==0&&(Rn=0)}function pm(e,t){for(var a=e.suspendedLanes,i=e.pingedLanes,u=e.expirationTimes,d=e.pendingLanes&-62914561;0<d;){var y=31-bt(d),T=1<<y,Z=u[y];Z===-1?((T&a)===0||(T&i)!==0)&&(u[y]=qb(T,t)):Z<=t&&(e.expiredLanes|=T),d&=~T}if(t=ht,a=Ke,a=Mo(e,e===t?a:0,e.cancelPendingCommit!==null||e.timeoutHandle!==-1),i=e.callbackNode,a===0||e===t&&(ot===2||ot===9)||e.cancelPendingCommit!==null)return i!==null&&i!==null&&me(i),e.callbackNode=null,e.callbackPriority=0;if((a&3)===0||Ai(e,a)){if(t=a&-a,t===e.callbackPriority)return t;switch(i!==null&&me(i),Hs(a)){case 2:case 8:a=it;break;case 32:a=Ye;break;case 268435456:a=mn;break;default:a=Ye}return i=mm.bind(null,e),a=pe(a,i),e.callbackPriority=t,e.callbackNode=a,t}return i!==null&&i!==null&&me(i),e.callbackPriority=2,e.callbackNode=null,2}function mm(e,t){if(Ot!==0&&Ot!==5)return e.callbackNode=null,e.callbackPriority=0,null;var a=e.callbackNode;if(Al()&&e.callbackNode!==a)return null;var i=Ke;return i=Mo(e,e===ht?i:0,e.cancelPendingCommit!==null||e.timeoutHandle!==-1),i===0?null:(Pp(e,i,t),pm(e,_e()),e.callbackNode!=null&&e.callbackNode===a?mm.bind(null,e):null)}function gm(e,t){if(Al())return null;Pp(e,t,!0)}function gx(){Ax(function(){(at&6)!==0?pe(De,mx):hm()})}function Eu(){if(Rn===0){var e=Yr;e===0&&(e=Er,Er<<=1,(Er&261888)===0&&(Er=256)),Rn=e}return Rn}function vm(e){return e==null||typeof e=="symbol"||typeof e=="boolean"?null:typeof e=="function"?e:Lo(""+e)}function bm(e,t){var a=t.ownerDocument.createElement("input");return a.name=t.name,a.value=t.value,e.id&&a.setAttribute("form",e.id),t.parentNode.insertBefore(a,t),e=new FormData(e),a.parentNode.removeChild(a),e}function vx(e,t,a,i,u){if(t==="submit"&&a&&a.stateNode===u){var d=vm((u[Xt]||null).action),y=i.submitter;y&&(t=(t=y[Xt]||null)?vm(t.formAction):y.getAttribute("formAction"),t!==null&&(d=t,y=null));var T=new qo("action","action",null,i,u);e.push({event:T,listeners:[{instance:null,listener:function(){if(i.defaultPrevented){if(Rn!==0){var Z=y?bm(u,y):new FormData(u);Ic(a,{pending:!0,data:Z,method:u.method,action:d},null,Z)}}else typeof d=="function"&&(T.preventDefault(),Z=y?bm(u,y):new FormData(u),Ic(a,{pending:!0,data:Z,method:u.method,action:d},d,Z))},currentTarget:u}]})}}for(var zu=0;zu<sc.length;zu++){var Cu=sc[zu],bx=Cu.toLowerCase(),yx=Cu[0].toUpperCase()+Cu.slice(1);Aa(bx,"on"+yx)}Aa(Kf,"onAnimationEnd"),Aa(Pf,"onAnimationIteration"),Aa(Jf,"onAnimationStart"),Aa("dblclick","onDoubleClick"),Aa("focusin","onFocus"),Aa("focusout","onBlur"),Aa(Dy,"onTransitionRun"),Aa(By,"onTransitionStart"),Aa(Uy,"onTransitionCancel"),Aa(Wf,"onTransitionEnd"),Nr("onMouseEnter",["mouseout","mouseover"]),Nr("onMouseLeave",["mouseout","mouseover"]),Nr("onPointerEnter",["pointerout","pointerover"]),Nr("onPointerLeave",["pointerout","pointerover"]),tr("onChange","change click focusin focusout input keydown keyup selectionchange".split(" ")),tr("onSelect","focusout contextmenu dragend focusin keydown keyup mousedown mouseup selectionchange".split(" ")),tr("onBeforeInput",["compositionend","keypress","textInput","paste"]),tr("onCompositionEnd","compositionend focusout keydown keypress keyup mousedown".split(" ")),tr("onCompositionStart","compositionstart focusout keydown keypress keyup mousedown".split(" ")),tr("onCompositionUpdate","compositionupdate focusout keydown keypress keyup mousedown".split(" "));var uo="abort canplay canplaythrough durationchange emptied encrypted ended error loadeddata loadedmetadata loadstart pause play playing progress ratechange resize seeked seeking stalled suspend timeupdate volumechange waiting".split(" "),xx=new Set("beforetoggle cancel close invalid load scroll scrollend toggle".split(" ").concat(uo));function ym(e,t){t=(t&4)!==0;for(var a=0;a<e.length;a++){var i=e[a],u=i.event;i=i.listeners;e:{var d=void 0;if(t)for(var y=i.length-1;0<=y;y--){var T=i[y],Z=T.instance,J=T.currentTarget;if(T=T.listener,Z!==d&&u.isPropagationStopped())break e;d=T,u.currentTarget=J;try{d(u)}catch(ce){Io(ce)}u.currentTarget=null,d=Z}else for(y=0;y<i.length;y++){if(T=i[y],Z=T.instance,J=T.currentTarget,T=T.listener,Z!==d&&u.isPropagationStopped())break e;d=T,u.currentTarget=J;try{d(u)}catch(ce){Io(ce)}u.currentTarget=null,d=Z}}}}function Fe(e,t){var a=t[Zs];a===void 0&&(a=t[Zs]=new Set);var i=e+"__bubble";a.has(i)||(xm(t,e,2,!1),a.add(i))}function Au(e,t,a){var i=0;t&&(i|=4),xm(a,e,i,t)}var Ol="_reactListening"+Math.random().toString(36).slice(2);function Tu(e){if(!e[Ol]){e[Ol]=!0,hf.forEach(function(a){a!=="selectionchange"&&(xx.has(a)||Au(a,!1,e),Au(a,!0,e))});var t=e.nodeType===9?e:e.ownerDocument;t===null||t[Ol]||(t[Ol]=!0,Au("selectionchange",!1,t))}}function xm(e,t,a,i){switch(Km(t)){case 2:var u=Fx;break;case 8:u=Kx;break;default:u=Yu}a=u.bind(null,t,a,e),u=void 0,!Ks||t!=="touchstart"&&t!=="touchmove"&&t!=="wheel"||(u=!0),i?u!==void 0?e.addEventListener(t,a,{capture:!0,passive:u}):e.addEventListener(t,a,!0):u!==void 0?e.addEventListener(t,a,{passive:u}):e.addEventListener(t,a,!1)}function Nu(e,t,a,i,u){var d=i;if((t&1)===0&&(t&2)===0&&i!==null)e:for(;;){if(i===null)return;var y=i.tag;if(y===3||y===4){var T=i.stateNode.containerInfo;if(T===u)break;if(y===4)for(y=i.return;y!==null;){var Z=y.tag;if((Z===3||Z===4)&&y.stateNode.containerInfo===u)return;y=y.return}for(;T!==null;){if(y=Cr(T),y===null)return;if(Z=y.tag,Z===5||Z===6||Z===26||Z===27){i=d=y;continue e}T=T.parentNode}}i=i.return}Ef(function(){var J=d,ce=Qs(a),fe=[];e:{var te=$f.get(e);if(te!==void 0){var oe=qo,Ce=e;switch(e){case"keypress":if(Zo(a)===0)break e;case"keydown":case"keyup":oe=hy;break;case"focusin":Ce="focus",oe=$s;break;case"focusout":Ce="blur",oe=$s;break;case"beforeblur":case"afterblur":oe=$s;break;case"click":if(a.button===2)break e;case"auxclick":case"dblclick":case"mousedown":case"mousemove":case"mouseup":case"mouseout":case"mouseover":case"contextmenu":oe=Af;break;case"drag":case"dragend":case"dragenter":case"dragexit":case"dragleave":case"dragover":case"dragstart":case"drop":oe=ty;break;case"touchcancel":case"touchend":case"touchmove":case"touchstart":oe=gy;break;case Kf:case Pf:case Jf:oe=ry;break;case Wf:oe=by;break;case"scroll":case"scrollend":oe=$b;break;case"wheel":oe=xy;break;case"copy":case"cut":case"paste":oe=oy;break;case"gotpointercapture":case"lostpointercapture":case"pointercancel":case"pointerdown":case"pointermove":case"pointerout":case"pointerover":case"pointerup":oe=Nf;break;case"toggle":case"beforetoggle":oe=_y}var Ue=(t&4)!==0,dt=!Ue&&(e==="scroll"||e==="scrollend"),F=Ue?te!==null?te+"Capture":null:te;Ue=[];for(var G=J,P;G!==null;){var de=G;if(P=de.stateNode,de=de.tag,de!==5&&de!==26&&de!==27||P===null||F===null||(de=ji(G,F),de!=null&&Ue.push(fo(G,de,P))),dt)break;G=G.return}0<Ue.length&&(te=new oe(te,Ce,null,a,ce),fe.push({event:te,listeners:Ue}))}}if((t&7)===0){e:{if(te=e==="mouseover"||e==="pointerover",oe=e==="mouseout"||e==="pointerout",te&&a!==Xs&&(Ce=a.relatedTarget||a.fromElement)&&(Cr(Ce)||Ce[zr]))break e;if((oe||te)&&(te=ce.window===ce?ce:(te=ce.ownerDocument)?te.defaultView||te.parentWindow:window,oe?(Ce=a.relatedTarget||a.toElement,oe=J,Ce=Ce?Cr(Ce):null,Ce!==null&&(dt=c(Ce),Ue=Ce.tag,Ce!==dt||Ue!==5&&Ue!==27&&Ue!==6)&&(Ce=null)):(oe=null,Ce=J),oe!==Ce)){if(Ue=Af,de="onMouseLeave",F="onMouseEnter",G="mouse",(e==="pointerout"||e==="pointerover")&&(Ue=Nf,de="onPointerLeave",F="onPointerEnter",G="pointer"),dt=oe==null?te:Oi(oe),P=Ce==null?te:Oi(Ce),te=new Ue(de,G+"leave",oe,a,ce),te.target=dt,te.relatedTarget=P,de=null,Cr(ce)===J&&(Ue=new Ue(F,G+"enter",Ce,a,ce),Ue.target=P,Ue.relatedTarget=dt,de=Ue),dt=de,oe&&Ce)t:{for(Ue=wx,F=oe,G=Ce,P=0,de=F;de;de=Ue(de))P++;de=0;for(var Be=G;Be;Be=Ue(Be))de++;for(;0<P-de;)F=Ue(F),P--;for(;0<de-P;)G=Ue(G),de--;for(;P--;){if(F===G||G!==null&&F===G.alternate){Ue=F;break t}F=Ue(F),G=Ue(G)}Ue=null}else Ue=null;oe!==null&&wm(fe,te,oe,Ue,!1),Ce!==null&&dt!==null&&wm(fe,dt,Ce,Ue,!0)}}e:{if(te=J?Oi(J):window,oe=te.nodeName&&te.nodeName.toLowerCase(),oe==="select"||oe==="input"&&te.type==="file")var $e=Lf;else if(Bf(te))if(Hf)$e=jy;else{$e=Ny;var Oe=Ty}else oe=te.nodeName,!oe||oe.toLowerCase()!=="input"||te.type!=="checkbox"&&te.type!=="radio"?J&&Is(J.elementType)&&($e=Lf):$e=Oy;if($e&&($e=$e(e,J))){Uf(fe,$e,a,ce);break e}Oe&&Oe(e,te,J),e==="focusout"&&J&&te.type==="number"&&J.memoizedProps.value!=null&&Ys(te,"number",te.value)}switch(Oe=J?Oi(J):window,e){case"focusin":(Bf(Oe)||Oe.contentEditable==="true")&&(Br=Oe,ic=J,Zi=null);break;case"focusout":Zi=ic=Br=null;break;case"mousedown":oc=!0;break;case"contextmenu":case"mouseup":case"dragend":oc=!1,Qf(fe,a,ce);break;case"selectionchange":if(My)break;case"keydown":case"keyup":Qf(fe,a,ce)}var Ge;if(tc)e:{switch(e){case"compositionstart":var Pe="onCompositionStart";break e;case"compositionend":Pe="onCompositionEnd";break e;case"compositionupdate":Pe="onCompositionUpdate";break e}Pe=void 0}else Dr?Mf(e,a)&&(Pe="onCompositionEnd"):e==="keydown"&&a.keyCode===229&&(Pe="onCompositionStart");Pe&&(Of&&a.locale!=="ko"&&(Dr||Pe!=="onCompositionStart"?Pe==="onCompositionEnd"&&Dr&&(Ge=zf()):(vn=ce,Ps="value"in vn?vn.value:vn.textContent,Dr=!0)),Oe=jl(J,Pe),0<Oe.length&&(Pe=new Tf(Pe,e,null,a,ce),fe.push({event:Pe,listeners:Oe}),Ge?Pe.data=Ge:(Ge=Df(a),Ge!==null&&(Pe.data=Ge)))),(Ge=ky?Ey(e,a):zy(e,a))&&(Pe=jl(J,"onBeforeInput"),0<Pe.length&&(Oe=new Tf("onBeforeInput","beforeinput",null,a,ce),fe.push({event:Oe,listeners:Pe}),Oe.data=Ge)),vx(fe,e,J,a,ce)}ym(fe,t)})}function fo(e,t,a){return{instance:e,listener:t,currentTarget:a}}function jl(e,t){for(var a=t+"Capture",i=[];e!==null;){var u=e,d=u.stateNode;if(u=u.tag,u!==5&&u!==26&&u!==27||d===null||(u=ji(e,a),u!=null&&i.unshift(fo(e,u,d)),u=ji(e,t),u!=null&&i.push(fo(e,u,d))),e.tag===3)return i;e=e.return}return[]}function wx(e){if(e===null)return null;do e=e.return;while(e&&e.tag!==5&&e.tag!==27);return e||null}function wm(e,t,a,i,u){for(var d=t._reactName,y=[];a!==null&&a!==i;){var T=a,Z=T.alternate,J=T.stateNode;if(T=T.tag,Z!==null&&Z===i)break;T!==5&&T!==26&&T!==27||J===null||(Z=J,u?(J=ji(a,d),J!=null&&y.unshift(fo(a,J,Z))):u||(J=ji(a,d),J!=null&&y.push(fo(a,J,Z)))),a=a.return}y.length!==0&&e.push({event:t,listeners:y})}var _x=/\r\n?/g,Sx=/\u0000|\uFFFD/g;function _m(e){return(typeof e=="string"?e:""+e).replace(_x,`
`).replace(Sx,"")}function Sm(e,t){return t=_m(t),_m(e)===t}function ut(e,t,a,i,u,d){switch(a){case"children":typeof i=="string"?t==="body"||t==="textarea"&&i===""||jr(e,i):(typeof i=="number"||typeof i=="bigint")&&t!=="body"&&jr(e,""+i);break;case"className":Bo(e,"class",i);break;case"tabIndex":Bo(e,"tabindex",i);break;case"dir":case"role":case"viewBox":case"width":case"height":Bo(e,a,i);break;case"style":Sf(e,i,d);break;case"data":if(t!=="object"){Bo(e,"data",i);break}case"src":case"href":if(i===""&&(t!=="a"||a!=="href")){e.removeAttribute(a);break}if(i==null||typeof i=="function"||typeof i=="symbol"||typeof i=="boolean"){e.removeAttribute(a);break}i=Lo(""+i),e.setAttribute(a,i);break;case"action":case"formAction":if(typeof i=="function"){e.setAttribute(a,"javascript:throw new Error('A React form was unexpectedly submitted. If you called form.submit() manually, consider using form.requestSubmit() instead. If you\\'re trying to use event.stopPropagation() in a submit event handler, consider also calling event.preventDefault().')");break}else typeof d=="function"&&(a==="formAction"?(t!=="input"&&ut(e,t,"name",u.name,u,null),ut(e,t,"formEncType",u.formEncType,u,null),ut(e,t,"formMethod",u.formMethod,u,null),ut(e,t,"formTarget",u.formTarget,u,null)):(ut(e,t,"encType",u.encType,u,null),ut(e,t,"method",u.method,u,null),ut(e,t,"target",u.target,u,null)));if(i==null||typeof i=="symbol"||typeof i=="boolean"){e.removeAttribute(a);break}i=Lo(""+i),e.setAttribute(a,i);break;case"onClick":i!=null&&(e.onclick=Xa);break;case"onScroll":i!=null&&Fe("scroll",e);break;case"onScrollEnd":i!=null&&Fe("scrollend",e);break;case"dangerouslySetInnerHTML":if(i!=null){if(typeof i!="object"||!("__html"in i))throw Error(l(61));if(a=i.__html,a!=null){if(u.children!=null)throw Error(l(60));e.innerHTML=a}}break;case"multiple":e.multiple=i&&typeof i!="function"&&typeof i!="symbol";break;case"muted":e.muted=i&&typeof i!="function"&&typeof i!="symbol";break;case"suppressContentEditableWarning":case"suppressHydrationWarning":case"defaultValue":case"defaultChecked":case"innerHTML":case"ref":break;case"autoFocus":break;case"xlinkHref":if(i==null||typeof i=="function"||typeof i=="boolean"||typeof i=="symbol"){e.removeAttribute("xlink:href");break}a=Lo(""+i),e.setAttributeNS("http://www.w3.org/1999/xlink","xlink:href",a);break;case"contentEditable":case"spellCheck":case"draggable":case"value":case"autoReverse":case"externalResourcesRequired":case"focusable":case"preserveAlpha":i!=null&&typeof i!="function"&&typeof i!="symbol"?e.setAttribute(a,""+i):e.removeAttribute(a);break;case"inert":case"allowFullScreen":case"async":case"autoPlay":case"controls":case"default":case"defer":case"disabled":case"disablePictureInPicture":case"disableRemotePlayback":case"formNoValidate":case"hidden":case"loop":case"noModule":case"noValidate":case"open":case"playsInline":case"readOnly":case"required":case"reversed":case"scoped":case"seamless":case"itemScope":i&&typeof i!="function"&&typeof i!="symbol"?e.setAttribute(a,""):e.removeAttribute(a);break;case"capture":case"download":i===!0?e.setAttribute(a,""):i!==!1&&i!=null&&typeof i!="function"&&typeof i!="symbol"?e.setAttribute(a,i):e.removeAttribute(a);break;case"cols":case"rows":case"size":case"span":i!=null&&typeof i!="function"&&typeof i!="symbol"&&!isNaN(i)&&1<=i?e.setAttribute(a,i):e.removeAttribute(a);break;case"rowSpan":case"start":i==null||typeof i=="function"||typeof i=="symbol"||isNaN(i)?e.removeAttribute(a):e.setAttribute(a,i);break;case"popover":Fe("beforetoggle",e),Fe("toggle",e),Do(e,"popover",i);break;case"xlinkActuate":Ia(e,"http://www.w3.org/1999/xlink","xlink:actuate",i);break;case"xlinkArcrole":Ia(e,"http://www.w3.org/1999/xlink","xlink:arcrole",i);break;case"xlinkRole":Ia(e,"http://www.w3.org/1999/xlink","xlink:role",i);break;case"xlinkShow":Ia(e,"http://www.w3.org/1999/xlink","xlink:show",i);break;case"xlinkTitle":Ia(e,"http://www.w3.org/1999/xlink","xlink:title",i);break;case"xlinkType":Ia(e,"http://www.w3.org/1999/xlink","xlink:type",i);break;case"xmlBase":Ia(e,"http://www.w3.org/XML/1998/namespace","xml:base",i);break;case"xmlLang":Ia(e,"http://www.w3.org/XML/1998/namespace","xml:lang",i);break;case"xmlSpace":Ia(e,"http://www.w3.org/XML/1998/namespace","xml:space",i);break;case"is":Do(e,"is",i);break;case"innerText":case"textContent":break;default:(!(2<a.length)||a[0]!=="o"&&a[0]!=="O"||a[1]!=="n"&&a[1]!=="N")&&(a=Jb.get(a)||a,Do(e,a,i))}}function Ou(e,t,a,i,u,d){switch(a){case"style":Sf(e,i,d);break;case"dangerouslySetInnerHTML":if(i!=null){if(typeof i!="object"||!("__html"in i))throw Error(l(61));if(a=i.__html,a!=null){if(u.children!=null)throw Error(l(60));e.innerHTML=a}}break;case"children":typeof i=="string"?jr(e,i):(typeof i=="number"||typeof i=="bigint")&&jr(e,""+i);break;case"onScroll":i!=null&&Fe("scroll",e);break;case"onScrollEnd":i!=null&&Fe("scrollend",e);break;case"onClick":i!=null&&(e.onclick=Xa);break;case"suppressContentEditableWarning":case"suppressHydrationWarning":case"innerHTML":case"ref":break;case"innerText":case"textContent":break;default:if(!pf.hasOwnProperty(a))e:{if(a[0]==="o"&&a[1]==="n"&&(u=a.endsWith("Capture"),t=a.slice(2,u?a.length-7:void 0),d=e[Xt]||null,d=d!=null?d[a]:null,typeof d=="function"&&e.removeEventListener(t,d,u),typeof i=="function")){typeof d!="function"&&d!==null&&(a in e?e[a]=null:e.hasAttribute(a)&&e.removeAttribute(a)),e.addEventListener(t,i,u);break e}a in e?e[a]=i:i===!0?e.setAttribute(a,""):Do(e,a,i)}}}function Vt(e,t,a){switch(t){case"div":case"span":case"svg":case"path":case"a":case"g":case"p":case"li":break;case"img":Fe("error",e),Fe("load",e);var i=!1,u=!1,d;for(d in a)if(a.hasOwnProperty(d)){var y=a[d];if(y!=null)switch(d){case"src":i=!0;break;case"srcSet":u=!0;break;case"children":case"dangerouslySetInnerHTML":throw Error(l(137,t));default:ut(e,t,d,y,a,null)}}u&&ut(e,t,"srcSet",a.srcSet,a,null),i&&ut(e,t,"src",a.src,a,null);return;case"input":Fe("invalid",e);var T=d=y=u=null,Z=null,J=null;for(i in a)if(a.hasOwnProperty(i)){var ce=a[i];if(ce!=null)switch(i){case"name":u=ce;break;case"type":y=ce;break;case"checked":Z=ce;break;case"defaultChecked":J=ce;break;case"value":d=ce;break;case"defaultValue":T=ce;break;case"children":case"dangerouslySetInnerHTML":if(ce!=null)throw Error(l(137,t));break;default:ut(e,t,i,ce,a,null)}}yf(e,d,T,Z,J,y,u,!1);return;case"select":Fe("invalid",e),i=y=d=null;for(u in a)if(a.hasOwnProperty(u)&&(T=a[u],T!=null))switch(u){case"value":d=T;break;case"defaultValue":y=T;break;case"multiple":i=T;default:ut(e,t,u,T,a,null)}t=d,a=y,e.multiple=!!i,t!=null?Or(e,!!i,t,!1):a!=null&&Or(e,!!i,a,!0);return;case"textarea":Fe("invalid",e),d=u=i=null;for(y in a)if(a.hasOwnProperty(y)&&(T=a[y],T!=null))switch(y){case"value":i=T;break;case"defaultValue":u=T;break;case"children":d=T;break;case"dangerouslySetInnerHTML":if(T!=null)throw Error(l(91));break;default:ut(e,t,y,T,a,null)}wf(e,i,u,d);return;case"option":for(Z in a)if(a.hasOwnProperty(Z)&&(i=a[Z],i!=null))switch(Z){case"selected":e.selected=i&&typeof i!="function"&&typeof i!="symbol";break;default:ut(e,t,Z,i,a,null)}return;case"dialog":Fe("beforetoggle",e),Fe("toggle",e),Fe("cancel",e),Fe("close",e);break;case"iframe":case"object":Fe("load",e);break;case"video":case"audio":for(i=0;i<uo.length;i++)Fe(uo[i],e);break;case"image":Fe("error",e),Fe("load",e);break;case"details":Fe("toggle",e);break;case"embed":case"source":case"link":Fe("error",e),Fe("load",e);case"area":case"base":case"br":case"col":case"hr":case"keygen":case"meta":case"param":case"track":case"wbr":case"menuitem":for(J in a)if(a.hasOwnProperty(J)&&(i=a[J],i!=null))switch(J){case"children":case"dangerouslySetInnerHTML":throw Error(l(137,t));default:ut(e,t,J,i,a,null)}return;default:if(Is(t)){for(ce in a)a.hasOwnProperty(ce)&&(i=a[ce],i!==void 0&&Ou(e,t,ce,i,a,void 0));return}}for(T in a)a.hasOwnProperty(T)&&(i=a[T],i!=null&&ut(e,t,T,i,a,null))}function kx(e,t,a,i){switch(t){case"div":case"span":case"svg":case"path":case"a":case"g":case"p":case"li":break;case"input":var u=null,d=null,y=null,T=null,Z=null,J=null,ce=null;for(oe in a){var fe=a[oe];if(a.hasOwnProperty(oe)&&fe!=null)switch(oe){case"checked":break;case"value":break;case"defaultValue":Z=fe;default:i.hasOwnProperty(oe)||ut(e,t,oe,null,i,fe)}}for(var te in i){var oe=i[te];if(fe=a[te],i.hasOwnProperty(te)&&(oe!=null||fe!=null))switch(te){case"type":d=oe;break;case"name":u=oe;break;case"checked":J=oe;break;case"defaultChecked":ce=oe;break;case"value":y=oe;break;case"defaultValue":T=oe;break;case"children":case"dangerouslySetInnerHTML":if(oe!=null)throw Error(l(137,t));break;default:oe!==fe&&ut(e,t,te,oe,i,fe)}}Gs(e,y,T,Z,J,ce,d,u);return;case"select":oe=y=T=te=null;for(d in a)if(Z=a[d],a.hasOwnProperty(d)&&Z!=null)switch(d){case"value":break;case"multiple":oe=Z;default:i.hasOwnProperty(d)||ut(e,t,d,null,i,Z)}for(u in i)if(d=i[u],Z=a[u],i.hasOwnProperty(u)&&(d!=null||Z!=null))switch(u){case"value":te=d;break;case"defaultValue":T=d;break;case"multiple":y=d;default:d!==Z&&ut(e,t,u,d,i,Z)}t=T,a=y,i=oe,te!=null?Or(e,!!a,te,!1):!!i!=!!a&&(t!=null?Or(e,!!a,t,!0):Or(e,!!a,a?[]:"",!1));return;case"textarea":oe=te=null;for(T in a)if(u=a[T],a.hasOwnProperty(T)&&u!=null&&!i.hasOwnProperty(T))switch(T){case"value":break;case"children":break;default:ut(e,t,T,null,i,u)}for(y in i)if(u=i[y],d=a[y],i.hasOwnProperty(y)&&(u!=null||d!=null))switch(y){case"value":te=u;break;case"defaultValue":oe=u;break;case"children":break;case"dangerouslySetInnerHTML":if(u!=null)throw Error(l(91));break;default:u!==d&&ut(e,t,y,u,i,d)}xf(e,te,oe);return;case"option":for(var Ce in a)if(te=a[Ce],a.hasOwnProperty(Ce)&&te!=null&&!i.hasOwnProperty(Ce))switch(Ce){case"selected":e.selected=!1;break;default:ut(e,t,Ce,null,i,te)}for(Z in i)if(te=i[Z],oe=a[Z],i.hasOwnProperty(Z)&&te!==oe&&(te!=null||oe!=null))switch(Z){case"selected":e.selected=te&&typeof te!="function"&&typeof te!="symbol";break;default:ut(e,t,Z,te,i,oe)}return;case"img":case"link":case"area":case"base":case"br":case"col":case"embed":case"hr":case"keygen":case"meta":case"param":case"source":case"track":case"wbr":case"menuitem":for(var Ue in a)te=a[Ue],a.hasOwnProperty(Ue)&&te!=null&&!i.hasOwnProperty(Ue)&&ut(e,t,Ue,null,i,te);for(J in i)if(te=i[J],oe=a[J],i.hasOwnProperty(J)&&te!==oe&&(te!=null||oe!=null))switch(J){case"children":case"dangerouslySetInnerHTML":if(te!=null)throw Error(l(137,t));break;default:ut(e,t,J,te,i,oe)}return;default:if(Is(t)){for(var dt in a)te=a[dt],a.hasOwnProperty(dt)&&te!==void 0&&!i.hasOwnProperty(dt)&&Ou(e,t,dt,void 0,i,te);for(ce in i)te=i[ce],oe=a[ce],!i.hasOwnProperty(ce)||te===oe||te===void 0&&oe===void 0||Ou(e,t,ce,te,i,oe);return}}for(var F in a)te=a[F],a.hasOwnProperty(F)&&te!=null&&!i.hasOwnProperty(F)&&ut(e,t,F,null,i,te);for(fe in i)te=i[fe],oe=a[fe],!i.hasOwnProperty(fe)||te===oe||te==null&&oe==null||ut(e,t,fe,te,i,oe)}function km(e){switch(e){case"css":case"script":case"font":case"img":case"image":case"input":case"link":return!0;default:return!1}}function Ex(){if(typeof performance.getEntriesByType=="function"){for(var e=0,t=0,a=performance.getEntriesByType("resource"),i=0;i<a.length;i++){var u=a[i],d=u.transferSize,y=u.initiatorType,T=u.duration;if(d&&T&&km(y)){for(y=0,T=u.responseEnd,i+=1;i<a.length;i++){var Z=a[i],J=Z.startTime;if(J>T)break;var ce=Z.transferSize,fe=Z.initiatorType;ce&&km(fe)&&(Z=Z.responseEnd,y+=ce*(Z<T?1:(T-J)/(Z-J)))}if(--i,t+=8*(d+y)/(u.duration/1e3),e++,10<e)break}}if(0<e)return t/e/1e6}return navigator.connection&&(e=navigator.connection.downlink,typeof e=="number")?e:5}var ju=null,Ru=null;function Rl(e){return e.nodeType===9?e:e.ownerDocument}function Em(e){switch(e){case"http://www.w3.org/2000/svg":return 1;case"http://www.w3.org/1998/Math/MathML":return 2;default:return 0}}function zm(e,t){if(e===0)switch(t){case"svg":return 1;case"math":return 2;default:return 0}return e===1&&t==="foreignObject"?0:e}function Mu(e,t){return e==="textarea"||e==="noscript"||typeof t.children=="string"||typeof t.children=="number"||typeof t.children=="bigint"||typeof t.dangerouslySetInnerHTML=="object"&&t.dangerouslySetInnerHTML!==null&&t.dangerouslySetInnerHTML.__html!=null}var Du=null;function zx(){var e=window.event;return e&&e.type==="popstate"?e===Du?!1:(Du=e,!0):(Du=null,!1)}var Cm=typeof setTimeout=="function"?setTimeout:void 0,Cx=typeof clearTimeout=="function"?clearTimeout:void 0,Am=typeof Promise=="function"?Promise:void 0,Ax=typeof queueMicrotask=="function"?queueMicrotask:typeof Am<"u"?function(e){return Am.resolve(null).then(e).catch(Tx)}:Cm;function Tx(e){setTimeout(function(){throw e})}function Mn(e){return e==="head"}function Tm(e,t){var a=t,i=0;do{var u=a.nextSibling;if(e.removeChild(a),u&&u.nodeType===8)if(a=u.data,a==="/$"||a==="/&"){if(i===0){e.removeChild(u),ci(t);return}i--}else if(a==="$"||a==="$?"||a==="$~"||a==="$!"||a==="&")i++;else if(a==="html")ho(e.ownerDocument.documentElement);else if(a==="head"){a=e.ownerDocument.head,ho(a);for(var d=a.firstChild;d;){var y=d.nextSibling,T=d.nodeName;d[Ni]||T==="SCRIPT"||T==="STYLE"||T==="LINK"&&d.rel.toLowerCase()==="stylesheet"||a.removeChild(d),d=y}}else a==="body"&&ho(e.ownerDocument.body);a=u}while(a);ci(t)}function Nm(e,t){var a=e;e=0;do{var i=a.nextSibling;if(a.nodeType===1?t?(a._stashedDisplay=a.style.display,a.style.display="none"):(a.style.display=a._stashedDisplay||"",a.getAttribute("style")===""&&a.removeAttribute("style")):a.nodeType===3&&(t?(a._stashedText=a.nodeValue,a.nodeValue=""):a.nodeValue=a._stashedText||""),i&&i.nodeType===8)if(a=i.data,a==="/$"){if(e===0)break;e--}else a!=="$"&&a!=="$?"&&a!=="$~"&&a!=="$!"||e++;a=i}while(a)}function Bu(e){var t=e.firstChild;for(t&&t.nodeType===10&&(t=t.nextSibling);t;){var a=t;switch(t=t.nextSibling,a.nodeName){case"HTML":case"HEAD":case"BODY":Bu(a),Vs(a);continue;case"SCRIPT":case"STYLE":continue;case"LINK":if(a.rel.toLowerCase()==="stylesheet")continue}e.removeChild(a)}}function Nx(e,t,a,i){for(;e.nodeType===1;){var u=a;if(e.nodeName.toLowerCase()!==t.toLowerCase()){if(!i&&(e.nodeName!=="INPUT"||e.type!=="hidden"))break}else if(i){if(!e[Ni])switch(t){case"meta":if(!e.hasAttribute("itemprop"))break;return e;case"link":if(d=e.getAttribute("rel"),d==="stylesheet"&&e.hasAttribute("data-precedence"))break;if(d!==u.rel||e.getAttribute("href")!==(u.href==null||u.href===""?null:u.href)||e.getAttribute("crossorigin")!==(u.crossOrigin==null?null:u.crossOrigin)||e.getAttribute("title")!==(u.title==null?null:u.title))break;return e;case"style":if(e.hasAttribute("data-precedence"))break;return e;case"script":if(d=e.getAttribute("src"),(d!==(u.src==null?null:u.src)||e.getAttribute("type")!==(u.type==null?null:u.type)||e.getAttribute("crossorigin")!==(u.crossOrigin==null?null:u.crossOrigin))&&d&&e.hasAttribute("async")&&!e.hasAttribute("itemprop"))break;return e;default:return e}}else if(t==="input"&&e.type==="hidden"){var d=u.name==null?null:""+u.name;if(u.type==="hidden"&&e.getAttribute("name")===d)return e}else return e;if(e=wa(e.nextSibling),e===null)break}return null}function Ox(e,t,a){if(t==="")return null;for(;e.nodeType!==3;)if((e.nodeType!==1||e.nodeName!=="INPUT"||e.type!=="hidden")&&!a||(e=wa(e.nextSibling),e===null))return null;return e}function Om(e,t){for(;e.nodeType!==8;)if((e.nodeType!==1||e.nodeName!=="INPUT"||e.type!=="hidden")&&!t||(e=wa(e.nextSibling),e===null))return null;return e}function Uu(e){return e.data==="$?"||e.data==="$~"}function Lu(e){return e.data==="$!"||e.data==="$?"&&e.ownerDocument.readyState!=="loading"}function jx(e,t){var a=e.ownerDocument;if(e.data==="$~")e._reactRetry=t;else if(e.data!=="$?"||a.readyState!=="loading")t();else{var i=function(){t(),a.removeEventListener("DOMContentLoaded",i)};a.addEventListener("DOMContentLoaded",i),e._reactRetry=i}}function wa(e){for(;e!=null;e=e.nextSibling){var t=e.nodeType;if(t===1||t===3)break;if(t===8){if(t=e.data,t==="$"||t==="$!"||t==="$?"||t==="$~"||t==="&"||t==="F!"||t==="F")break;if(t==="/$"||t==="/&")return null}}return e}var Hu=null;function jm(e){e=e.nextSibling;for(var t=0;e;){if(e.nodeType===8){var a=e.data;if(a==="/$"||a==="/&"){if(t===0)return wa(e.nextSibling);t--}else a!=="$"&&a!=="$!"&&a!=="$?"&&a!=="$~"&&a!=="&"||t++}e=e.nextSibling}return null}function Rm(e){e=e.previousSibling;for(var t=0;e;){if(e.nodeType===8){var a=e.data;if(a==="$"||a==="$!"||a==="$?"||a==="$~"||a==="&"){if(t===0)return e;t--}else a!=="/$"&&a!=="/&"||t++}e=e.previousSibling}return null}function Mm(e,t,a){switch(t=Rl(a),e){case"html":if(e=t.documentElement,!e)throw Error(l(452));return e;case"head":if(e=t.head,!e)throw Error(l(453));return e;case"body":if(e=t.body,!e)throw Error(l(454));return e;default:throw Error(l(451))}}function ho(e){for(var t=e.attributes;t.length;)e.removeAttributeNode(t[0]);Vs(e)}var _a=new Map,Dm=new Set;function Ml(e){return typeof e.getRootNode=="function"?e.getRootNode():e.nodeType===9?e:e.ownerDocument}var cn=q.d;q.d={f:Rx,r:Mx,D:Dx,C:Bx,L:Ux,m:Lx,X:Zx,S:Hx,M:Vx};function Rx(){var e=cn.f(),t=El();return e||t}function Mx(e){var t=Ar(e);t!==null&&t.tag===5&&t.type==="form"?Wh(t):cn.r(e)}var oi=typeof document>"u"?null:document;function Bm(e,t,a){var i=oi;if(i&&typeof t=="string"&&t){var u=pa(t);u='link[rel="'+e+'"][href="'+u+'"]',typeof a=="string"&&(u+='[crossorigin="'+a+'"]'),Dm.has(u)||(Dm.add(u),e={rel:e,crossOrigin:a,href:t},i.querySelector(u)===null&&(t=i.createElement("link"),Vt(t,"link",e),Mt(t),i.head.appendChild(t)))}}function Dx(e){cn.D(e),Bm("dns-prefetch",e,null)}function Bx(e,t){cn.C(e,t),Bm("preconnect",e,t)}function Ux(e,t,a){cn.L(e,t,a);var i=oi;if(i&&e&&t){var u='link[rel="preload"][as="'+pa(t)+'"]';t==="image"&&a&&a.imageSrcSet?(u+='[imagesrcset="'+pa(a.imageSrcSet)+'"]',typeof a.imageSizes=="string"&&(u+='[imagesizes="'+pa(a.imageSizes)+'"]')):u+='[href="'+pa(e)+'"]';var d=u;switch(t){case"style":d=li(e);break;case"script":d=si(e)}_a.has(d)||(e=b({rel:"preload",href:t==="image"&&a&&a.imageSrcSet?void 0:e,as:t},a),_a.set(d,e),i.querySelector(u)!==null||t==="style"&&i.querySelector(po(d))||t==="script"&&i.querySelector(mo(d))||(t=i.createElement("link"),Vt(t,"link",e),Mt(t),i.head.appendChild(t)))}}function Lx(e,t){cn.m(e,t);var a=oi;if(a&&e){var i=t&&typeof t.as=="string"?t.as:"script",u='link[rel="modulepreload"][as="'+pa(i)+'"][href="'+pa(e)+'"]',d=u;switch(i){case"audioworklet":case"paintworklet":case"serviceworker":case"sharedworker":case"worker":case"script":d=si(e)}if(!_a.has(d)&&(e=b({rel:"modulepreload",href:e},t),_a.set(d,e),a.querySelector(u)===null)){switch(i){case"audioworklet":case"paintworklet":case"serviceworker":case"sharedworker":case"worker":case"script":if(a.querySelector(mo(d)))return}i=a.createElement("link"),Vt(i,"link",e),Mt(i),a.head.appendChild(i)}}}function Hx(e,t,a){cn.S(e,t,a);var i=oi;if(i&&e){var u=Tr(i).hoistableStyles,d=li(e);t=t||"default";var y=u.get(d);if(!y){var T={loading:0,preload:null};if(y=i.querySelector(po(d)))T.loading=5;else{e=b({rel:"stylesheet",href:e,"data-precedence":t},a),(a=_a.get(d))&&Zu(e,a);var Z=y=i.createElement("link");Mt(Z),Vt(Z,"link",e),Z._p=new Promise(function(J,ce){Z.onload=J,Z.onerror=ce}),Z.addEventListener("load",function(){T.loading|=1}),Z.addEventListener("error",function(){T.loading|=2}),T.loading|=4,Dl(y,t,i)}y={type:"stylesheet",instance:y,count:1,state:T},u.set(d,y)}}}function Zx(e,t){cn.X(e,t);var a=oi;if(a&&e){var i=Tr(a).hoistableScripts,u=si(e),d=i.get(u);d||(d=a.querySelector(mo(u)),d||(e=b({src:e,async:!0},t),(t=_a.get(u))&&Vu(e,t),d=a.createElement("script"),Mt(d),Vt(d,"link",e),a.head.appendChild(d)),d={type:"script",instance:d,count:1,state:null},i.set(u,d))}}function Vx(e,t){cn.M(e,t);var a=oi;if(a&&e){var i=Tr(a).hoistableScripts,u=si(e),d=i.get(u);d||(d=a.querySelector(mo(u)),d||(e=b({src:e,async:!0,type:"module"},t),(t=_a.get(u))&&Vu(e,t),d=a.createElement("script"),Mt(d),Vt(d,"link",e),a.head.appendChild(d)),d={type:"script",instance:d,count:1,state:null},i.set(u,d))}}function Um(e,t,a,i){var u=(u=Ee.current)?Ml(u):null;if(!u)throw Error(l(446));switch(e){case"meta":case"title":return null;case"style":return typeof a.precedence=="string"&&typeof a.href=="string"?(t=li(a.href),a=Tr(u).hoistableStyles,i=a.get(t),i||(i={type:"style",instance:null,count:0,state:null},a.set(t,i)),i):{type:"void",instance:null,count:0,state:null};case"link":if(a.rel==="stylesheet"&&typeof a.href=="string"&&typeof a.precedence=="string"){e=li(a.href);var d=Tr(u).hoistableStyles,y=d.get(e);if(y||(u=u.ownerDocument||u,y={type:"stylesheet",instance:null,count:0,state:{loading:0,preload:null}},d.set(e,y),(d=u.querySelector(po(e)))&&!d._p&&(y.instance=d,y.state.loading=5),_a.has(e)||(a={rel:"preload",as:"style",href:a.href,crossOrigin:a.crossOrigin,integrity:a.integrity,media:a.media,hrefLang:a.hrefLang,referrerPolicy:a.referrerPolicy},_a.set(e,a),d||qx(u,e,a,y.state))),t&&i===null)throw Error(l(528,""));return y}if(t&&i!==null)throw Error(l(529,""));return null;case"script":return t=a.async,a=a.src,typeof a=="string"&&t&&typeof t!="function"&&typeof t!="symbol"?(t=si(a),a=Tr(u).hoistableScripts,i=a.get(t),i||(i={type:"script",instance:null,count:0,state:null},a.set(t,i)),i):{type:"void",instance:null,count:0,state:null};default:throw Error(l(444,e))}}function li(e){return'href="'+pa(e)+'"'}function po(e){return'link[rel="stylesheet"]['+e+"]"}function Lm(e){return b({},e,{"data-precedence":e.precedence,precedence:null})}function qx(e,t,a,i){e.querySelector('link[rel="preload"][as="style"]['+t+"]")?i.loading=1:(t=e.createElement("link"),i.preload=t,t.addEventListener("load",function(){return i.loading|=1}),t.addEventListener("error",function(){return i.loading|=2}),Vt(t,"link",a),Mt(t),e.head.appendChild(t))}function si(e){return'[src="'+pa(e)+'"]'}function mo(e){return"script[async]"+e}function Hm(e,t,a){if(t.count++,t.instance===null)switch(t.type){case"style":var i=e.querySelector('style[data-href~="'+pa(a.href)+'"]');if(i)return t.instance=i,Mt(i),i;var u=b({},a,{"data-href":a.href,"data-precedence":a.precedence,href:null,precedence:null});return i=(e.ownerDocument||e).createElement("style"),Mt(i),Vt(i,"style",u),Dl(i,a.precedence,e),t.instance=i;case"stylesheet":u=li(a.href);var d=e.querySelector(po(u));if(d)return t.state.loading|=4,t.instance=d,Mt(d),d;i=Lm(a),(u=_a.get(u))&&Zu(i,u),d=(e.ownerDocument||e).createElement("link"),Mt(d);var y=d;return y._p=new Promise(function(T,Z){y.onload=T,y.onerror=Z}),Vt(d,"link",i),t.state.loading|=4,Dl(d,a.precedence,e),t.instance=d;case"script":return d=si(a.src),(u=e.querySelector(mo(d)))?(t.instance=u,Mt(u),u):(i=a,(u=_a.get(d))&&(i=b({},a),Vu(i,u)),e=e.ownerDocument||e,u=e.createElement("script"),Mt(u),Vt(u,"link",i),e.head.appendChild(u),t.instance=u);case"void":return null;default:throw Error(l(443,t.type))}else t.type==="stylesheet"&&(t.state.loading&4)===0&&(i=t.instance,t.state.loading|=4,Dl(i,a.precedence,e));return t.instance}function Dl(e,t,a){for(var i=a.querySelectorAll('link[rel="stylesheet"][data-precedence],style[data-precedence]'),u=i.length?i[i.length-1]:null,d=u,y=0;y<i.length;y++){var T=i[y];if(T.dataset.precedence===t)d=T;else if(d!==u)break}d?d.parentNode.insertBefore(e,d.nextSibling):(t=a.nodeType===9?a.head:a,t.insertBefore(e,t.firstChild))}function Zu(e,t){e.crossOrigin==null&&(e.crossOrigin=t.crossOrigin),e.referrerPolicy==null&&(e.referrerPolicy=t.referrerPolicy),e.title==null&&(e.title=t.title)}function Vu(e,t){e.crossOrigin==null&&(e.crossOrigin=t.crossOrigin),e.referrerPolicy==null&&(e.referrerPolicy=t.referrerPolicy),e.integrity==null&&(e.integrity=t.integrity)}var Bl=null;function Zm(e,t,a){if(Bl===null){var i=new Map,u=Bl=new Map;u.set(a,i)}else u=Bl,i=u.get(a),i||(i=new Map,u.set(a,i));if(i.has(e))return i;for(i.set(e,null),a=a.getElementsByTagName(e),u=0;u<a.length;u++){var d=a[u];if(!(d[Ni]||d[Ut]||e==="link"&&d.getAttribute("rel")==="stylesheet")&&d.namespaceURI!=="http://www.w3.org/2000/svg"){var y=d.getAttribute(t)||"";y=e+y;var T=i.get(y);T?T.push(d):i.set(y,[d])}}return i}function Vm(e,t,a){e=e.ownerDocument||e,e.head.insertBefore(a,t==="title"?e.querySelector("head > title"):null)}function Gx(e,t,a){if(a===1||t.itemProp!=null)return!1;switch(e){case"meta":case"title":return!0;case"style":if(typeof t.precedence!="string"||typeof t.href!="string"||t.href==="")break;return!0;case"link":if(typeof t.rel!="string"||typeof t.href!="string"||t.href===""||t.onLoad||t.onError)break;switch(t.rel){case"stylesheet":return e=t.disabled,typeof t.precedence=="string"&&e==null;default:return!0}case"script":if(t.async&&typeof t.async!="function"&&typeof t.async!="symbol"&&!t.onLoad&&!t.onError&&t.src&&typeof t.src=="string")return!0}return!1}function qm(e){return!(e.type==="stylesheet"&&(e.state.loading&3)===0)}function Yx(e,t,a,i){if(a.type==="stylesheet"&&(typeof i.media!="string"||matchMedia(i.media).matches!==!1)&&(a.state.loading&4)===0){if(a.instance===null){var u=li(i.href),d=t.querySelector(po(u));if(d){t=d._p,t!==null&&typeof t=="object"&&typeof t.then=="function"&&(e.count++,e=Ul.bind(e),t.then(e,e)),a.state.loading|=4,a.instance=d,Mt(d);return}d=t.ownerDocument||t,i=Lm(i),(u=_a.get(u))&&Zu(i,u),d=d.createElement("link"),Mt(d);var y=d;y._p=new Promise(function(T,Z){y.onload=T,y.onerror=Z}),Vt(d,"link",i),a.instance=d}e.stylesheets===null&&(e.stylesheets=new Map),e.stylesheets.set(a,t),(t=a.state.preload)&&(a.state.loading&3)===0&&(e.count++,a=Ul.bind(e),t.addEventListener("load",a),t.addEventListener("error",a))}}var qu=0;function Ix(e,t){return e.stylesheets&&e.count===0&&Hl(e,e.stylesheets),0<e.count||0<e.imgCount?function(a){var i=setTimeout(function(){if(e.stylesheets&&Hl(e,e.stylesheets),e.unsuspend){var d=e.unsuspend;e.unsuspend=null,d()}},6e4+t);0<e.imgBytes&&qu===0&&(qu=62500*Ex());var u=setTimeout(function(){if(e.waitingForImages=!1,e.count===0&&(e.stylesheets&&Hl(e,e.stylesheets),e.unsuspend)){var d=e.unsuspend;e.unsuspend=null,d()}},(e.imgBytes>qu?50:800)+t);return e.unsuspend=a,function(){e.unsuspend=null,clearTimeout(i),clearTimeout(u)}}:null}function Ul(){if(this.count--,this.count===0&&(this.imgCount===0||!this.waitingForImages)){if(this.stylesheets)Hl(this,this.stylesheets);else if(this.unsuspend){var e=this.unsuspend;this.unsuspend=null,e()}}}var Ll=null;function Hl(e,t){e.stylesheets=null,e.unsuspend!==null&&(e.count++,Ll=new Map,t.forEach(Xx,e),Ll=null,Ul.call(e))}function Xx(e,t){if(!(t.state.loading&4)){var a=Ll.get(e);if(a)var i=a.get(null);else{a=new Map,Ll.set(e,a);for(var u=e.querySelectorAll("link[data-precedence],style[data-precedence]"),d=0;d<u.length;d++){var y=u[d];(y.nodeName==="LINK"||y.getAttribute("media")!=="not all")&&(a.set(y.dataset.precedence,y),i=y)}i&&a.set(null,i)}u=t.instance,y=u.getAttribute("data-precedence"),d=a.get(y)||i,d===i&&a.set(null,u),a.set(y,u),this.count++,i=Ul.bind(this),u.addEventListener("load",i),u.addEventListener("error",i),d?d.parentNode.insertBefore(u,d.nextSibling):(e=e.nodeType===9?e.head:e,e.insertBefore(u,e.firstChild)),t.state.loading|=4}}var go={$$typeof:N,Provider:null,Consumer:null,_currentValue:Q,_currentValue2:Q,_threadCount:0};function Qx(e,t,a,i,u,d,y,T,Z){this.tag=1,this.containerInfo=e,this.pingCache=this.current=this.pendingChildren=null,this.timeoutHandle=-1,this.callbackNode=this.next=this.pendingContext=this.context=this.cancelPendingCommit=null,this.callbackPriority=0,this.expirationTimes=Us(-1),this.entangledLanes=this.shellSuspendCounter=this.errorRecoveryDisabledLanes=this.expiredLanes=this.warmLanes=this.pingedLanes=this.suspendedLanes=this.pendingLanes=0,this.entanglements=Us(0),this.hiddenUpdates=Us(null),this.identifierPrefix=i,this.onUncaughtError=u,this.onCaughtError=d,this.onRecoverableError=y,this.pooledCache=null,this.pooledCacheLanes=0,this.formState=Z,this.incompleteTransitions=new Map}function Gm(e,t,a,i,u,d,y,T,Z,J,ce,fe){return e=new Qx(e,t,a,y,Z,J,ce,fe,T),t=1,d===!0&&(t|=24),d=ta(3,null,null,t),e.current=d,d.stateNode=e,t=wc(),t.refCount++,e.pooledCache=t,t.refCount++,d.memoizedState={element:i,isDehydrated:a,cache:t},Ec(d),e}function Ym(e){return e?(e=Hr,e):Hr}function Im(e,t,a,i,u,d){u=Ym(u),i.context===null?i.context=u:i.pendingContext=u,i=Sn(t),i.payload={element:a},d=d===void 0?null:d,d!==null&&(i.callback=d),a=kn(e,i,t),a!==null&&(Wt(a,e,t),Qi(a,e,t))}function Xm(e,t){if(e=e.memoizedState,e!==null&&e.dehydrated!==null){var a=e.retryLane;e.retryLane=a!==0&&a<t?a:t}}function Gu(e,t){Xm(e,t),(e=e.alternate)&&Xm(e,t)}function Qm(e){if(e.tag===13||e.tag===31){var t=ir(e,67108864);t!==null&&Wt(t,e,67108864),Gu(e,67108864)}}function Fm(e){if(e.tag===13||e.tag===31){var t=oa();t=Ls(t);var a=ir(e,t);a!==null&&Wt(a,e,t),Gu(e,t)}}var Zl=!0;function Fx(e,t,a,i){var u=V.T;V.T=null;var d=q.p;try{q.p=2,Yu(e,t,a,i)}finally{q.p=d,V.T=u}}function Kx(e,t,a,i){var u=V.T;V.T=null;var d=q.p;try{q.p=8,Yu(e,t,a,i)}finally{q.p=d,V.T=u}}function Yu(e,t,a,i){if(Zl){var u=Iu(i);if(u===null)Nu(e,t,i,Vl,a),Pm(e,i);else if(Jx(u,e,t,a,i))i.stopPropagation();else if(Pm(e,i),t&4&&-1<Px.indexOf(e)){for(;u!==null;){var d=Ar(u);if(d!==null)switch(d.tag){case 3:if(d=d.stateNode,d.current.memoizedState.isDehydrated){var y=fa(d.pendingLanes);if(y!==0){var T=d;for(T.pendingLanes|=2,T.entangledLanes|=2;y;){var Z=1<<31-bt(y);T.entanglements[1]|=Z,y&=~Z}La(d),(at&6)===0&&(Sl=_e()+500,co(0))}}break;case 31:case 13:T=ir(d,2),T!==null&&Wt(T,d,2),El(),Gu(d,2)}if(d=Iu(i),d===null&&Nu(e,t,i,Vl,a),d===u)break;u=d}u!==null&&i.stopPropagation()}else Nu(e,t,i,null,a)}}function Iu(e){return e=Qs(e),Xu(e)}var Vl=null;function Xu(e){if(Vl=null,e=Cr(e),e!==null){var t=c(e);if(t===null)e=null;else{var a=t.tag;if(a===13){if(e=f(t),e!==null)return e;e=null}else if(a===31){if(e=h(t),e!==null)return e;e=null}else if(a===3){if(t.stateNode.current.memoizedState.isDehydrated)return t.tag===3?t.stateNode.containerInfo:null;e=null}else t!==e&&(e=null)}}return Vl=e,null}function Km(e){switch(e){case"beforetoggle":case"cancel":case"click":case"close":case"contextmenu":case"copy":case"cut":case"auxclick":case"dblclick":case"dragend":case"dragstart":case"drop":case"focusin":case"focusout":case"input":case"invalid":case"keydown":case"keypress":case"keyup":case"mousedown":case"mouseup":case"paste":case"pause":case"play":case"pointercancel":case"pointerdown":case"pointerup":case"ratechange":case"reset":case"resize":case"seeked":case"submit":case"toggle":case"touchcancel":case"touchend":case"touchstart":case"volumechange":case"change":case"selectionchange":case"textInput":case"compositionstart":case"compositionend":case"compositionupdate":case"beforeblur":case"afterblur":case"beforeinput":case"blur":case"fullscreenchange":case"focus":case"hashchange":case"popstate":case"select":case"selectstart":return 2;case"drag":case"dragenter":case"dragexit":case"dragleave":case"dragover":case"mousemove":case"mouseout":case"mouseover":case"pointermove":case"pointerout":case"pointerover":case"scroll":case"touchmove":case"wheel":case"mouseenter":case"mouseleave":case"pointerenter":case"pointerleave":return 8;case"message":switch(xe()){case De:return 2;case it:return 8;case Ye:case It:return 32;case mn:return 268435456;default:return 32}default:return 32}}var Qu=!1,Dn=null,Bn=null,Un=null,vo=new Map,bo=new Map,Ln=[],Px="mousedown mouseup touchcancel touchend touchstart auxclick dblclick pointercancel pointerdown pointerup dragend dragstart drop compositionend compositionstart keydown keypress keyup input textInput copy cut paste click change contextmenu reset".split(" ");function Pm(e,t){switch(e){case"focusin":case"focusout":Dn=null;break;case"dragenter":case"dragleave":Bn=null;break;case"mouseover":case"mouseout":Un=null;break;case"pointerover":case"pointerout":vo.delete(t.pointerId);break;case"gotpointercapture":case"lostpointercapture":bo.delete(t.pointerId)}}function yo(e,t,a,i,u,d){return e===null||e.nativeEvent!==d?(e={blockedOn:t,domEventName:a,eventSystemFlags:i,nativeEvent:d,targetContainers:[u]},t!==null&&(t=Ar(t),t!==null&&Qm(t)),e):(e.eventSystemFlags|=i,t=e.targetContainers,u!==null&&t.indexOf(u)===-1&&t.push(u),e)}function Jx(e,t,a,i,u){switch(t){case"focusin":return Dn=yo(Dn,e,t,a,i,u),!0;case"dragenter":return Bn=yo(Bn,e,t,a,i,u),!0;case"mouseover":return Un=yo(Un,e,t,a,i,u),!0;case"pointerover":var d=u.pointerId;return vo.set(d,yo(vo.get(d)||null,e,t,a,i,u)),!0;case"gotpointercapture":return d=u.pointerId,bo.set(d,yo(bo.get(d)||null,e,t,a,i,u)),!0}return!1}function Jm(e){var t=Cr(e.target);if(t!==null){var a=c(t);if(a!==null){if(t=a.tag,t===13){if(t=f(a),t!==null){e.blockedOn=t,df(e.priority,function(){Fm(a)});return}}else if(t===31){if(t=h(a),t!==null){e.blockedOn=t,df(e.priority,function(){Fm(a)});return}}else if(t===3&&a.stateNode.current.memoizedState.isDehydrated){e.blockedOn=a.tag===3?a.stateNode.containerInfo:null;return}}}e.blockedOn=null}function ql(e){if(e.blockedOn!==null)return!1;for(var t=e.targetContainers;0<t.length;){var a=Iu(e.nativeEvent);if(a===null){a=e.nativeEvent;var i=new a.constructor(a.type,a);Xs=i,a.target.dispatchEvent(i),Xs=null}else return t=Ar(a),t!==null&&Qm(t),e.blockedOn=a,!1;t.shift()}return!0}function Wm(e,t,a){ql(e)&&a.delete(t)}function Wx(){Qu=!1,Dn!==null&&ql(Dn)&&(Dn=null),Bn!==null&&ql(Bn)&&(Bn=null),Un!==null&&ql(Un)&&(Un=null),vo.forEach(Wm),bo.forEach(Wm)}function Gl(e,t){e.blockedOn===t&&(e.blockedOn=null,Qu||(Qu=!0,n.unstable_scheduleCallback(n.unstable_NormalPriority,Wx)))}var Yl=null;function $m(e){Yl!==e&&(Yl=e,n.unstable_scheduleCallback(n.unstable_NormalPriority,function(){Yl===e&&(Yl=null);for(var t=0;t<e.length;t+=3){var a=e[t],i=e[t+1],u=e[t+2];if(typeof i!="function"){if(Xu(i||a)===null)continue;break}var d=Ar(a);d!==null&&(e.splice(t,3),t-=3,Ic(d,{pending:!0,data:u,method:a.method,action:i},i,u))}}))}function ci(e){function t(Z){return Gl(Z,e)}Dn!==null&&Gl(Dn,e),Bn!==null&&Gl(Bn,e),Un!==null&&Gl(Un,e),vo.forEach(t),bo.forEach(t);for(var a=0;a<Ln.length;a++){var i=Ln[a];i.blockedOn===e&&(i.blockedOn=null)}for(;0<Ln.length&&(a=Ln[0],a.blockedOn===null);)Jm(a),a.blockedOn===null&&Ln.shift();if(a=(e.ownerDocument||e).$$reactFormReplay,a!=null)for(i=0;i<a.length;i+=3){var u=a[i],d=a[i+1],y=u[Xt]||null;if(typeof d=="function")y||$m(a);else if(y){var T=null;if(d&&d.hasAttribute("formAction")){if(u=d,y=d[Xt]||null)T=y.formAction;else if(Xu(u)!==null)continue}else T=y.action;typeof T=="function"?a[i+1]=T:(a.splice(i,3),i-=3),$m(a)}}}function eg(){function e(d){d.canIntercept&&d.info==="react-transition"&&d.intercept({handler:function(){return new Promise(function(y){return u=y})},focusReset:"manual",scroll:"manual"})}function t(){u!==null&&(u(),u=null),i||setTimeout(a,20)}function a(){if(!i&&!navigation.transition){var d=navigation.currentEntry;d&&d.url!=null&&navigation.navigate(d.url,{state:d.getState(),info:"react-transition",history:"replace"})}}if(typeof navigation=="object"){var i=!1,u=null;return navigation.addEventListener("navigate",e),navigation.addEventListener("navigatesuccess",t),navigation.addEventListener("navigateerror",t),setTimeout(a,100),function(){i=!0,navigation.removeEventListener("navigate",e),navigation.removeEventListener("navigatesuccess",t),navigation.removeEventListener("navigateerror",t),u!==null&&(u(),u=null)}}}function Fu(e){this._internalRoot=e}Il.prototype.render=Fu.prototype.render=function(e){var t=this._internalRoot;if(t===null)throw Error(l(409));var a=t.current,i=oa();Im(a,i,e,t,null,null)},Il.prototype.unmount=Fu.prototype.unmount=function(){var e=this._internalRoot;if(e!==null){this._internalRoot=null;var t=e.containerInfo;Im(e.current,2,null,e,null,null),El(),t[zr]=null}};function Il(e){this._internalRoot=e}Il.prototype.unstable_scheduleHydration=function(e){if(e){var t=uf();e={blockedOn:null,target:e,priority:t};for(var a=0;a<Ln.length&&t!==0&&t<Ln[a].priority;a++);Ln.splice(a,0,e),a===0&&Jm(e)}};var tg=r.version;if(tg!=="19.2.4")throw Error(l(527,tg,"19.2.4"));q.findDOMNode=function(e){var t=e._reactInternals;if(t===void 0)throw typeof e.render=="function"?Error(l(188)):(e=Object.keys(e).join(","),Error(l(268,e)));return e=m(t),e=e!==null?v(e):null,e=e===null?null:e.stateNode,e};var $x={bundleType:0,version:"19.2.4",rendererPackageName:"react-dom",currentDispatcherRef:V,reconcilerVersion:"19.2.4"};if(typeof __REACT_DEVTOOLS_GLOBAL_HOOK__<"u"){var Xl=__REACT_DEVTOOLS_GLOBAL_HOOK__;if(!Xl.isDisabled&&Xl.supportsFiber)try{ft=Xl.inject($x),Rt=Xl}catch{}}return wo.createRoot=function(e,t){if(!s(e))throw Error(l(299));var a=!1,i="",u=sp,d=cp,y=up;return t!=null&&(t.unstable_strictMode===!0&&(a=!0),t.identifierPrefix!==void 0&&(i=t.identifierPrefix),t.onUncaughtError!==void 0&&(u=t.onUncaughtError),t.onCaughtError!==void 0&&(d=t.onCaughtError),t.onRecoverableError!==void 0&&(y=t.onRecoverableError)),t=Gm(e,1,!1,null,null,a,i,null,u,d,y,eg),e[zr]=t.current,Tu(e),new Fu(t)},wo.hydrateRoot=function(e,t,a){if(!s(e))throw Error(l(299));var i=!1,u="",d=sp,y=cp,T=up,Z=null;return a!=null&&(a.unstable_strictMode===!0&&(i=!0),a.identifierPrefix!==void 0&&(u=a.identifierPrefix),a.onUncaughtError!==void 0&&(d=a.onUncaughtError),a.onCaughtError!==void 0&&(y=a.onCaughtError),a.onRecoverableError!==void 0&&(T=a.onRecoverableError),a.formState!==void 0&&(Z=a.formState)),t=Gm(e,1,!0,t,a??null,i,u,Z,d,y,T,eg),t.context=Ym(null),a=t.current,i=oa(),i=Ls(i),u=Sn(i),u.callback=null,kn(a,u,i),a=i,t.current.lanes=a,Ti(t,a),La(t),e[zr]=t.current,Tu(e),new Il(t)},wo.version="19.2.4",wo}var dg;function cw(){if(dg)return Ju.exports;dg=1;function n(){if(!(typeof __REACT_DEVTOOLS_GLOBAL_HOOK__>"u"||typeof __REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE!="function"))try{__REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE(n)}catch(r){console.error(r)}}return n(),Ju.exports=sw(),Ju.exports}var uw=cw();const dw=ws(uw);var No=zv();const fw=ws(No);/**
 * @remix-run/router v1.23.2
 *
 * Copyright (c) Remix Software Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE.md file in the root directory of this source tree.
 *
 * @license MIT
 */function os(){return os=Object.assign?Object.assign.bind():function(n){for(var r=1;r<arguments.length;r++){var o=arguments[r];for(var l in o)Object.prototype.hasOwnProperty.call(o,l)&&(n[l]=o[l])}return n},os.apply(this,arguments)}var Yn;(function(n){n.Pop="POP",n.Push="PUSH",n.Replace="REPLACE"})(Yn||(Yn={}));const fg="popstate";function hw(n){n===void 0&&(n={});function r(l,s){let{pathname:c,search:f,hash:h}=l.location;return md("",{pathname:c,search:f,hash:h},s.state&&s.state.usr||null,s.state&&s.state.key||"default")}function o(l,s){return typeof s=="string"?s:Av(s)}return mw(r,o,null,n)}function $t(n,r){if(n===!1||n===null||typeof n>"u")throw new Error(r)}function Cv(n,r){if(!n){typeof console<"u"&&console.warn(r);try{throw new Error(r)}catch{}}}function pw(){return Math.random().toString(36).substr(2,8)}function hg(n,r){return{usr:n.state,key:n.key,idx:r}}function md(n,r,o,l){return o===void 0&&(o=null),os({pathname:typeof n=="string"?n:n.pathname,search:"",hash:""},typeof r=="string"?_s(r):r,{state:o,key:r&&r.key||l||pw()})}function Av(n){let{pathname:r="/",search:o="",hash:l=""}=n;return o&&o!=="?"&&(r+=o.charAt(0)==="?"?o:"?"+o),l&&l!=="#"&&(r+=l.charAt(0)==="#"?l:"#"+l),r}function _s(n){let r={};if(n){let o=n.indexOf("#");o>=0&&(r.hash=n.substr(o),n=n.substr(0,o));let l=n.indexOf("?");l>=0&&(r.search=n.substr(l),n=n.substr(0,l)),n&&(r.pathname=n)}return r}function mw(n,r,o,l){l===void 0&&(l={});let{window:s=document.defaultView,v5Compat:c=!1}=l,f=s.history,h=Yn.Pop,p=null,m=v();m==null&&(m=0,f.replaceState(os({},f.state,{idx:m}),""));function v(){return(f.state||{idx:null}).idx}function b(){h=Yn.Pop;let w=v(),k=w==null?null:w-m;m=w,p&&p({action:h,location:g.location,delta:k})}function E(w,k){h=Yn.Push;let A=md(g.location,w,k);m=v()+1;let N=hg(A,m),R=g.createHref(A);try{f.pushState(N,"",R)}catch(U){if(U instanceof DOMException&&U.name==="DataCloneError")throw U;s.location.assign(R)}c&&p&&p({action:h,location:g.location,delta:1})}function x(w,k){h=Yn.Replace;let A=md(g.location,w,k);m=v();let N=hg(A,m),R=g.createHref(A);f.replaceState(N,"",R),c&&p&&p({action:h,location:g.location,delta:0})}function z(w){let k=s.location.origin!=="null"?s.location.origin:s.location.href,A=typeof w=="string"?w:Av(w);return A=A.replace(/ $/,"%20"),$t(k,"No window.location.(origin|href) available to create URL for href: "+A),new URL(A,k)}let g={get action(){return h},get location(){return n(s,f)},listen(w){if(p)throw new Error("A history only accepts one active listener");return s.addEventListener(fg,b),p=w,()=>{s.removeEventListener(fg,b),p=null}},createHref(w){return r(s,w)},createURL:z,encodeLocation(w){let k=z(w);return{pathname:k.pathname,search:k.search,hash:k.hash}},push:E,replace:x,go(w){return f.go(w)}};return g}var pg;(function(n){n.data="data",n.deferred="deferred",n.redirect="redirect",n.error="error"})(pg||(pg={}));function gw(n,r,o){return o===void 0&&(o="/"),vw(n,r,o)}function vw(n,r,o,l){let s=typeof r=="string"?_s(r):r,c=Ov(s.pathname||"/",o);if(c==null)return null;let f=Tv(n);bw(f);let h=null;for(let p=0;h==null&&p<f.length;++p){let m=Nw(c);h=Cw(f[p],m)}return h}function Tv(n,r,o,l){r===void 0&&(r=[]),o===void 0&&(o=[]),l===void 0&&(l="");let s=(c,f,h)=>{let p={relativePath:h===void 0?c.path||"":h,caseSensitive:c.caseSensitive===!0,childrenIndex:f,route:c};p.relativePath.startsWith("/")&&($t(p.relativePath.startsWith(l),'Absolute route path "'+p.relativePath+'" nested under path '+('"'+l+'" is not valid. An absolute child route path ')+"must start with the combined path of all its parent routes."),p.relativePath=p.relativePath.slice(l.length));let m=mi([l,p.relativePath]),v=o.concat(p);c.children&&c.children.length>0&&($t(c.index!==!0,"Index routes must not have child routes. Please remove "+('all child routes from route path "'+m+'".')),Tv(c.children,r,v,m)),!(c.path==null&&!c.index)&&r.push({path:m,score:Ew(m,c.index),routesMeta:v})};return n.forEach((c,f)=>{var h;if(c.path===""||!((h=c.path)!=null&&h.includes("?")))s(c,f);else for(let p of Nv(c.path))s(c,f,p)}),r}function Nv(n){let r=n.split("/");if(r.length===0)return[];let[o,...l]=r,s=o.endsWith("?"),c=o.replace(/\?$/,"");if(l.length===0)return s?[c,""]:[c];let f=Nv(l.join("/")),h=[];return h.push(...f.map(p=>p===""?c:[c,p].join("/"))),s&&h.push(...f),h.map(p=>n.startsWith("/")&&p===""?"/":p)}function bw(n){n.sort((r,o)=>r.score!==o.score?o.score-r.score:zw(r.routesMeta.map(l=>l.childrenIndex),o.routesMeta.map(l=>l.childrenIndex)))}const yw=/^:[\w-]+$/,xw=3,ww=2,_w=1,Sw=10,kw=-2,mg=n=>n==="*";function Ew(n,r){let o=n.split("/"),l=o.length;return o.some(mg)&&(l+=kw),r&&(l+=ww),o.filter(s=>!mg(s)).reduce((s,c)=>s+(yw.test(c)?xw:c===""?_w:Sw),l)}function zw(n,r){return n.length===r.length&&n.slice(0,-1).every((l,s)=>l===r[s])?n[n.length-1]-r[r.length-1]:0}function Cw(n,r,o){let{routesMeta:l}=n,s={},c="/",f=[];for(let h=0;h<l.length;++h){let p=l[h],m=h===l.length-1,v=c==="/"?r:r.slice(c.length)||"/",b=Aw({path:p.relativePath,caseSensitive:p.caseSensitive,end:m},v),E=p.route;if(!b)return null;Object.assign(s,b.params),f.push({params:s,pathname:mi([c,b.pathname]),pathnameBase:Ow(mi([c,b.pathnameBase])),route:E}),b.pathnameBase!=="/"&&(c=mi([c,b.pathnameBase]))}return f}function Aw(n,r){typeof n=="string"&&(n={path:n,caseSensitive:!1,end:!0});let[o,l]=Tw(n.path,n.caseSensitive,n.end),s=r.match(o);if(!s)return null;let c=s[0],f=c.replace(/(.)\/+$/,"$1"),h=s.slice(1);return{params:l.reduce((m,v,b)=>{let{paramName:E,isOptional:x}=v;if(E==="*"){let g=h[b]||"";f=c.slice(0,c.length-g.length).replace(/(.)\/+$/,"$1")}const z=h[b];return x&&!z?m[E]=void 0:m[E]=(z||"").replace(/%2F/g,"/"),m},{}),pathname:c,pathnameBase:f,pattern:n}}function Tw(n,r,o){r===void 0&&(r=!1),o===void 0&&(o=!0),Cv(n==="*"||!n.endsWith("*")||n.endsWith("/*"),'Route path "'+n+'" will be treated as if it were '+('"'+n.replace(/\*$/,"/*")+'" because the `*` character must ')+"always follow a `/` in the pattern. To get rid of this warning, "+('please change the route path to "'+n.replace(/\*$/,"/*")+'".'));let l=[],s="^"+n.replace(/\/*\*?$/,"").replace(/^\/*/,"/").replace(/[\\.*+^${}|()[\]]/g,"\\$&").replace(/\/:([\w-]+)(\?)?/g,(f,h,p)=>(l.push({paramName:h,isOptional:p!=null}),p?"/?([^\\/]+)?":"/([^\\/]+)"));return n.endsWith("*")?(l.push({paramName:"*"}),s+=n==="*"||n==="/*"?"(.*)$":"(?:\\/(.+)|\\/*)$"):o?s+="\\/*$":n!==""&&n!=="/"&&(s+="(?:(?=\\/|$))"),[new RegExp(s,r?void 0:"i"),l]}function Nw(n){try{return n.split("/").map(r=>decodeURIComponent(r).replace(/\//g,"%2F")).join("/")}catch(r){return Cv(!1,'The URL path "'+n+'" could not be decoded because it is is a malformed URL segment. This is probably due to a bad percent '+("encoding ("+r+").")),n}}function Ov(n,r){if(r==="/")return n;if(!n.toLowerCase().startsWith(r.toLowerCase()))return null;let o=r.endsWith("/")?r.length-1:r.length,l=n.charAt(o);return l&&l!=="/"?null:n.slice(o)||"/"}const mi=n=>n.join("/").replace(/\/\/+/g,"/"),Ow=n=>n.replace(/\/+$/,"").replace(/^\/*/,"/");function jw(n){return n!=null&&typeof n.status=="number"&&typeof n.statusText=="string"&&typeof n.internal=="boolean"&&"data"in n}const jv=["post","put","patch","delete"];new Set(jv);const Rw=["get",...jv];new Set(Rw);/**
 * React Router v6.30.3
 *
 * Copyright (c) Remix Software Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE.md file in the root directory of this source tree.
 *
 * @license MIT
 */function ls(){return ls=Object.assign?Object.assign.bind():function(n){for(var r=1;r<arguments.length;r++){var o=arguments[r];for(var l in o)Object.prototype.hasOwnProperty.call(o,l)&&(n[l]=o[l])}return n},ls.apply(this,arguments)}const Mw=j.createContext(null),Dw=j.createContext(null),Rv=j.createContext(null),Ss=j.createContext(null),Oo=j.createContext({outlet:null,matches:[],isDataRoute:!1}),Mv=j.createContext(null);function Hd(){return j.useContext(Ss)!=null}function Bw(){return Hd()||$t(!1),j.useContext(Ss).location}function Dv(){let{matches:n}=j.useContext(Oo),r=n[n.length-1];return r?r.params:{}}function Uw(n,r){return Lw(n,r)}function Lw(n,r,o,l){Hd()||$t(!1);let{navigator:s}=j.useContext(Rv),{matches:c}=j.useContext(Oo),f=c[c.length-1],h=f?f.params:{};f&&f.pathname;let p=f?f.pathnameBase:"/";f&&f.route;let m=Bw(),v;if(r){var b;let w=typeof r=="string"?_s(r):r;p==="/"||(b=w.pathname)!=null&&b.startsWith(p)||$t(!1),v=w}else v=m;let E=v.pathname||"/",x=E;if(p!=="/"){let w=p.replace(/^\//,"").split("/");x="/"+E.replace(/^\//,"").split("/").slice(w.length).join("/")}let z=gw(n,{pathname:x}),g=Gw(z&&z.map(w=>Object.assign({},w,{params:Object.assign({},h,w.params),pathname:mi([p,s.encodeLocation?s.encodeLocation(w.pathname).pathname:w.pathname]),pathnameBase:w.pathnameBase==="/"?p:mi([p,s.encodeLocation?s.encodeLocation(w.pathnameBase).pathname:w.pathnameBase])})),c,o,l);return r&&g?j.createElement(Ss.Provider,{value:{location:ls({pathname:"/",search:"",hash:"",state:null,key:"default"},v),navigationType:Yn.Pop}},g):g}function Hw(){let n=Qw(),r=jw(n)?n.status+" "+n.statusText:n instanceof Error?n.message:JSON.stringify(n),o=n instanceof Error?n.stack:null,s={padding:"0.5rem",backgroundColor:"rgba(200,200,200, 0.5)"};return j.createElement(j.Fragment,null,j.createElement("h2",null,"Unexpected Application Error!"),j.createElement("h3",{style:{fontStyle:"italic"}},r),o?j.createElement("pre",{style:s},o):null,null)}const Zw=j.createElement(Hw,null);class Vw extends j.Component{constructor(r){super(r),this.state={location:r.location,revalidation:r.revalidation,error:r.error}}static getDerivedStateFromError(r){return{error:r}}static getDerivedStateFromProps(r,o){return o.location!==r.location||o.revalidation!=="idle"&&r.revalidation==="idle"?{error:r.error,location:r.location,revalidation:r.revalidation}:{error:r.error!==void 0?r.error:o.error,location:o.location,revalidation:r.revalidation||o.revalidation}}componentDidCatch(r,o){console.error("React Router caught the following error during render",r,o)}render(){return this.state.error!==void 0?j.createElement(Oo.Provider,{value:this.props.routeContext},j.createElement(Mv.Provider,{value:this.state.error,children:this.props.component})):this.props.children}}function qw(n){let{routeContext:r,match:o,children:l}=n,s=j.useContext(Mw);return s&&s.static&&s.staticContext&&(o.route.errorElement||o.route.ErrorBoundary)&&(s.staticContext._deepestRenderedBoundaryId=o.route.id),j.createElement(Oo.Provider,{value:r},l)}function Gw(n,r,o,l){var s;if(r===void 0&&(r=[]),o===void 0&&(o=null),l===void 0&&(l=null),n==null){var c;if(!o)return null;if(o.errors)n=o.matches;else if((c=l)!=null&&c.v7_partialHydration&&r.length===0&&!o.initialized&&o.matches.length>0)n=o.matches;else return null}let f=n,h=(s=o)==null?void 0:s.errors;if(h!=null){let v=f.findIndex(b=>b.route.id&&(h==null?void 0:h[b.route.id])!==void 0);v>=0||$t(!1),f=f.slice(0,Math.min(f.length,v+1))}let p=!1,m=-1;if(o&&l&&l.v7_partialHydration)for(let v=0;v<f.length;v++){let b=f[v];if((b.route.HydrateFallback||b.route.hydrateFallbackElement)&&(m=v),b.route.id){let{loaderData:E,errors:x}=o,z=b.route.loader&&E[b.route.id]===void 0&&(!x||x[b.route.id]===void 0);if(b.route.lazy||z){p=!0,m>=0?f=f.slice(0,m+1):f=[f[0]];break}}}return f.reduceRight((v,b,E)=>{let x,z=!1,g=null,w=null;o&&(x=h&&b.route.id?h[b.route.id]:void 0,g=b.route.errorElement||Zw,p&&(m<0&&E===0?(Fw("route-fallback"),z=!0,w=null):m===E&&(z=!0,w=b.route.hydrateFallbackElement||null)));let k=r.concat(f.slice(0,E+1)),A=()=>{let N;return x?N=g:z?N=w:b.route.Component?N=j.createElement(b.route.Component,null):b.route.element?N=b.route.element:N=v,j.createElement(qw,{match:b,routeContext:{outlet:v,matches:k,isDataRoute:o!=null},children:N})};return o&&(b.route.ErrorBoundary||b.route.errorElement||E===0)?j.createElement(Vw,{location:o.location,revalidation:o.revalidation,component:g,error:x,children:A(),routeContext:{outlet:null,matches:k,isDataRoute:!0}}):A()},null)}var Bv=(function(n){return n.UseBlocker="useBlocker",n.UseLoaderData="useLoaderData",n.UseActionData="useActionData",n.UseRouteError="useRouteError",n.UseNavigation="useNavigation",n.UseRouteLoaderData="useRouteLoaderData",n.UseMatches="useMatches",n.UseRevalidator="useRevalidator",n.UseNavigateStable="useNavigate",n.UseRouteId="useRouteId",n})(Bv||{});function Yw(n){let r=j.useContext(Dw);return r||$t(!1),r}function Iw(n){let r=j.useContext(Oo);return r||$t(!1),r}function Xw(n){let r=Iw(),o=r.matches[r.matches.length-1];return o.route.id||$t(!1),o.route.id}function Qw(){var n;let r=j.useContext(Mv),o=Yw(Bv.UseRouteError),l=Xw();return r!==void 0?r:(n=o.errors)==null?void 0:n[l]}const gg={};function Fw(n,r,o){gg[n]||(gg[n]=!0)}function Kw(n,r){n==null||n.v7_startTransition,n==null||n.v7_relativeSplatPath}function yr(n){$t(!1)}function Pw(n){let{basename:r="/",children:o=null,location:l,navigationType:s=Yn.Pop,navigator:c,static:f=!1,future:h}=n;Hd()&&$t(!1);let p=r.replace(/^\/*/,"/"),m=j.useMemo(()=>({basename:p,navigator:c,static:f,future:ls({v7_relativeSplatPath:!1},h)}),[p,h,c,f]);typeof l=="string"&&(l=_s(l));let{pathname:v="/",search:b="",hash:E="",state:x=null,key:z="default"}=l,g=j.useMemo(()=>{let w=Ov(v,p);return w==null?null:{location:{pathname:w,search:b,hash:E,state:x,key:z},navigationType:s}},[p,v,b,E,x,z,s]);return g==null?null:j.createElement(Rv.Provider,{value:m},j.createElement(Ss.Provider,{children:o,value:g}))}function Jw(n){let{children:r,location:o}=n;return Uw(gd(r),o)}new Promise(()=>{});function gd(n,r){r===void 0&&(r=[]);let o=[];return j.Children.forEach(n,(l,s)=>{if(!j.isValidElement(l))return;let c=[...r,s];if(l.type===j.Fragment){o.push.apply(o,gd(l.props.children,c));return}l.type!==yr&&$t(!1),!l.props.index||!l.props.children||$t(!1);let f={id:l.props.id||c.join("-"),caseSensitive:l.props.caseSensitive,element:l.props.element,Component:l.props.Component,index:l.props.index,path:l.props.path,loader:l.props.loader,action:l.props.action,errorElement:l.props.errorElement,ErrorBoundary:l.props.ErrorBoundary,hasErrorBoundary:l.props.ErrorBoundary!=null||l.props.errorElement!=null,shouldRevalidate:l.props.shouldRevalidate,handle:l.props.handle,lazy:l.props.lazy};l.props.children&&(f.children=gd(l.props.children,c)),o.push(f)}),o}/**
 * React Router DOM v6.30.3
 *
 * Copyright (c) Remix Software Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE.md file in the root directory of this source tree.
 *
 * @license MIT
 */const Ww="6";try{window.__reactRouterVersion=Ww}catch{}const $w="startTransition",vg=Ld[$w];function e1(n){let{basename:r,children:o,future:l,window:s}=n,c=j.useRef();c.current==null&&(c.current=hw({window:s,v5Compat:!0}));let f=c.current,[h,p]=j.useState({action:f.action,location:f.location}),{v7_startTransition:m}=l||{},v=j.useCallback(b=>{m&&vg?vg(()=>p(b)):p(b)},[p,m]);return j.useLayoutEffect(()=>f.listen(v),[f,v]),j.useEffect(()=>Kw(l),[l]),j.createElement(Pw,{basename:r,children:o,location:h.location,navigationType:h.action,navigator:f,future:l})}var bg;(function(n){n.UseScrollRestoration="useScrollRestoration",n.UseSubmit="useSubmit",n.UseSubmitFetcher="useSubmitFetcher",n.UseFetcher="useFetcher",n.useViewTransitionState="useViewTransitionState"})(bg||(bg={}));var yg;(function(n){n.UseFetcher="useFetcher",n.UseFetchers="useFetchers",n.UseScrollRestoration="useScrollRestoration"})(yg||(yg={}));function Uv(n){var r,o,l="";if(typeof n=="string"||typeof n=="number")l+=n;else if(typeof n=="object")if(Array.isArray(n)){var s=n.length;for(r=0;r<s;r++)n[r]&&(o=Uv(n[r]))&&(l&&(l+=" "),l+=o)}else for(o in n)n[o]&&(l&&(l+=" "),l+=o);return l}function t1(){for(var n,r,o=0,l="",s=arguments.length;o<s;o++)(n=arguments[o])&&(r=Uv(n))&&(l&&(l+=" "),l+=r);return l}const a1=(n,r)=>{const o=new Array(n.length+r.length);for(let l=0;l<n.length;l++)o[l]=n[l];for(let l=0;l<r.length;l++)o[n.length+l]=r[l];return o},n1=(n,r)=>({classGroupId:n,validator:r}),Lv=(n=new Map,r=null,o)=>({nextPart:n,validators:r,classGroupId:o}),ss="-",xg=[],r1="arbitrary..",i1=n=>{const r=l1(n),{conflictingClassGroups:o,conflictingClassGroupModifiers:l}=n;return{getClassGroupId:f=>{if(f.startsWith("[")&&f.endsWith("]"))return o1(f);const h=f.split(ss),p=h[0]===""&&h.length>1?1:0;return Hv(h,p,r)},getConflictingClassGroupIds:(f,h)=>{if(h){const p=l[f],m=o[f];return p?m?a1(m,p):p:m||xg}return o[f]||xg}}},Hv=(n,r,o)=>{if(n.length-r===0)return o.classGroupId;const s=n[r],c=o.nextPart.get(s);if(c){const m=Hv(n,r+1,c);if(m)return m}const f=o.validators;if(f===null)return;const h=r===0?n.join(ss):n.slice(r).join(ss),p=f.length;for(let m=0;m<p;m++){const v=f[m];if(v.validator(h))return v.classGroupId}},o1=n=>n.slice(1,-1).indexOf(":")===-1?void 0:(()=>{const r=n.slice(1,-1),o=r.indexOf(":"),l=r.slice(0,o);return l?r1+l:void 0})(),l1=n=>{const{theme:r,classGroups:o}=n;return s1(o,r)},s1=(n,r)=>{const o=Lv();for(const l in n){const s=n[l];Zd(s,o,l,r)}return o},Zd=(n,r,o,l)=>{const s=n.length;for(let c=0;c<s;c++){const f=n[c];c1(f,r,o,l)}},c1=(n,r,o,l)=>{if(typeof n=="string"){u1(n,r,o);return}if(typeof n=="function"){d1(n,r,o,l);return}f1(n,r,o,l)},u1=(n,r,o)=>{const l=n===""?r:Zv(r,n);l.classGroupId=o},d1=(n,r,o,l)=>{if(h1(n)){Zd(n(l),r,o,l);return}r.validators===null&&(r.validators=[]),r.validators.push(n1(o,n))},f1=(n,r,o,l)=>{const s=Object.entries(n),c=s.length;for(let f=0;f<c;f++){const[h,p]=s[f];Zd(p,Zv(r,h),o,l)}},Zv=(n,r)=>{let o=n;const l=r.split(ss),s=l.length;for(let c=0;c<s;c++){const f=l[c];let h=o.nextPart.get(f);h||(h=Lv(),o.nextPart.set(f,h)),o=h}return o},h1=n=>"isThemeGetter"in n&&n.isThemeGetter===!0,p1=n=>{if(n<1)return{get:()=>{},set:()=>{}};let r=0,o=Object.create(null),l=Object.create(null);const s=(c,f)=>{o[c]=f,r++,r>n&&(r=0,l=o,o=Object.create(null))};return{get(c){let f=o[c];if(f!==void 0)return f;if((f=l[c])!==void 0)return s(c,f),f},set(c,f){c in o?o[c]=f:s(c,f)}}},vd="!",wg=":",m1=[],_g=(n,r,o,l,s)=>({modifiers:n,hasImportantModifier:r,baseClassName:o,maybePostfixModifierPosition:l,isExternal:s}),g1=n=>{const{prefix:r,experimentalParseClassName:o}=n;let l=s=>{const c=[];let f=0,h=0,p=0,m;const v=s.length;for(let g=0;g<v;g++){const w=s[g];if(f===0&&h===0){if(w===wg){c.push(s.slice(p,g)),p=g+1;continue}if(w==="/"){m=g;continue}}w==="["?f++:w==="]"?f--:w==="("?h++:w===")"&&h--}const b=c.length===0?s:s.slice(p);let E=b,x=!1;b.endsWith(vd)?(E=b.slice(0,-1),x=!0):b.startsWith(vd)&&(E=b.slice(1),x=!0);const z=m&&m>p?m-p:void 0;return _g(c,x,E,z)};if(r){const s=r+wg,c=l;l=f=>f.startsWith(s)?c(f.slice(s.length)):_g(m1,!1,f,void 0,!0)}if(o){const s=l;l=c=>o({className:c,parseClassName:s})}return l},v1=n=>{const r=new Map;return n.orderSensitiveModifiers.forEach((o,l)=>{r.set(o,1e6+l)}),o=>{const l=[];let s=[];for(let c=0;c<o.length;c++){const f=o[c],h=f[0]==="[",p=r.has(f);h||p?(s.length>0&&(s.sort(),l.push(...s),s=[]),l.push(f)):s.push(f)}return s.length>0&&(s.sort(),l.push(...s)),l}},b1=n=>({cache:p1(n.cacheSize),parseClassName:g1(n),sortModifiers:v1(n),...i1(n)}),y1=/\s+/,x1=(n,r)=>{const{parseClassName:o,getClassGroupId:l,getConflictingClassGroupIds:s,sortModifiers:c}=r,f=[],h=n.trim().split(y1);let p="";for(let m=h.length-1;m>=0;m-=1){const v=h[m],{isExternal:b,modifiers:E,hasImportantModifier:x,baseClassName:z,maybePostfixModifierPosition:g}=o(v);if(b){p=v+(p.length>0?" "+p:p);continue}let w=!!g,k=l(w?z.substring(0,g):z);if(!k){if(!w){p=v+(p.length>0?" "+p:p);continue}if(k=l(z),!k){p=v+(p.length>0?" "+p:p);continue}w=!1}const A=E.length===0?"":E.length===1?E[0]:c(E).join(":"),N=x?A+vd:A,R=N+k;if(f.indexOf(R)>-1)continue;f.push(R);const U=s(k,w);for(let Y=0;Y<U.length;++Y){const H=U[Y];f.push(N+H)}p=v+(p.length>0?" "+p:p)}return p},w1=(...n)=>{let r=0,o,l,s="";for(;r<n.length;)(o=n[r++])&&(l=Vv(o))&&(s&&(s+=" "),s+=l);return s},Vv=n=>{if(typeof n=="string")return n;let r,o="";for(let l=0;l<n.length;l++)n[l]&&(r=Vv(n[l]))&&(o&&(o+=" "),o+=r);return o},_1=(n,...r)=>{let o,l,s,c;const f=p=>{const m=r.reduce((v,b)=>b(v),n());return o=b1(m),l=o.cache.get,s=o.cache.set,c=h,h(p)},h=p=>{const m=l(p);if(m)return m;const v=x1(p,o);return s(p,v),v};return c=f,(...p)=>c(w1(...p))},S1=[],jt=n=>{const r=o=>o[n]||S1;return r.isThemeGetter=!0,r},qv=/^\[(?:(\w[\w-]*):)?(.+)\]$/i,Gv=/^\((?:(\w[\w-]*):)?(.+)\)$/i,k1=/^\d+\/\d+$/,E1=/^(\d+(\.\d+)?)?(xs|sm|md|lg|xl)$/,z1=/\d+(%|px|r?em|[sdl]?v([hwib]|min|max)|pt|pc|in|cm|mm|cap|ch|ex|r?lh|cq(w|h|i|b|min|max))|\b(calc|min|max|clamp)\(.+\)|^0$/,C1=/^(rgba?|hsla?|hwb|(ok)?(lab|lch)|color-mix)\(.+\)$/,A1=/^(inset_)?-?((\d+)?\.?(\d+)[a-z]+|0)_-?((\d+)?\.?(\d+)[a-z]+|0)/,T1=/^(url|image|image-set|cross-fade|element|(repeating-)?(linear|radial|conic)-gradient)\(.+\)$/,ui=n=>k1.test(n),Ie=n=>!!n&&!Number.isNaN(Number(n)),Zn=n=>!!n&&Number.isInteger(Number(n)),td=n=>n.endsWith("%")&&Ie(n.slice(0,-1)),un=n=>E1.test(n),N1=()=>!0,O1=n=>z1.test(n)&&!C1.test(n),Yv=()=>!1,j1=n=>A1.test(n),R1=n=>T1.test(n),M1=n=>!Ae(n)&&!Te(n),D1=n=>Si(n,Qv,Yv),Ae=n=>qv.test(n),br=n=>Si(n,Fv,O1),ad=n=>Si(n,Z1,Ie),Sg=n=>Si(n,Iv,Yv),B1=n=>Si(n,Xv,R1),Ql=n=>Si(n,Kv,j1),Te=n=>Gv.test(n),_o=n=>ki(n,Fv),U1=n=>ki(n,V1),kg=n=>ki(n,Iv),L1=n=>ki(n,Qv),H1=n=>ki(n,Xv),Fl=n=>ki(n,Kv,!0),Si=(n,r,o)=>{const l=qv.exec(n);return l?l[1]?r(l[1]):o(l[2]):!1},ki=(n,r,o=!1)=>{const l=Gv.exec(n);return l?l[1]?r(l[1]):o:!1},Iv=n=>n==="position"||n==="percentage",Xv=n=>n==="image"||n==="url",Qv=n=>n==="length"||n==="size"||n==="bg-size",Fv=n=>n==="length",Z1=n=>n==="number",V1=n=>n==="family-name",Kv=n=>n==="shadow",q1=()=>{const n=jt("color"),r=jt("font"),o=jt("text"),l=jt("font-weight"),s=jt("tracking"),c=jt("leading"),f=jt("breakpoint"),h=jt("container"),p=jt("spacing"),m=jt("radius"),v=jt("shadow"),b=jt("inset-shadow"),E=jt("text-shadow"),x=jt("drop-shadow"),z=jt("blur"),g=jt("perspective"),w=jt("aspect"),k=jt("ease"),A=jt("animate"),N=()=>["auto","avoid","all","avoid-page","page","left","right","column"],R=()=>["center","top","bottom","left","right","top-left","left-top","top-right","right-top","bottom-right","right-bottom","bottom-left","left-bottom"],U=()=>[...R(),Te,Ae],Y=()=>["auto","hidden","clip","visible","scroll"],H=()=>["auto","contain","none"],I=()=>[Te,Ae,p],K=()=>[ui,"full","auto",...I()],se=()=>[Zn,"none","subgrid",Te,Ae],ge=()=>["auto",{span:["full",Zn,Te,Ae]},Zn,Te,Ae],B=()=>[Zn,"auto",Te,Ae],W=()=>["auto","min","max","fr",Te,Ae],C=()=>["start","end","center","between","around","evenly","stretch","baseline","center-safe","end-safe"],ae=()=>["start","end","center","stretch","center-safe","end-safe"],V=()=>["auto",...I()],q=()=>[ui,"auto","full","dvw","dvh","lvw","lvh","svw","svh","min","max","fit",...I()],Q=()=>[n,Te,Ae],ne=()=>[...R(),kg,Sg,{position:[Te,Ae]}],ve=()=>["no-repeat",{repeat:["","x","y","space","round"]}],O=()=>["auto","cover","contain",L1,D1,{size:[Te,Ae]}],D=()=>[td,_o,br],re=()=>["","none","full",m,Te,Ae],ee=()=>["",Ie,_o,br],le=()=>["solid","dashed","dotted","double"],Ee=()=>["normal","multiply","screen","overlay","darken","lighten","color-dodge","color-burn","hard-light","soft-light","difference","exclusion","hue","saturation","color","luminosity"],he=()=>[Ie,td,kg,Sg],Se=()=>["","none",z,Te,Ae],ke=()=>["none",Ie,Te,Ae],Me=()=>["none",Ie,Te,Ae],Re=()=>[Ie,Te,Ae],Le=()=>[ui,"full",...I()];return{cacheSize:500,theme:{animate:["spin","ping","pulse","bounce"],aspect:["video"],blur:[un],breakpoint:[un],color:[N1],container:[un],"drop-shadow":[un],ease:["in","out","in-out"],font:[M1],"font-weight":["thin","extralight","light","normal","medium","semibold","bold","extrabold","black"],"inset-shadow":[un],leading:["none","tight","snug","normal","relaxed","loose"],perspective:["dramatic","near","normal","midrange","distant","none"],radius:[un],shadow:[un],spacing:["px",Ie],text:[un],"text-shadow":[un],tracking:["tighter","tight","normal","wide","wider","widest"]},classGroups:{aspect:[{aspect:["auto","square",ui,Ae,Te,w]}],container:["container"],columns:[{columns:[Ie,Ae,Te,h]}],"break-after":[{"break-after":N()}],"break-before":[{"break-before":N()}],"break-inside":[{"break-inside":["auto","avoid","avoid-page","avoid-column"]}],"box-decoration":[{"box-decoration":["slice","clone"]}],box:[{box:["border","content"]}],display:["block","inline-block","inline","flex","inline-flex","table","inline-table","table-caption","table-cell","table-column","table-column-group","table-footer-group","table-header-group","table-row-group","table-row","flow-root","grid","inline-grid","contents","list-item","hidden"],sr:["sr-only","not-sr-only"],float:[{float:["right","left","none","start","end"]}],clear:[{clear:["left","right","both","none","start","end"]}],isolation:["isolate","isolation-auto"],"object-fit":[{object:["contain","cover","fill","none","scale-down"]}],"object-position":[{object:U()}],overflow:[{overflow:Y()}],"overflow-x":[{"overflow-x":Y()}],"overflow-y":[{"overflow-y":Y()}],overscroll:[{overscroll:H()}],"overscroll-x":[{"overscroll-x":H()}],"overscroll-y":[{"overscroll-y":H()}],position:["static","fixed","absolute","relative","sticky"],inset:[{inset:K()}],"inset-x":[{"inset-x":K()}],"inset-y":[{"inset-y":K()}],start:[{start:K()}],end:[{end:K()}],top:[{top:K()}],right:[{right:K()}],bottom:[{bottom:K()}],left:[{left:K()}],visibility:["visible","invisible","collapse"],z:[{z:[Zn,"auto",Te,Ae]}],basis:[{basis:[ui,"full","auto",h,...I()]}],"flex-direction":[{flex:["row","row-reverse","col","col-reverse"]}],"flex-wrap":[{flex:["nowrap","wrap","wrap-reverse"]}],flex:[{flex:[Ie,ui,"auto","initial","none",Ae]}],grow:[{grow:["",Ie,Te,Ae]}],shrink:[{shrink:["",Ie,Te,Ae]}],order:[{order:[Zn,"first","last","none",Te,Ae]}],"grid-cols":[{"grid-cols":se()}],"col-start-end":[{col:ge()}],"col-start":[{"col-start":B()}],"col-end":[{"col-end":B()}],"grid-rows":[{"grid-rows":se()}],"row-start-end":[{row:ge()}],"row-start":[{"row-start":B()}],"row-end":[{"row-end":B()}],"grid-flow":[{"grid-flow":["row","col","dense","row-dense","col-dense"]}],"auto-cols":[{"auto-cols":W()}],"auto-rows":[{"auto-rows":W()}],gap:[{gap:I()}],"gap-x":[{"gap-x":I()}],"gap-y":[{"gap-y":I()}],"justify-content":[{justify:[...C(),"normal"]}],"justify-items":[{"justify-items":[...ae(),"normal"]}],"justify-self":[{"justify-self":["auto",...ae()]}],"align-content":[{content:["normal",...C()]}],"align-items":[{items:[...ae(),{baseline:["","last"]}]}],"align-self":[{self:["auto",...ae(),{baseline:["","last"]}]}],"place-content":[{"place-content":C()}],"place-items":[{"place-items":[...ae(),"baseline"]}],"place-self":[{"place-self":["auto",...ae()]}],p:[{p:I()}],px:[{px:I()}],py:[{py:I()}],ps:[{ps:I()}],pe:[{pe:I()}],pt:[{pt:I()}],pr:[{pr:I()}],pb:[{pb:I()}],pl:[{pl:I()}],m:[{m:V()}],mx:[{mx:V()}],my:[{my:V()}],ms:[{ms:V()}],me:[{me:V()}],mt:[{mt:V()}],mr:[{mr:V()}],mb:[{mb:V()}],ml:[{ml:V()}],"space-x":[{"space-x":I()}],"space-x-reverse":["space-x-reverse"],"space-y":[{"space-y":I()}],"space-y-reverse":["space-y-reverse"],size:[{size:q()}],w:[{w:[h,"screen",...q()]}],"min-w":[{"min-w":[h,"screen","none",...q()]}],"max-w":[{"max-w":[h,"screen","none","prose",{screen:[f]},...q()]}],h:[{h:["screen","lh",...q()]}],"min-h":[{"min-h":["screen","lh","none",...q()]}],"max-h":[{"max-h":["screen","lh",...q()]}],"font-size":[{text:["base",o,_o,br]}],"font-smoothing":["antialiased","subpixel-antialiased"],"font-style":["italic","not-italic"],"font-weight":[{font:[l,Te,ad]}],"font-stretch":[{"font-stretch":["ultra-condensed","extra-condensed","condensed","semi-condensed","normal","semi-expanded","expanded","extra-expanded","ultra-expanded",td,Ae]}],"font-family":[{font:[U1,Ae,r]}],"fvn-normal":["normal-nums"],"fvn-ordinal":["ordinal"],"fvn-slashed-zero":["slashed-zero"],"fvn-figure":["lining-nums","oldstyle-nums"],"fvn-spacing":["proportional-nums","tabular-nums"],"fvn-fraction":["diagonal-fractions","stacked-fractions"],tracking:[{tracking:[s,Te,Ae]}],"line-clamp":[{"line-clamp":[Ie,"none",Te,ad]}],leading:[{leading:[c,...I()]}],"list-image":[{"list-image":["none",Te,Ae]}],"list-style-position":[{list:["inside","outside"]}],"list-style-type":[{list:["disc","decimal","none",Te,Ae]}],"text-alignment":[{text:["left","center","right","justify","start","end"]}],"placeholder-color":[{placeholder:Q()}],"text-color":[{text:Q()}],"text-decoration":["underline","overline","line-through","no-underline"],"text-decoration-style":[{decoration:[...le(),"wavy"]}],"text-decoration-thickness":[{decoration:[Ie,"from-font","auto",Te,br]}],"text-decoration-color":[{decoration:Q()}],"underline-offset":[{"underline-offset":[Ie,"auto",Te,Ae]}],"text-transform":["uppercase","lowercase","capitalize","normal-case"],"text-overflow":["truncate","text-ellipsis","text-clip"],"text-wrap":[{text:["wrap","nowrap","balance","pretty"]}],indent:[{indent:I()}],"vertical-align":[{align:["baseline","top","middle","bottom","text-top","text-bottom","sub","super",Te,Ae]}],whitespace:[{whitespace:["normal","nowrap","pre","pre-line","pre-wrap","break-spaces"]}],break:[{break:["normal","words","all","keep"]}],wrap:[{wrap:["break-word","anywhere","normal"]}],hyphens:[{hyphens:["none","manual","auto"]}],content:[{content:["none",Te,Ae]}],"bg-attachment":[{bg:["fixed","local","scroll"]}],"bg-clip":[{"bg-clip":["border","padding","content","text"]}],"bg-origin":[{"bg-origin":["border","padding","content"]}],"bg-position":[{bg:ne()}],"bg-repeat":[{bg:ve()}],"bg-size":[{bg:O()}],"bg-image":[{bg:["none",{linear:[{to:["t","tr","r","br","b","bl","l","tl"]},Zn,Te,Ae],radial:["",Te,Ae],conic:[Zn,Te,Ae]},H1,B1]}],"bg-color":[{bg:Q()}],"gradient-from-pos":[{from:D()}],"gradient-via-pos":[{via:D()}],"gradient-to-pos":[{to:D()}],"gradient-from":[{from:Q()}],"gradient-via":[{via:Q()}],"gradient-to":[{to:Q()}],rounded:[{rounded:re()}],"rounded-s":[{"rounded-s":re()}],"rounded-e":[{"rounded-e":re()}],"rounded-t":[{"rounded-t":re()}],"rounded-r":[{"rounded-r":re()}],"rounded-b":[{"rounded-b":re()}],"rounded-l":[{"rounded-l":re()}],"rounded-ss":[{"rounded-ss":re()}],"rounded-se":[{"rounded-se":re()}],"rounded-ee":[{"rounded-ee":re()}],"rounded-es":[{"rounded-es":re()}],"rounded-tl":[{"rounded-tl":re()}],"rounded-tr":[{"rounded-tr":re()}],"rounded-br":[{"rounded-br":re()}],"rounded-bl":[{"rounded-bl":re()}],"border-w":[{border:ee()}],"border-w-x":[{"border-x":ee()}],"border-w-y":[{"border-y":ee()}],"border-w-s":[{"border-s":ee()}],"border-w-e":[{"border-e":ee()}],"border-w-t":[{"border-t":ee()}],"border-w-r":[{"border-r":ee()}],"border-w-b":[{"border-b":ee()}],"border-w-l":[{"border-l":ee()}],"divide-x":[{"divide-x":ee()}],"divide-x-reverse":["divide-x-reverse"],"divide-y":[{"divide-y":ee()}],"divide-y-reverse":["divide-y-reverse"],"border-style":[{border:[...le(),"hidden","none"]}],"divide-style":[{divide:[...le(),"hidden","none"]}],"border-color":[{border:Q()}],"border-color-x":[{"border-x":Q()}],"border-color-y":[{"border-y":Q()}],"border-color-s":[{"border-s":Q()}],"border-color-e":[{"border-e":Q()}],"border-color-t":[{"border-t":Q()}],"border-color-r":[{"border-r":Q()}],"border-color-b":[{"border-b":Q()}],"border-color-l":[{"border-l":Q()}],"divide-color":[{divide:Q()}],"outline-style":[{outline:[...le(),"none","hidden"]}],"outline-offset":[{"outline-offset":[Ie,Te,Ae]}],"outline-w":[{outline:["",Ie,_o,br]}],"outline-color":[{outline:Q()}],shadow:[{shadow:["","none",v,Fl,Ql]}],"shadow-color":[{shadow:Q()}],"inset-shadow":[{"inset-shadow":["none",b,Fl,Ql]}],"inset-shadow-color":[{"inset-shadow":Q()}],"ring-w":[{ring:ee()}],"ring-w-inset":["ring-inset"],"ring-color":[{ring:Q()}],"ring-offset-w":[{"ring-offset":[Ie,br]}],"ring-offset-color":[{"ring-offset":Q()}],"inset-ring-w":[{"inset-ring":ee()}],"inset-ring-color":[{"inset-ring":Q()}],"text-shadow":[{"text-shadow":["none",E,Fl,Ql]}],"text-shadow-color":[{"text-shadow":Q()}],opacity:[{opacity:[Ie,Te,Ae]}],"mix-blend":[{"mix-blend":[...Ee(),"plus-darker","plus-lighter"]}],"bg-blend":[{"bg-blend":Ee()}],"mask-clip":[{"mask-clip":["border","padding","content","fill","stroke","view"]},"mask-no-clip"],"mask-composite":[{mask:["add","subtract","intersect","exclude"]}],"mask-image-linear-pos":[{"mask-linear":[Ie]}],"mask-image-linear-from-pos":[{"mask-linear-from":he()}],"mask-image-linear-to-pos":[{"mask-linear-to":he()}],"mask-image-linear-from-color":[{"mask-linear-from":Q()}],"mask-image-linear-to-color":[{"mask-linear-to":Q()}],"mask-image-t-from-pos":[{"mask-t-from":he()}],"mask-image-t-to-pos":[{"mask-t-to":he()}],"mask-image-t-from-color":[{"mask-t-from":Q()}],"mask-image-t-to-color":[{"mask-t-to":Q()}],"mask-image-r-from-pos":[{"mask-r-from":he()}],"mask-image-r-to-pos":[{"mask-r-to":he()}],"mask-image-r-from-color":[{"mask-r-from":Q()}],"mask-image-r-to-color":[{"mask-r-to":Q()}],"mask-image-b-from-pos":[{"mask-b-from":he()}],"mask-image-b-to-pos":[{"mask-b-to":he()}],"mask-image-b-from-color":[{"mask-b-from":Q()}],"mask-image-b-to-color":[{"mask-b-to":Q()}],"mask-image-l-from-pos":[{"mask-l-from":he()}],"mask-image-l-to-pos":[{"mask-l-to":he()}],"mask-image-l-from-color":[{"mask-l-from":Q()}],"mask-image-l-to-color":[{"mask-l-to":Q()}],"mask-image-x-from-pos":[{"mask-x-from":he()}],"mask-image-x-to-pos":[{"mask-x-to":he()}],"mask-image-x-from-color":[{"mask-x-from":Q()}],"mask-image-x-to-color":[{"mask-x-to":Q()}],"mask-image-y-from-pos":[{"mask-y-from":he()}],"mask-image-y-to-pos":[{"mask-y-to":he()}],"mask-image-y-from-color":[{"mask-y-from":Q()}],"mask-image-y-to-color":[{"mask-y-to":Q()}],"mask-image-radial":[{"mask-radial":[Te,Ae]}],"mask-image-radial-from-pos":[{"mask-radial-from":he()}],"mask-image-radial-to-pos":[{"mask-radial-to":he()}],"mask-image-radial-from-color":[{"mask-radial-from":Q()}],"mask-image-radial-to-color":[{"mask-radial-to":Q()}],"mask-image-radial-shape":[{"mask-radial":["circle","ellipse"]}],"mask-image-radial-size":[{"mask-radial":[{closest:["side","corner"],farthest:["side","corner"]}]}],"mask-image-radial-pos":[{"mask-radial-at":R()}],"mask-image-conic-pos":[{"mask-conic":[Ie]}],"mask-image-conic-from-pos":[{"mask-conic-from":he()}],"mask-image-conic-to-pos":[{"mask-conic-to":he()}],"mask-image-conic-from-color":[{"mask-conic-from":Q()}],"mask-image-conic-to-color":[{"mask-conic-to":Q()}],"mask-mode":[{mask:["alpha","luminance","match"]}],"mask-origin":[{"mask-origin":["border","padding","content","fill","stroke","view"]}],"mask-position":[{mask:ne()}],"mask-repeat":[{mask:ve()}],"mask-size":[{mask:O()}],"mask-type":[{"mask-type":["alpha","luminance"]}],"mask-image":[{mask:["none",Te,Ae]}],filter:[{filter:["","none",Te,Ae]}],blur:[{blur:Se()}],brightness:[{brightness:[Ie,Te,Ae]}],contrast:[{contrast:[Ie,Te,Ae]}],"drop-shadow":[{"drop-shadow":["","none",x,Fl,Ql]}],"drop-shadow-color":[{"drop-shadow":Q()}],grayscale:[{grayscale:["",Ie,Te,Ae]}],"hue-rotate":[{"hue-rotate":[Ie,Te,Ae]}],invert:[{invert:["",Ie,Te,Ae]}],saturate:[{saturate:[Ie,Te,Ae]}],sepia:[{sepia:["",Ie,Te,Ae]}],"backdrop-filter":[{"backdrop-filter":["","none",Te,Ae]}],"backdrop-blur":[{"backdrop-blur":Se()}],"backdrop-brightness":[{"backdrop-brightness":[Ie,Te,Ae]}],"backdrop-contrast":[{"backdrop-contrast":[Ie,Te,Ae]}],"backdrop-grayscale":[{"backdrop-grayscale":["",Ie,Te,Ae]}],"backdrop-hue-rotate":[{"backdrop-hue-rotate":[Ie,Te,Ae]}],"backdrop-invert":[{"backdrop-invert":["",Ie,Te,Ae]}],"backdrop-opacity":[{"backdrop-opacity":[Ie,Te,Ae]}],"backdrop-saturate":[{"backdrop-saturate":[Ie,Te,Ae]}],"backdrop-sepia":[{"backdrop-sepia":["",Ie,Te,Ae]}],"border-collapse":[{border:["collapse","separate"]}],"border-spacing":[{"border-spacing":I()}],"border-spacing-x":[{"border-spacing-x":I()}],"border-spacing-y":[{"border-spacing-y":I()}],"table-layout":[{table:["auto","fixed"]}],caption:[{caption:["top","bottom"]}],transition:[{transition:["","all","colors","opacity","shadow","transform","none",Te,Ae]}],"transition-behavior":[{transition:["normal","discrete"]}],duration:[{duration:[Ie,"initial",Te,Ae]}],ease:[{ease:["linear","initial",k,Te,Ae]}],delay:[{delay:[Ie,Te,Ae]}],animate:[{animate:["none",A,Te,Ae]}],backface:[{backface:["hidden","visible"]}],perspective:[{perspective:[g,Te,Ae]}],"perspective-origin":[{"perspective-origin":U()}],rotate:[{rotate:ke()}],"rotate-x":[{"rotate-x":ke()}],"rotate-y":[{"rotate-y":ke()}],"rotate-z":[{"rotate-z":ke()}],scale:[{scale:Me()}],"scale-x":[{"scale-x":Me()}],"scale-y":[{"scale-y":Me()}],"scale-z":[{"scale-z":Me()}],"scale-3d":["scale-3d"],skew:[{skew:Re()}],"skew-x":[{"skew-x":Re()}],"skew-y":[{"skew-y":Re()}],transform:[{transform:[Te,Ae,"","none","gpu","cpu"]}],"transform-origin":[{origin:U()}],"transform-style":[{transform:["3d","flat"]}],translate:[{translate:Le()}],"translate-x":[{"translate-x":Le()}],"translate-y":[{"translate-y":Le()}],"translate-z":[{"translate-z":Le()}],"translate-none":["translate-none"],accent:[{accent:Q()}],appearance:[{appearance:["none","auto"]}],"caret-color":[{caret:Q()}],"color-scheme":[{scheme:["normal","dark","light","light-dark","only-dark","only-light"]}],cursor:[{cursor:["auto","default","pointer","wait","text","move","help","not-allowed","none","context-menu","progress","cell","crosshair","vertical-text","alias","copy","no-drop","grab","grabbing","all-scroll","col-resize","row-resize","n-resize","e-resize","s-resize","w-resize","ne-resize","nw-resize","se-resize","sw-resize","ew-resize","ns-resize","nesw-resize","nwse-resize","zoom-in","zoom-out",Te,Ae]}],"field-sizing":[{"field-sizing":["fixed","content"]}],"pointer-events":[{"pointer-events":["auto","none"]}],resize:[{resize:["none","","y","x"]}],"scroll-behavior":[{scroll:["auto","smooth"]}],"scroll-m":[{"scroll-m":I()}],"scroll-mx":[{"scroll-mx":I()}],"scroll-my":[{"scroll-my":I()}],"scroll-ms":[{"scroll-ms":I()}],"scroll-me":[{"scroll-me":I()}],"scroll-mt":[{"scroll-mt":I()}],"scroll-mr":[{"scroll-mr":I()}],"scroll-mb":[{"scroll-mb":I()}],"scroll-ml":[{"scroll-ml":I()}],"scroll-p":[{"scroll-p":I()}],"scroll-px":[{"scroll-px":I()}],"scroll-py":[{"scroll-py":I()}],"scroll-ps":[{"scroll-ps":I()}],"scroll-pe":[{"scroll-pe":I()}],"scroll-pt":[{"scroll-pt":I()}],"scroll-pr":[{"scroll-pr":I()}],"scroll-pb":[{"scroll-pb":I()}],"scroll-pl":[{"scroll-pl":I()}],"snap-align":[{snap:["start","end","center","align-none"]}],"snap-stop":[{snap:["normal","always"]}],"snap-type":[{snap:["none","x","y","both"]}],"snap-strictness":[{snap:["mandatory","proximity"]}],touch:[{touch:["auto","none","manipulation"]}],"touch-x":[{"touch-pan":["x","left","right"]}],"touch-y":[{"touch-pan":["y","up","down"]}],"touch-pz":["touch-pinch-zoom"],select:[{select:["none","text","all","auto"]}],"will-change":[{"will-change":["auto","scroll","contents","transform",Te,Ae]}],fill:[{fill:["none",...Q()]}],"stroke-w":[{stroke:[Ie,_o,br,ad]}],stroke:[{stroke:["none",...Q()]}],"forced-color-adjust":[{"forced-color-adjust":["auto","none"]}]},conflictingClassGroups:{overflow:["overflow-x","overflow-y"],overscroll:["overscroll-x","overscroll-y"],inset:["inset-x","inset-y","start","end","top","right","bottom","left"],"inset-x":["right","left"],"inset-y":["top","bottom"],flex:["basis","grow","shrink"],gap:["gap-x","gap-y"],p:["px","py","ps","pe","pt","pr","pb","pl"],px:["pr","pl"],py:["pt","pb"],m:["mx","my","ms","me","mt","mr","mb","ml"],mx:["mr","ml"],my:["mt","mb"],size:["w","h"],"font-size":["leading"],"fvn-normal":["fvn-ordinal","fvn-slashed-zero","fvn-figure","fvn-spacing","fvn-fraction"],"fvn-ordinal":["fvn-normal"],"fvn-slashed-zero":["fvn-normal"],"fvn-figure":["fvn-normal"],"fvn-spacing":["fvn-normal"],"fvn-fraction":["fvn-normal"],"line-clamp":["display","overflow"],rounded:["rounded-s","rounded-e","rounded-t","rounded-r","rounded-b","rounded-l","rounded-ss","rounded-se","rounded-ee","rounded-es","rounded-tl","rounded-tr","rounded-br","rounded-bl"],"rounded-s":["rounded-ss","rounded-es"],"rounded-e":["rounded-se","rounded-ee"],"rounded-t":["rounded-tl","rounded-tr"],"rounded-r":["rounded-tr","rounded-br"],"rounded-b":["rounded-br","rounded-bl"],"rounded-l":["rounded-tl","rounded-bl"],"border-spacing":["border-spacing-x","border-spacing-y"],"border-w":["border-w-x","border-w-y","border-w-s","border-w-e","border-w-t","border-w-r","border-w-b","border-w-l"],"border-w-x":["border-w-r","border-w-l"],"border-w-y":["border-w-t","border-w-b"],"border-color":["border-color-x","border-color-y","border-color-s","border-color-e","border-color-t","border-color-r","border-color-b","border-color-l"],"border-color-x":["border-color-r","border-color-l"],"border-color-y":["border-color-t","border-color-b"],translate:["translate-x","translate-y","translate-none"],"translate-none":["translate","translate-x","translate-y","translate-z"],"scroll-m":["scroll-mx","scroll-my","scroll-ms","scroll-me","scroll-mt","scroll-mr","scroll-mb","scroll-ml"],"scroll-mx":["scroll-mr","scroll-ml"],"scroll-my":["scroll-mt","scroll-mb"],"scroll-p":["scroll-px","scroll-py","scroll-ps","scroll-pe","scroll-pt","scroll-pr","scroll-pb","scroll-pl"],"scroll-px":["scroll-pr","scroll-pl"],"scroll-py":["scroll-pt","scroll-pb"],touch:["touch-x","touch-y","touch-pz"],"touch-x":["touch"],"touch-y":["touch"],"touch-pz":["touch"]},conflictingClassGroupModifiers:{"font-size":["leading"]},orderSensitiveModifiers:["*","**","after","backdrop","before","details-content","file","first-letter","first-line","marker","placeholder","selection"]}},G1=_1(q1);function nt(...n){return G1(t1(n))}const Y1=({data:n,menu:r})=>{const[o,l]=j.useState(!1),[s,c]=j.useState(!1);return j.useEffect(()=>{const f=()=>c(window.scrollY>40);return window.addEventListener("scroll",f,{passive:!0}),()=>window.removeEventListener("scroll",f)},[]),_.jsxs("header",{style:{"--local-bg":"rgba(6,13,27,0.92)","--local-text":"var(--foreground)","--local-text-muted":"var(--muted-foreground)","--local-primary":"var(--primary)","--local-accent":"var(--color-accent, #60a5fa)","--local-border":"rgba(59,130,246,0.08)"},className:nt("w-full py-4 transition-all duration-300 z-0",s?"bg-[var(--local-bg)] backdrop-blur-[20px] border-b border-[var(--local-border)]":"bg-transparent border-b border-transparent"),children:[_.jsxs("div",{className:"max-w-[1200px] mx-auto px-8 flex justify-between items-center",children:[_.jsxs("a",{href:"/",className:"flex items-center gap-2.5 no-underline font-bold text-xl tracking-tight text-[var(--local-text)]",children:[n.logoIconText&&_.jsx("div",{className:"w-8 h-8 rounded-md bg-gradient-to-br from-[var(--local-primary)] to-[var(--local-accent)] flex items-center justify-center font-mono text-[0.8rem] font-bold text-[var(--background)]",children:n.logoIconText}),_.jsxs("span",{children:[n.logoText,n.logoHighlight&&_.jsx("span",{className:"text-[var(--local-accent)]",children:n.logoHighlight})]})]}),_.jsx("nav",{className:"hidden md:flex items-center gap-10",children:r.map((f,h)=>_.jsx("a",{href:f.href,target:f.external?"_blank":void 0,rel:f.external?"noopener noreferrer":void 0,className:nt("no-underline text-sm font-medium transition-colors",f.isCta?"bg-[var(--local-primary)] text-white px-5 py-2 rounded-lg font-semibold hover:brightness-110 hover:-translate-y-px":"text-[var(--local-text-muted)] hover:text-[var(--local-text)]"),children:f.label},h))}),_.jsx("button",{className:"md:hidden p-2 text-[var(--local-text-muted)] hover:text-[var(--local-text)]",onClick:()=>l(!o),"aria-label":o?"Close menu":"Open menu",children:_.jsx("svg",{width:"24",height:"24",viewBox:"0 0 24 24",fill:"none",stroke:"currentColor",strokeWidth:"2",strokeLinecap:"round",strokeLinejoin:"round",children:o?_.jsxs(_.Fragment,{children:[_.jsx("line",{x1:"18",y1:"6",x2:"6",y2:"18"}),_.jsx("line",{x1:"6",y1:"6",x2:"18",y2:"18"})]}):_.jsxs(_.Fragment,{children:[_.jsx("line",{x1:"3",y1:"12",x2:"21",y2:"12"}),_.jsx("line",{x1:"3",y1:"6",x2:"21",y2:"6"}),_.jsx("line",{x1:"3",y1:"18",x2:"21",y2:"18"})]})})})]}),o&&_.jsx("nav",{className:"md:hidden border-t border-[var(--local-border)] bg-[var(--local-bg)] backdrop-blur-[20px]",children:_.jsx("div",{className:"max-w-[1200px] mx-auto px-8 py-4 flex flex-col gap-4",children:r.map((f,h)=>_.jsx("a",{href:f.href,className:"text-base font-medium text-[var(--local-text-muted)] hover:text-[var(--local-text)] transition-colors py-2 no-underline",onClick:()=>l(!1),children:f.label},h))})})]})},I1=({data:n})=>_.jsx("footer",{style:{"--local-bg":"var(--background)","--local-text":"var(--foreground)","--local-text-muted":"var(--muted-foreground)","--local-accent":"var(--color-accent, #60a5fa)","--local-border":"rgba(255,255,255,0.05)"},className:"py-12 border-t border-[var(--local-border)] bg-[var(--local-bg)] relative z-0",children:_.jsx("div",{className:"max-w-[1200px] mx-auto px-8",children:_.jsxs("div",{className:"flex flex-col md:flex-row items-center justify-between gap-4",children:[_.jsxs("div",{className:"flex items-center gap-2 font-bold text-[0.9rem] text-[var(--local-text-muted)]",children:[n.brandText,n.brandHighlight&&_.jsx("span",{className:"text-[var(--local-accent)]",children:n.brandHighlight})]}),n.links&&n.links.length>0&&_.jsx("nav",{className:"flex gap-6",children:n.links.map((r,o)=>_.jsx("a",{href:r.href,className:"text-[0.82rem] text-[var(--local-text-muted)] hover:text-[var(--local-accent)] transition-colors no-underline",children:r.label},o))}),_.jsx("div",{className:"text-[0.8rem] text-[var(--local-text-muted)] opacity-60",children:n.copyright})]})})}),X1=({data:n})=>_.jsxs("section",{style:{"--local-bg":"var(--background)","--local-text":"var(--foreground)","--local-text-muted":"var(--muted-foreground)","--local-primary":"var(--primary)","--local-accent":"var(--color-accent, #60a5fa)","--local-cyan":"var(--color-secondary, #22d3ee)","--local-border":"var(--border)"},className:"jp-hero relative z-0 min-h-screen flex items-center overflow-hidden pt-24 bg-[var(--local-bg)]",children:[_.jsx("div",{className:"absolute -top-[40%] -right-[20%] w-[70vw] h-[70vw] rounded-full bg-[radial-gradient(circle,rgba(59,130,246,0.06)_0%,transparent_70%)] pointer-events-none"}),_.jsx("div",{className:"absolute -bottom-[10%] -left-[10%] w-[50vw] h-[50vw] rounded-full bg-[radial-gradient(circle,rgba(34,211,238,0.03)_0%,transparent_60%)] pointer-events-none"}),_.jsx("div",{className:"relative z-[2] max-w-[1200px] mx-auto px-8 w-full",children:_.jsxs("div",{className:"max-w-[820px]",children:[n.badge&&_.jsxs("div",{className:"inline-flex items-center gap-2 bg-[rgba(59,130,246,0.08)] border border-[rgba(59,130,246,0.2)] px-4 py-1.5 rounded-full text-[0.78rem] font-semibold text-[var(--local-accent)] mb-8 tracking-wide jp-animate-in",children:[_.jsx("span",{className:"w-1.5 h-1.5 rounded-full bg-[var(--local-accent)] jp-pulse-dot"}),n.badge]}),_.jsxs("h1",{className:"font-display text-[clamp(2.8rem,6vw,4.8rem)] font-black text-[var(--local-text)] leading-[1.08] tracking-tight mb-6 jp-animate-in jp-d1",children:[n.title,n.titleHighlight&&_.jsxs(_.Fragment,{children:[_.jsx("br",{}),_.jsx("em",{className:"not-italic bg-gradient-to-br from-[var(--local-accent)] to-[var(--local-cyan)] bg-clip-text text-transparent",children:n.titleHighlight})]})]}),n.description&&_.jsx("p",{className:"text-xl text-[var(--local-text-muted)] max-w-[600px] leading-relaxed mb-10 jp-animate-in jp-d2",children:n.description}),n.ctas&&n.ctas.length>0&&_.jsx("div",{className:"flex gap-4 flex-wrap jp-animate-in jp-d3",children:n.ctas.map((r,o)=>_.jsx("a",{href:r.href,className:nt("inline-flex items-center gap-2 px-8 py-3.5 rounded-[5px] font-semibold text-base transition-all duration-200 no-underline",r.variant==="primary"?"bg-[var(--local-primary)] text-white hover:brightness-110 hover:-translate-y-0.5 hover:shadow-[0_8px_30px_rgba(59,130,246,0.3)]":"bg-transparent text-[var(--local-text)] border border-[rgba(255,255,255,0.12)] hover:border-[rgba(255,255,255,0.3)] hover:bg-[rgba(255,255,255,0.04)]"),children:r.label},o))}),n.metrics&&n.metrics.length>0&&_.jsx("div",{className:"flex gap-12 mt-16 pt-12 border-t border-[rgba(255,255,255,0.06)] flex-wrap jp-animate-in jp-d4",children:n.metrics.map((r,o)=>_.jsxs("div",{children:[_.jsx("div",{className:"text-[2rem] font-bold text-[var(--local-text)] font-display",children:r.val}),_.jsx("div",{className:"text-[0.82rem] text-[var(--muted-foreground)] mt-0.5 opacity-70",children:r.label})]},o))})]})})]});/**
 * @license lucide-react v0.474.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const Q1=n=>n.replace(/([a-z0-9])([A-Z])/g,"$1-$2").toLowerCase(),Pv=(...n)=>n.filter((r,o,l)=>!!r&&r.trim()!==""&&l.indexOf(r)===o).join(" ").trim();/**
 * @license lucide-react v0.474.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */var F1={xmlns:"http://www.w3.org/2000/svg",width:24,height:24,viewBox:"0 0 24 24",fill:"none",stroke:"currentColor",strokeWidth:2,strokeLinecap:"round",strokeLinejoin:"round"};/**
 * @license lucide-react v0.474.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const K1=j.forwardRef(({color:n="currentColor",size:r=24,strokeWidth:o=2,absoluteStrokeWidth:l,className:s="",children:c,iconNode:f,...h},p)=>j.createElement("svg",{ref:p,...F1,width:r,height:r,stroke:n,strokeWidth:l?Number(o)*24/Number(r):o,className:Pv("lucide",s),...h},[...f.map(([m,v])=>j.createElement(m,v)),...Array.isArray(c)?c:[c]]));/**
 * @license lucide-react v0.474.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const Nt=(n,r)=>{const o=j.forwardRef(({className:l,...s},c)=>j.createElement(K1,{ref:c,iconNode:r,className:Pv(`lucide-${Q1(n)}`,l),...s}));return o.displayName=`${n}`,o};/**
 * @license lucide-react v0.474.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const P1=[["path",{d:"M12 5v14",key:"s699le"}],["path",{d:"m19 12-7 7-7-7",key:"1idqje"}]],J1=Nt("ArrowDown",P1);/**
 * @license lucide-react v0.474.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const W1=[["path",{d:"M5 12h14",key:"1ays0h"}],["path",{d:"m12 5 7 7-7 7",key:"xquz4c"}]],Jv=Nt("ArrowRight",W1);/**
 * @license lucide-react v0.474.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const $1=[["path",{d:"m5 12 7-7 7 7",key:"hav0vg"}],["path",{d:"M12 19V5",key:"x0mq9r"}]],e2=Nt("ArrowUp",$1);/**
 * @license lucide-react v0.474.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const t2=[["path",{d:"M21 8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16Z",key:"hh9hay"}],["path",{d:"m3.3 7 8.7 5 8.7-5",key:"g66t2b"}],["path",{d:"M12 22V12",key:"d0xqtd"}]],Wv=Nt("Box",t2);/**
 * @license lucide-react v0.474.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const a2=[["path",{d:"M20 6 9 17l-5-5",key:"1gmf2c"}]],$v=Nt("Check",a2);/**
 * @license lucide-react v0.474.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const n2=[["path",{d:"m6 9 6 6 6-6",key:"qrunsl"}]],Vd=Nt("ChevronDown",n2);/**
 * @license lucide-react v0.474.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const r2=[["path",{d:"m9 18 6-6-6-6",key:"mthhwq"}]],e0=Nt("ChevronRight",r2);/**
 * @license lucide-react v0.474.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const i2=[["path",{d:"m18 15-6-6-6 6",key:"153udz"}]],t0=Nt("ChevronUp",i2);/**
 * @license lucide-react v0.474.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const o2=[["path",{d:"M10 12.5 8 15l2 2.5",key:"1tg20x"}],["path",{d:"m14 12.5 2 2.5-2 2.5",key:"yinavb"}],["path",{d:"M14 2v4a2 2 0 0 0 2 2h4",key:"tnqrlb"}],["path",{d:"M15 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7z",key:"1mlx9k"}]],l2=Nt("FileCode",o2);/**
 * @license lucide-react v0.474.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const s2=[["path",{d:"M15 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7Z",key:"1rqfz7"}],["path",{d:"M14 2v4a2 2 0 0 0 2 2h4",key:"tnqrlb"}],["path",{d:"M10 12a1 1 0 0 0-1 1v1a1 1 0 0 1-1 1 1 1 0 0 1 1 1v1a1 1 0 0 0 1 1",key:"1oajmo"}],["path",{d:"M14 18a1 1 0 0 0 1-1v-1a1 1 0 0 1 1-1 1 1 0 0 1-1-1v-1a1 1 0 0 0-1-1",key:"mpwhp6"}]],c2=Nt("FileJson",s2);/**
 * @license lucide-react v0.474.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const u2=[["path",{d:"M15 22v-4a4.8 4.8 0 0 0-1-3.5c3 0 6-2 6-5.5.08-1.25-.27-2.48-1-3.5.28-1.15.28-2.35 0-3.5 0 0-1 0-3 1.5-2.64-.5-5.36-.5-8 0C6 2 5 2 5 2c-.3 1.15-.3 2.35 0 3.5A5.403 5.403 0 0 0 4 9c0 3.5 3 5.5 6 5.5-.39.49-.68 1.05-.85 1.65-.17.6-.22 1.23-.15 1.85v4",key:"tonef"}],["path",{d:"M9 18c-4.51 2-5-2-7-2",key:"9comsn"}]],a0=Nt("Github",u2);/**
 * @license lucide-react v0.474.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const d2=[["path",{d:"M12.83 2.18a2 2 0 0 0-1.66 0L2.6 6.08a1 1 0 0 0 0 1.83l8.58 3.91a2 2 0 0 0 1.66 0l8.58-3.9a1 1 0 0 0 0-1.83z",key:"zw3jo"}],["path",{d:"M2 12a1 1 0 0 0 .58.91l8.6 3.91a2 2 0 0 0 1.65 0l8.58-3.9A1 1 0 0 0 22 12",key:"1wduqc"}],["path",{d:"M2 17a1 1 0 0 0 .58.91l8.6 3.91a2 2 0 0 0 1.65 0l8.58-3.9A1 1 0 0 0 22 17",key:"kqbvx6"}]],qd=Nt("Layers",d2);/**
 * @license lucide-react v0.474.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const f2=[["line",{x1:"4",x2:"20",y1:"12",y2:"12",key:"1e0a9i"}],["line",{x1:"4",x2:"20",y1:"6",y2:"6",key:"1owob3"}],["line",{x1:"4",x2:"20",y1:"18",y2:"18",key:"yk5zj1"}]],n0=Nt("Menu",f2);/**
 * @license lucide-react v0.474.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const h2=[["path",{d:"M14 4.1 12 6",key:"ita8i4"}],["path",{d:"m5.1 8-2.9-.8",key:"1go3kf"}],["path",{d:"m6 12-1.9 2",key:"mnht97"}],["path",{d:"M7.2 2.2 8 5.1",key:"1cfko1"}],["path",{d:"M9.037 9.69a.498.498 0 0 1 .653-.653l11 4.5a.5.5 0 0 1-.074.949l-4.349 1.041a1 1 0 0 0-.74.739l-1.04 4.35a.5.5 0 0 1-.95.074z",key:"s0h3yz"}]],p2=Nt("MousePointerClick",h2);/**
 * @license lucide-react v0.474.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const m2=[["path",{d:"M5 12h14",key:"1ays0h"}],["path",{d:"M12 5v14",key:"s699le"}]],g2=Nt("Plus",m2);/**
 * @license lucide-react v0.474.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const v2=[["path",{d:"M15.2 3a2 2 0 0 1 1.4.6l3.8 3.8a2 2 0 0 1 .6 1.4V19a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2z",key:"1c8476"}],["path",{d:"M17 21v-7a1 1 0 0 0-1-1H8a1 1 0 0 0-1 1v7",key:"1ydtos"}],["path",{d:"M7 3v4a1 1 0 0 0 1 1h7",key:"t51u73"}]],r0=Nt("Save",v2);/**
 * @license lucide-react v0.474.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const b2=[["line",{x1:"21",x2:"14",y1:"4",y2:"4",key:"obuewd"}],["line",{x1:"10",x2:"3",y1:"4",y2:"4",key:"1q6298"}],["line",{x1:"21",x2:"12",y1:"12",y2:"12",key:"1iu8h1"}],["line",{x1:"8",x2:"3",y1:"12",y2:"12",key:"ntss68"}],["line",{x1:"21",x2:"16",y1:"20",y2:"20",key:"14d8ph"}],["line",{x1:"12",x2:"3",y1:"20",y2:"20",key:"m0wm8r"}],["line",{x1:"14",x2:"14",y1:"2",y2:"6",key:"14e1ph"}],["line",{x1:"8",x2:"8",y1:"10",y2:"14",key:"1i6ji0"}],["line",{x1:"16",x2:"16",y1:"18",y2:"22",key:"1lctlv"}]],y2=Nt("SlidersHorizontal",b2);/**
 * @license lucide-react v0.474.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const x2=[["polyline",{points:"4 17 10 11 4 5",key:"akl6gq"}],["line",{x1:"12",x2:"20",y1:"19",y2:"19",key:"q2wloq"}]],i0=Nt("Terminal",x2);/**
 * @license lucide-react v0.474.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const w2=[["path",{d:"M3 6h18",key:"d0wm0j"}],["path",{d:"M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6",key:"4alrt4"}],["path",{d:"M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2",key:"v07s0e"}],["line",{x1:"10",x2:"10",y1:"11",y2:"17",key:"1uufr5"}],["line",{x1:"14",x2:"14",y1:"11",y2:"17",key:"xtxkd"}]],_2=Nt("Trash2",w2);/**
 * @license lucide-react v0.474.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const S2=[["path",{d:"M18 6 6 18",key:"1bl5f8"}],["path",{d:"m6 6 12 12",key:"d8bk6v"}]],o0=Nt("X",S2),k2={layers:qd,github:a0,"arrow-right":Jv,box:Wv,terminal:i0,"chevron-right":e0,menu:n0,x:o0},Gd=({name:n,size:r=20,className:o})=>{const l=k2[n];return l?_.jsx(l,{size:r,className:o}):null},E2={2:"md:grid-cols-2",3:"md:grid-cols-3",4:"md:grid-cols-4"},z2=({data:n,settings:r})=>{const o=E2[(r==null?void 0:r.columns)??3],l=(r==null?void 0:r.cardStyle)==="bordered",s={"--local-bg":"var(--background)","--local-text":"var(--foreground)","--local-text-muted":"var(--muted-foreground)","--local-surface":"var(--card)","--local-surface-alt":"var(--muted)","--local-border":"var(--border)","--local-radius-lg":"var(--radius)","--local-radius-md":"calc(var(--radius) - 2px)"};return _.jsx("section",{style:s,className:"py-20 bg-[var(--local-bg)] relative z-0",children:_.jsxs("div",{className:"container mx-auto px-6",children:[_.jsx("h2",{className:"text-3xl md:text-4xl font-bold text-center text-[var(--local-text)] mb-16",children:n.sectionTitle}),_.jsx("div",{className:nt("grid grid-cols-1 gap-6",o),children:n.cards.map((c,f)=>_.jsxs("div",{className:nt("p-6 rounded-[var(--local-radius-lg)] bg-[var(--local-surface)]",l&&"border border-[var(--local-border)]"),children:[c.icon&&_.jsx("div",{className:"w-10 h-10 rounded-[var(--local-radius-md)] bg-[var(--local-surface-alt)] flex items-center justify-center mb-4",children:_.jsx(Gd,{name:c.icon,size:20,className:"text-[var(--local-text-muted)]"})}),_.jsxs("h3",{className:"text-lg font-semibold text-[var(--local-text)] mb-2",children:[c.emoji&&_.jsx("span",{className:"mr-2",children:c.emoji}),c.title]}),_.jsx("p",{className:"text-sm text-[var(--local-text-muted)] leading-relaxed",children:c.description})]},f))})]})})},C2=({data:n,settings:r})=>{const o=(r==null?void 0:r.showLineNumbers)??!0;return _.jsx("section",{style:{"--local-surface":"var(--card)","--local-text-muted":"var(--muted-foreground)","--local-bg":"var(--background)","--local-border":"var(--border)","--local-text":"var(--foreground)","--local-accent":"var(--primary)","--local-radius-lg":"var(--radius)"},className:"py-16 bg-[var(--local-surface)]",children:_.jsxs("div",{className:"container mx-auto px-6 max-w-4xl",children:[n.label&&_.jsxs("div",{className:"flex items-center gap-2 text-xs font-semibold uppercase tracking-wider text-[var(--local-text-muted)] mb-4",children:[_.jsx(Gd,{name:"terminal",size:14}),_.jsx("span",{children:n.label})]}),_.jsx("div",{className:"rounded-[var(--local-radius-lg)] bg-[var(--local-bg)] border border-[var(--local-border)] overflow-hidden",children:_.jsx("div",{className:"p-6 font-mono text-sm overflow-x-auto",children:n.lines.map((l,s)=>_.jsxs("div",{className:"flex items-start gap-4 py-1",children:[o&&_.jsx("span",{className:"select-none w-6 text-right text-[var(--local-text-muted)]/50",children:s+1}),_.jsxs("span",{className:nt(l.isComment?"text-[var(--local-text-muted)]/60":"text-[var(--local-text)]"),children:[!l.isComment&&_.jsx("span",{className:"text-[var(--local-accent)] mr-2",children:"$"}),l.content]})]},s))})})]})})},Eg={red:"bg-[rgba(239,68,68,0.08)] border-[rgba(239,68,68,0.3)] text-[#f87171]",amber:"bg-[rgba(245,158,11,0.08)] border-[rgba(245,158,11,0.3)] text-[#fbbf24]",green:"bg-[rgba(34,197,94,0.08)] border-[rgba(34,197,94,0.3)] text-[#4ade80]",blue:"bg-[rgba(59,130,246,0.08)] border-[rgba(59,130,246,0.3)] text-[#60a5fa]"},A2=({data:n})=>_.jsx("section",{style:{"--local-bg":"var(--background)","--local-surface":"var(--card)","--local-text":"var(--foreground)","--local-text-muted":"var(--muted-foreground)","--local-border":"var(--border)"},className:"jp-problem relative z-0 py-28 bg-gradient-to-b from-[var(--local-bg)] to-[var(--local-surface)]",children:_.jsx("div",{className:"max-w-[1200px] mx-auto px-8",children:_.jsxs("div",{className:"grid grid-cols-1 lg:grid-cols-2 gap-16 items-center",children:[_.jsx("div",{className:"relative h-[360px] border border-[rgba(255,255,255,0.06)] rounded-lg bg-[rgba(255,255,255,0.02)] overflow-hidden flex items-center justify-center",children:_.jsx("div",{className:"text-center p-8",children:n.siloGroups.map((r,o)=>_.jsxs("div",{className:"mb-4",children:[_.jsx("div",{className:"flex flex-wrap justify-center gap-1.5",children:r.blocks.map((l,s)=>_.jsx("span",{className:nt("inline-block px-4 py-2 rounded-lg text-[0.8rem] font-semibold border",Eg[l.variant]||Eg.blue),children:l.label},s))}),_.jsx("span",{className:"text-[0.7rem] text-[var(--local-text-muted)] uppercase tracking-widest mt-2 block opacity-60",children:r.label})]},o))})}),_.jsxs("div",{children:[_.jsx("h3",{className:"text-2xl font-bold text-[var(--local-text)] mb-4",children:n.title}),n.paragraphs.map((r,o)=>_.jsx("p",{className:"text-[var(--local-text-muted)] mb-5 text-[1.05rem] leading-relaxed",children:r.isBold?_.jsx("strong",{className:"text-[var(--local-text)]",children:r.text}):r.text},o))]})]})})}),zg={split:"bg-[rgba(59,130,246,0.1)] text-[#60a5fa]",registry:"bg-[rgba(34,211,238,0.1)] text-[#22d3ee]",federation:"bg-[rgba(168,85,247,0.1)] text-[#c084fc]"},Cg={core:"bg-[rgba(59,130,246,0.1)] text-[#60a5fa]",pattern:"bg-[rgba(34,211,238,0.1)] text-[#22d3ee]",enterprise:"bg-[rgba(168,85,247,0.1)] text-[#c084fc]"},T2=({data:n})=>_.jsxs("section",{style:{"--local-bg":"var(--background)","--local-text":"var(--foreground)","--local-text-muted":"var(--muted-foreground)","--local-primary":"var(--primary)","--local-accent":"var(--color-accent, #60a5fa)","--local-border":"var(--border)"},className:"relative z-0 py-28 bg-[var(--local-bg)]",children:[_.jsx("div",{className:"absolute top-0 left-1/2 -translate-x-1/2 w-[80%] h-px bg-gradient-to-r from-transparent via-[rgba(59,130,246,0.15)] to-transparent"}),_.jsxs("div",{className:"max-w-[1200px] mx-auto px-8",children:[n.label&&_.jsxs("div",{className:"jp-section-label inline-flex items-center gap-2 text-[0.72rem] font-bold uppercase tracking-[0.12em] text-[var(--local-accent)] mb-4",children:[_.jsx("span",{className:"w-5 h-px bg-[var(--local-primary)]"}),n.label]}),_.jsx("h2",{className:"font-display text-[clamp(2rem,4vw,3.2rem)] font-extrabold text-[var(--local-text)] leading-[1.15] tracking-tight mb-4",children:n.title}),n.description&&_.jsx("p",{className:"text-lg text-[var(--local-text-muted)] max-w-[600px] leading-relaxed",children:n.description}),_.jsx("div",{className:"grid grid-cols-1 lg:grid-cols-3 gap-6 mt-14",children:n.pillars.map((r,o)=>_.jsxs("div",{className:"jp-pillar-card group relative border border-[rgba(255,255,255,0.06)] rounded-lg p-10 bg-[rgba(255,255,255,0.015)] transition-all duration-300 overflow-hidden hover:border-[rgba(59,130,246,0.2)] hover:-translate-y-1 hover:bg-[rgba(59,130,246,0.03)]",children:[_.jsx("div",{className:"absolute top-0 left-0 right-0 h-[3px] bg-gradient-to-r from-[var(--local-primary)] to-[#22d3ee] opacity-0 group-hover:opacity-100 transition-opacity duration-300"}),_.jsx("div",{className:nt("w-12 h-12 rounded-xl flex items-center justify-center mb-6 text-xl font-bold",zg[r.iconVariant]||zg.split),children:r.icon}),_.jsx("h3",{className:"text-xl font-bold text-[var(--local-text)] mb-3",children:r.title}),_.jsx("p",{className:"text-[0.95rem] text-[var(--local-text-muted)] leading-relaxed",children:r.description}),_.jsx("span",{className:nt("inline-block text-[0.7rem] font-semibold uppercase tracking-wide px-3 py-1 rounded mt-4",Cg[r.tagVariant]||Cg.core),children:r.tag})]},o))})]})]}),Ag={l0:"bg-[#3b82f6]",l1:"bg-[rgba(59,130,246,0.6)]",l2:"bg-[rgba(59,130,246,0.35)]"},Tg={plain:"text-[#cbd5e1]",keyword:"text-[#60a5fa]",type:"text-[#22d3ee]",string:"text-[#4ade80]",comment:"text-[#64748b] italic",operator:"text-[#f472b6]"},N2=({data:n})=>_.jsxs("section",{style:{"--local-bg":"var(--card)","--local-text":"var(--foreground)","--local-text-muted":"var(--muted-foreground)","--local-primary":"var(--primary)","--local-accent":"var(--color-accent, #60a5fa)","--local-border":"var(--border)","--local-deep":"var(--background)"},className:"relative z-0 py-28 bg-[var(--local-bg)]",children:[_.jsx("div",{className:"absolute top-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-[rgba(59,130,246,0.1)] to-transparent"}),_.jsx("div",{className:"absolute bottom-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-[rgba(59,130,246,0.1)] to-transparent"}),_.jsxs("div",{className:"max-w-[1200px] mx-auto px-8",children:[_.jsxs("div",{className:"text-center",children:[n.label&&_.jsxs("div",{className:"jp-section-label inline-flex items-center gap-2 text-[0.72rem] font-bold uppercase tracking-[0.12em] text-[var(--local-accent)] mb-4",children:[_.jsx("span",{className:"w-5 h-px bg-[var(--local-primary)]"}),n.label]}),_.jsx("h2",{className:"font-display text-[clamp(2rem,4vw,3.2rem)] font-extrabold text-[var(--local-text)] leading-[1.15] tracking-tight mb-4",children:n.title}),n.description&&_.jsx("p",{className:"text-lg text-[var(--local-text-muted)] max-w-[600px] mx-auto leading-relaxed",children:n.description})]}),_.jsx("div",{className:"mt-14 max-w-[740px] mx-auto",children:n.layers.map((r,o)=>_.jsxs("div",{className:"group border border-[rgba(255,255,255,0.06)] rounded-[7px] p-8 mb-4 bg-[rgba(255,255,255,0.015)] flex items-start gap-6 transition-all duration-300 hover:border-[rgba(59,130,246,0.2)] hover:translate-x-1.5",children:[_.jsx("div",{className:nt("shrink-0 w-9 h-9 rounded-lg flex items-center justify-center font-mono text-[0.85rem] font-bold text-white",Ag[r.layerLevel]||Ag.l0),children:r.number}),_.jsxs("div",{children:[_.jsx("h4",{className:"text-[1.05rem] font-bold text-[var(--local-text)] mb-1.5",children:r.title}),_.jsx("p",{className:"text-[0.92rem] text-[var(--local-text-muted)] leading-relaxed",children:r.description})]})]},o))}),n.codeLines&&n.codeLines.length>0&&_.jsx("div",{className:"mt-12 max-w-[740px] mx-auto",children:_.jsxs("div",{className:"border border-[rgba(255,255,255,0.08)] rounded-[7px] overflow-hidden bg-[var(--local-deep)]",children:[_.jsxs("div",{className:"flex items-center gap-2 px-5 py-3 bg-[rgba(255,255,255,0.03)] border-b border-[rgba(255,255,255,0.06)]",children:[_.jsx("span",{className:"w-2.5 h-2.5 rounded-full bg-[#ef4444]"}),_.jsx("span",{className:"w-2.5 h-2.5 rounded-full bg-[#f59e0b]"}),_.jsx("span",{className:"w-2.5 h-2.5 rounded-full bg-[#22c55e]"}),n.codeFilename&&_.jsx("span",{className:"ml-3 font-mono text-[0.75rem] text-[var(--local-text-muted)] opacity-60",children:n.codeFilename})]}),_.jsx("div",{className:"p-6 font-mono text-[0.82rem] leading-[1.7] overflow-x-auto",children:n.codeLines.map((r,o)=>_.jsx("div",{children:_.jsx("span",{className:Tg[r.tokenType]||Tg.plain,children:r.content})},o))})]})})]})]}),O2=({data:n})=>_.jsx("section",{style:{"--local-bg":"var(--background)","--local-text":"var(--foreground)","--local-text-muted":"var(--muted-foreground)","--local-primary":"var(--primary)","--local-accent":"var(--color-accent, #60a5fa)","--local-border":"var(--border)"},className:"relative z-0 py-28 bg-[var(--local-bg)]",children:_.jsxs("div",{className:"max-w-[1200px] mx-auto px-8",children:[_.jsxs("div",{className:"text-center",children:[n.label&&_.jsxs("div",{className:"jp-section-label inline-flex items-center gap-2 text-[0.72rem] font-bold uppercase tracking-[0.12em] text-[var(--local-accent)] mb-4",children:[_.jsx("span",{className:"w-5 h-px bg-[var(--local-primary)]"}),n.label]}),_.jsx("h2",{className:"font-display text-[clamp(2rem,4vw,3.2rem)] font-extrabold text-[var(--local-text)] leading-[1.15] tracking-tight mb-4",children:n.title}),n.description&&_.jsx("p",{className:"text-lg text-[var(--local-text-muted)] max-w-[600px] mx-auto leading-relaxed",children:n.description})]}),_.jsx("div",{className:"grid grid-cols-1 lg:grid-cols-3 gap-6 mt-14",children:n.products.map((r,o)=>_.jsxs("div",{className:nt("relative border rounded-lg p-10 transition-all duration-300 hover:-translate-y-1",r.featured?"border-[rgba(59,130,246,0.3)] bg-gradient-to-b from-[rgba(59,130,246,0.06)] to-[rgba(59,130,246,0.01)] hover:border-[rgba(59,130,246,0.4)]":"border-[rgba(255,255,255,0.06)] bg-[rgba(255,255,255,0.015)] hover:border-[rgba(59,130,246,0.2)]"),children:[r.featured&&_.jsx("div",{className:"absolute -top-3 left-1/2 -translate-x-1/2 bg-[var(--local-primary)] text-white text-[0.7rem] font-bold px-4 py-1 rounded-full uppercase tracking-wide",children:"Most Popular"}),_.jsx("div",{className:"text-[0.75rem] font-bold uppercase tracking-[0.1em] text-[var(--local-accent)] mb-2",children:r.tier}),_.jsx("div",{className:"text-2xl font-extrabold text-[var(--local-text)] mb-2",children:r.name}),_.jsxs("div",{className:"font-display text-[2.2rem] font-extrabold text-[var(--local-text)] mb-1",children:[r.price,r.priceSuffix&&_.jsx("span",{className:"text-[0.9rem] font-normal text-[var(--local-text-muted)]",children:r.priceSuffix})]}),_.jsx("div",{className:"text-[0.85rem] text-[var(--local-text-muted)] mb-6 pb-6 border-b border-[rgba(255,255,255,0.06)]",children:r.delivery}),_.jsx("ul",{className:"mb-8 space-y-0",children:r.features.map((l,s)=>_.jsx("li",{className:"text-[0.9rem] text-[#cbd5e1] py-1.5 pl-6 relative before:content-['✓'] before:absolute before:left-0 before:text-[var(--local-accent)] before:font-bold before:text-[0.8rem]",children:l.text},s))}),r.ctaLabel&&r.ctaHref&&_.jsx("a",{href:r.ctaHref,className:nt("block text-center py-3 rounded-[5px] no-underline font-semibold text-[0.95rem] transition-all duration-200",r.ctaVariant==="primary"?"bg-[var(--local-primary)] text-white hover:brightness-110 hover:-translate-y-px":"bg-[rgba(255,255,255,0.05)] text-[#e2e8f0] border border-[rgba(255,255,255,0.1)] hover:bg-[rgba(255,255,255,0.08)] hover:border-[rgba(255,255,255,0.2)]"),children:r.ctaLabel})]},o))})]})}),j2=({data:n})=>_.jsxs("section",{style:{"--local-bg":"var(--card)","--local-text":"var(--foreground)","--local-text-muted":"var(--muted-foreground)","--local-primary":"var(--primary)","--local-accent":"var(--color-accent, #60a5fa)","--local-deep":"var(--background)"},className:"relative z-0 py-28 bg-[var(--local-bg)]",children:[_.jsx("div",{className:"absolute top-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-[rgba(59,130,246,0.1)] to-transparent"}),_.jsx("div",{className:"absolute bottom-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-[rgba(59,130,246,0.1)] to-transparent"}),_.jsxs("div",{className:"max-w-[1200px] mx-auto px-8",children:[n.label&&_.jsxs("div",{className:"jp-section-label inline-flex items-center gap-2 text-[0.72rem] font-bold uppercase tracking-[0.12em] text-[var(--local-accent)] mb-4",children:[_.jsx("span",{className:"w-5 h-px bg-[var(--local-primary)]"}),n.label]}),_.jsx("h2",{className:"font-display text-[clamp(2rem,4vw,3.2rem)] font-extrabold text-[var(--local-text)] leading-[1.15] tracking-tight mb-4",children:n.title}),_.jsxs("div",{className:"grid grid-cols-1 lg:grid-cols-2 gap-16 items-center mt-12",children:[_.jsxs("div",{children:[_.jsx("h3",{className:"text-2xl font-bold text-[var(--local-text)] mb-4",children:n.subtitle}),n.paragraphs.map((r,o)=>_.jsx("p",{className:"text-[var(--local-text-muted)] mb-5 text-[1.05rem] leading-relaxed",children:r.text},o)),n.badges&&n.badges.length>0&&_.jsx("div",{className:"flex gap-2.5 flex-wrap mt-4",children:n.badges.map((r,o)=>_.jsx("span",{className:"inline-flex items-center gap-1.5 bg-[rgba(34,197,94,0.08)] border border-[rgba(34,197,94,0.2)] text-[#4ade80] px-3 py-1.5 rounded-md text-[0.78rem] font-semibold",children:r.label},o))})]}),_.jsxs("div",{className:"border border-[rgba(255,255,255,0.06)] rounded-lg p-12 bg-[rgba(255,255,255,0.02)] text-center",children:[n.engines&&n.engines.length>=2&&_.jsx("div",{className:"flex items-center justify-center gap-6 mb-8",children:n.engines.map((r,o)=>_.jsxs(Sa.Fragment,{children:[o>0&&_.jsx("span",{className:"text-[var(--local-text-muted)] text-2xl opacity-50",children:"⇄"}),_.jsx("div",{className:r.variant==="tailwind"?"px-6 py-4 rounded-xl font-bold text-[0.95rem] border bg-[rgba(59,130,246,0.08)] border-[rgba(59,130,246,0.2)] text-[#60a5fa]":"px-6 py-4 rounded-xl font-bold text-[0.95rem] border bg-[rgba(34,197,94,0.08)] border-[rgba(34,197,94,0.2)] text-[#4ade80]",children:r.label})]},o))}),n.codeSnippet&&_.jsxs("div",{className:"font-mono text-[0.85rem] text-[var(--local-text-muted)] bg-[var(--local-deep)] p-4 rounded-lg text-left border border-[rgba(255,255,255,0.04)]",children:[_.jsx("pre",{className:"whitespace-pre-wrap m-0",children:n.codeSnippet}),_.jsx("div",{className:"mt-4 text-[0.75rem] text-center opacity-50",children:"Same JSON. Different Render Engine."})]})]})]})]})]}),R2=({data:n})=>{const r=()=>{if(!n.quoteHighlightWord)return _.jsx(_.Fragment,{children:n.quote});const o=n.quote.split(n.quoteHighlightWord);return _.jsx(_.Fragment,{children:o.map((l,s)=>_.jsxs(Sa.Fragment,{children:[l,s<o.length-1&&_.jsx("em",{className:"not-italic text-[var(--local-accent)]",children:n.quoteHighlightWord})]},s))})};return _.jsx("section",{style:{"--local-bg":"var(--background)","--local-text":"var(--foreground)","--local-text-muted":"var(--muted-foreground)","--local-accent":"var(--color-accent, #60a5fa)","--local-primary":"var(--primary)"},className:"relative z-0 py-28 bg-[var(--local-bg)]",children:_.jsx("div",{className:"max-w-[1200px] mx-auto px-8",children:_.jsxs("div",{className:"max-w-[760px] mx-auto text-center",children:[n.label&&_.jsxs("div",{className:"jp-section-label inline-flex items-center gap-2 text-[0.72rem] font-bold uppercase tracking-[0.12em] text-[var(--local-accent)] mb-4",children:[_.jsx("span",{className:"w-5 h-px bg-[var(--local-primary)]"}),n.label]}),_.jsx("h2",{className:"font-display text-[clamp(2rem,4vw,3.2rem)] font-extrabold text-[var(--local-text)] leading-[1.15] tracking-tight mb-4",children:n.title}),_.jsxs("blockquote",{className:"font-display text-[clamp(1.6rem,3vw,2.4rem)] text-[var(--local-text)] font-bold leading-[1.35] my-8",children:["“",r(),"”"]}),n.description&&_.jsx("p",{className:"text-[1.05rem] text-[var(--local-text-muted)] max-w-[560px] mx-auto leading-relaxed",children:n.description})]})})})},M2=({data:n})=>_.jsxs("section",{style:{"--local-bg":"var(--background)","--local-text":"var(--foreground)","--local-text-muted":"var(--muted-foreground)","--local-primary":"var(--primary)","--local-accent":"var(--color-accent, #60a5fa)"},className:"relative z-0 py-28 bg-[var(--local-bg)] overflow-hidden text-center",children:[_.jsx("div",{className:"absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[60vw] h-[60vw] bg-[radial-gradient(circle,rgba(59,130,246,0.08)_0%,transparent_60%)] pointer-events-none"}),_.jsxs("div",{className:"relative z-[2] max-w-[1200px] mx-auto px-8",children:[n.label&&_.jsxs("div",{className:"jp-section-label inline-flex items-center gap-2 text-[0.72rem] font-bold uppercase tracking-[0.12em] text-[var(--local-accent)] mb-4",children:[_.jsx("span",{className:"w-5 h-px bg-[var(--local-primary)]"}),n.label]}),_.jsx("h2",{className:"font-display text-[clamp(2rem,4vw,3.2rem)] font-extrabold text-[var(--local-text)] leading-[1.15] tracking-tight mb-6",children:n.title}),n.description&&_.jsx("p",{className:"text-lg text-[var(--local-text-muted)] max-w-[600px] mx-auto leading-relaxed mb-10",children:n.description}),n.ctas&&n.ctas.length>0&&_.jsx("div",{className:"flex gap-4 justify-center flex-wrap",children:n.ctas.map((r,o)=>_.jsx("a",{href:r.href,className:nt("inline-flex items-center gap-2 px-8 py-3.5 rounded-[5px] font-semibold text-base transition-all duration-200 no-underline",r.variant==="primary"?"bg-[var(--local-primary)] text-white hover:brightness-110 hover:-translate-y-0.5 hover:shadow-[0_8px_30px_rgba(59,130,246,0.3)]":"bg-transparent text-[var(--local-text)] border border-[rgba(255,255,255,0.12)] hover:border-[rgba(255,255,255,0.3)] hover:bg-[rgba(255,255,255,0.04)]"),children:r.label},o))})]})]}),D2={header:Y1,footer:I1,hero:X1,"feature-grid":z2,"code-block":C2,"problem-statement":A2,"pillars-grid":T2,"arch-layers":N2,"product-triad":O2,"pa-section":j2,philosophy:R2,"cta-banner":M2},l0=j.createContext(void 0),Yd=({mode:n,children:r})=>(j.useEffect(()=>{if(n!=="studio")return;const o=new MutationObserver(l=>{l.forEach(s=>{s.addedNodes.forEach(c=>{c instanceof HTMLElement&&c.hasAttribute("data-radix-portal")&&c.setAttribute("data-jp-studio-portal","true")})})});return o.observe(document.body,{childList:!0}),()=>o.disconnect()},[n]),_.jsx(l0.Provider,{value:{mode:n},children:r})),B2=()=>{const n=j.useContext(l0);if(n===void 0)throw new Error("useStudio must be used within a StudioProvider");return n},ka={UPDATE_DRAFTS:"jsonpages:update-drafts",SYNC_SELECTION:"jsonpages:sync-selection",REQUEST_CLEAN_HTML:"jsonpages:request-clean-html",SEND_CLEAN_HTML:"jsonpages:send-clean-html",SECTION_SELECT:"jsonpages:section-select",STAGE_READY:"jsonpages:stage-ready"},U2=({type:n,scope:r,isSelected:o})=>_.jsx("div",{className:nt("absolute inset-0 pointer-events-none transition-all duration-200 z-[50]","border-2 border-transparent group-hover:border-blue-400/50 group-hover:border-dashed",o&&"border-2 border-blue-600 border-solid bg-blue-500/5"),children:_.jsxs("div",{className:nt("absolute top-0 right-0 px-2 py-1 text-[9px] font-black uppercase tracking-widest transition-opacity","bg-blue-600 text-white",o||"group-hover:opacity-100 opacity-0"),children:[n," ",_.jsx("span",{className:"opacity-50",children:"|"})," ",r]})}),nd=({section:n,menu:r,selectedId:o})=>{var E,x;const{mode:l}=B2(),s=l==="studio",c=s&&o===n.id,f=D2[n.type],h=n.type==="header"||n.type==="footer"?"global":"local",p=n.type==="header"&&((E=n.settings)==null?void 0:E.sticky);if(!f)return _.jsxs("div",{className:"p-6 m-4 bg-red-500/10 text-red-400 border border-red-500/20 rounded-lg text-sm font-mono",children:[_.jsx("strong",{children:"Missing Component:"})," ",n.type]});const m=z=>{s&&(z.preventDefault(),z.stopPropagation(),window.parent.postMessage({type:ka.SECTION_SELECT,section:{id:n.id,type:n.type,scope:h}},"*"))},v=()=>{const z=f;return n.type==="header"&&r?_.jsx(z,{data:n.data,settings:n.settings,menu:r}):_.jsx(z,{data:n.data,settings:n.settings})},b=(x=n.data)==null?void 0:x.anchorId;return _.jsxs("div",{id:b||void 0,"data-section-id":s?n.id:void 0,onClick:s?m:void 0,className:nt("relative w-full",s&&"group cursor-pointer",s&&p?"sticky top-0 z-[60]":"relative z-0",c&&"z-[70]"),children:[_.jsx("div",{className:"relative z-10",children:v()}),s&&_.jsx(U2,{type:n.type,scope:h,isSelected:!!c})]})},L2=n=>{j.useEffect(()=>{document.title=n.title;let r=document.querySelector('meta[name="description"]');r||(r=document.createElement("meta"),r.setAttribute("name","description"),document.head.appendChild(r)),r.setAttribute("content",n.description)},[n.title,n.description])},s0=({pageConfig:n,siteConfig:r,menuConfig:o,selectedId:l})=>(L2(n.meta),_.jsxs("div",{className:"min-h-screen flex flex-col bg-[var(--color-background)]",children:[_.jsx(nd,{section:r.header,menu:o.main,selectedId:l}),_.jsx("main",{className:"flex-1",children:n.sections.map(s=>_.jsx(nd,{section:s,selectedId:l},s.id))}),_.jsx(nd,{section:r.footer,selectedId:l})]})),c0=()=>_.jsxs("div",{style:{"--local-bg":"var(--color-background)","--local-text":"var(--color-text)","--local-text-muted":"var(--color-text-muted)","--local-primary":"var(--color-primary)","--local-radius-md":"var(--radius-md)"},className:"min-h-screen flex flex-col items-center justify-center bg-[var(--local-bg)] px-6",children:[_.jsx("h1",{className:"text-6xl font-bold text-[var(--local-text)] mb-4",children:"404"}),_.jsx("p",{className:"text-xl text-[var(--local-text-muted)] mb-8",children:"Page not found"}),_.jsxs("a",{href:"/",className:"inline-flex items-center gap-2 px-6 py-3 rounded-[var(--local-radius-md)] bg-[var(--local-primary)] text-[var(--local-bg)] font-semibold text-sm hover:opacity-90 transition-opacity",children:[_.jsx("span",{children:"Back to Home"}),_.jsx(Gd,{name:"arrow-right",size:16})]})]}),Id={setTheme:n=>{const r=document.documentElement,{tokens:o}=n,l={"--theme-primary":o.colors.primary,"--theme-secondary":o.colors.secondary,"--theme-accent":o.colors.accent,"--theme-background":o.colors.background,"--theme-surface":o.colors.surface,"--theme-surface-alt":o.colors.surfaceAlt,"--theme-text":o.colors.text,"--theme-text-muted":o.colors.textMuted,"--theme-border":o.colors.border,"--theme-font-primary":o.typography.fontFamily.primary,"--theme-font-mono":o.typography.fontFamily.mono,"--theme-radius-sm":o.borderRadius.sm,"--theme-radius-md":o.borderRadius.md,"--theme-radius-lg":o.borderRadius.lg};Object.entries(l).forEach(([s,c])=>{r.style.setProperty(s,c)})}};var tt;(function(n){n.assertEqual=s=>{};function r(s){}n.assertIs=r;function o(s){throw new Error}n.assertNever=o,n.arrayToEnum=s=>{const c={};for(const f of s)c[f]=f;return c},n.getValidEnumValues=s=>{const c=n.objectKeys(s).filter(h=>typeof s[s[h]]!="number"),f={};for(const h of c)f[h]=s[h];return n.objectValues(f)},n.objectValues=s=>n.objectKeys(s).map(function(c){return s[c]}),n.objectKeys=typeof Object.keys=="function"?s=>Object.keys(s):s=>{const c=[];for(const f in s)Object.prototype.hasOwnProperty.call(s,f)&&c.push(f);return c},n.find=(s,c)=>{for(const f of s)if(c(f))return f},n.isInteger=typeof Number.isInteger=="function"?s=>Number.isInteger(s):s=>typeof s=="number"&&Number.isFinite(s)&&Math.floor(s)===s;function l(s,c=" | "){return s.map(f=>typeof f=="string"?`'${f}'`:f).join(c)}n.joinValues=l,n.jsonStringifyReplacer=(s,c)=>typeof c=="bigint"?c.toString():c})(tt||(tt={}));var Ng;(function(n){n.mergeShapes=(r,o)=>({...r,...o})})(Ng||(Ng={}));const Ne=tt.arrayToEnum(["string","nan","number","integer","float","boolean","date","bigint","symbol","function","undefined","null","array","object","unknown","promise","void","never","map","set"]),qn=n=>{switch(typeof n){case"undefined":return Ne.undefined;case"string":return Ne.string;case"number":return Number.isNaN(n)?Ne.nan:Ne.number;case"boolean":return Ne.boolean;case"function":return Ne.function;case"bigint":return Ne.bigint;case"symbol":return Ne.symbol;case"object":return Array.isArray(n)?Ne.array:n===null?Ne.null:n.then&&typeof n.then=="function"&&n.catch&&typeof n.catch=="function"?Ne.promise:typeof Map<"u"&&n instanceof Map?Ne.map:typeof Set<"u"&&n instanceof Set?Ne.set:typeof Date<"u"&&n instanceof Date?Ne.date:Ne.object;default:return Ne.unknown}},ye=tt.arrayToEnum(["invalid_type","invalid_literal","custom","invalid_union","invalid_union_discriminator","invalid_enum_value","unrecognized_keys","invalid_arguments","invalid_return_type","invalid_date","invalid_string","too_small","too_big","invalid_intersection_types","not_multiple_of","not_finite"]);class fn extends Error{get errors(){return this.issues}constructor(r){super(),this.issues=[],this.addIssue=l=>{this.issues=[...this.issues,l]},this.addIssues=(l=[])=>{this.issues=[...this.issues,...l]};const o=new.target.prototype;Object.setPrototypeOf?Object.setPrototypeOf(this,o):this.__proto__=o,this.name="ZodError",this.issues=r}format(r){const o=r||function(c){return c.message},l={_errors:[]},s=c=>{for(const f of c.issues)if(f.code==="invalid_union")f.unionErrors.map(s);else if(f.code==="invalid_return_type")s(f.returnTypeError);else if(f.code==="invalid_arguments")s(f.argumentsError);else if(f.path.length===0)l._errors.push(o(f));else{let h=l,p=0;for(;p<f.path.length;){const m=f.path[p];p===f.path.length-1?(h[m]=h[m]||{_errors:[]},h[m]._errors.push(o(f))):h[m]=h[m]||{_errors:[]},h=h[m],p++}}};return s(this),l}static assert(r){if(!(r instanceof fn))throw new Error(`Not a ZodError: ${r}`)}toString(){return this.message}get message(){return JSON.stringify(this.issues,tt.jsonStringifyReplacer,2)}get isEmpty(){return this.issues.length===0}flatten(r=o=>o.message){const o={},l=[];for(const s of this.issues)if(s.path.length>0){const c=s.path[0];o[c]=o[c]||[],o[c].push(r(s))}else l.push(r(s));return{formErrors:l,fieldErrors:o}}get formErrors(){return this.flatten()}}fn.create=n=>new fn(n);const bd=(n,r)=>{let o;switch(n.code){case ye.invalid_type:n.received===Ne.undefined?o="Required":o=`Expected ${n.expected}, received ${n.received}`;break;case ye.invalid_literal:o=`Invalid literal value, expected ${JSON.stringify(n.expected,tt.jsonStringifyReplacer)}`;break;case ye.unrecognized_keys:o=`Unrecognized key(s) in object: ${tt.joinValues(n.keys,", ")}`;break;case ye.invalid_union:o="Invalid input";break;case ye.invalid_union_discriminator:o=`Invalid discriminator value. Expected ${tt.joinValues(n.options)}`;break;case ye.invalid_enum_value:o=`Invalid enum value. Expected ${tt.joinValues(n.options)}, received '${n.received}'`;break;case ye.invalid_arguments:o="Invalid function arguments";break;case ye.invalid_return_type:o="Invalid function return type";break;case ye.invalid_date:o="Invalid date";break;case ye.invalid_string:typeof n.validation=="object"?"includes"in n.validation?(o=`Invalid input: must include "${n.validation.includes}"`,typeof n.validation.position=="number"&&(o=`${o} at one or more positions greater than or equal to ${n.validation.position}`)):"startsWith"in n.validation?o=`Invalid input: must start with "${n.validation.startsWith}"`:"endsWith"in n.validation?o=`Invalid input: must end with "${n.validation.endsWith}"`:tt.assertNever(n.validation):n.validation!=="regex"?o=`Invalid ${n.validation}`:o="Invalid";break;case ye.too_small:n.type==="array"?o=`Array must contain ${n.exact?"exactly":n.inclusive?"at least":"more than"} ${n.minimum} element(s)`:n.type==="string"?o=`String must contain ${n.exact?"exactly":n.inclusive?"at least":"over"} ${n.minimum} character(s)`:n.type==="number"?o=`Number must be ${n.exact?"exactly equal to ":n.inclusive?"greater than or equal to ":"greater than "}${n.minimum}`:n.type==="bigint"?o=`Number must be ${n.exact?"exactly equal to ":n.inclusive?"greater than or equal to ":"greater than "}${n.minimum}`:n.type==="date"?o=`Date must be ${n.exact?"exactly equal to ":n.inclusive?"greater than or equal to ":"greater than "}${new Date(Number(n.minimum))}`:o="Invalid input";break;case ye.too_big:n.type==="array"?o=`Array must contain ${n.exact?"exactly":n.inclusive?"at most":"less than"} ${n.maximum} element(s)`:n.type==="string"?o=`String must contain ${n.exact?"exactly":n.inclusive?"at most":"under"} ${n.maximum} character(s)`:n.type==="number"?o=`Number must be ${n.exact?"exactly":n.inclusive?"less than or equal to":"less than"} ${n.maximum}`:n.type==="bigint"?o=`BigInt must be ${n.exact?"exactly":n.inclusive?"less than or equal to":"less than"} ${n.maximum}`:n.type==="date"?o=`Date must be ${n.exact?"exactly":n.inclusive?"smaller than or equal to":"smaller than"} ${new Date(Number(n.maximum))}`:o="Invalid input";break;case ye.custom:o="Invalid input";break;case ye.invalid_intersection_types:o="Intersection results could not be merged";break;case ye.not_multiple_of:o=`Number must be a multiple of ${n.multipleOf}`;break;case ye.not_finite:o="Number must be finite";break;default:o=r.defaultError,tt.assertNever(n)}return{message:o}};let H2=bd;function Z2(){return H2}const V2=n=>{const{data:r,path:o,errorMaps:l,issueData:s}=n,c=[...o,...s.path||[]],f={...s,path:c};if(s.message!==void 0)return{...s,path:c,message:s.message};let h="";const p=l.filter(m=>!!m).slice().reverse();for(const m of p)h=m(f,{data:r,defaultError:h}).message;return{...s,path:c,message:h}};function ze(n,r){const o=Z2(),l=V2({issueData:r,data:n.data,path:n.path,errorMaps:[n.common.contextualErrorMap,n.schemaErrorMap,o,o===bd?void 0:bd].filter(s=>!!s)});n.common.issues.push(l)}class ca{constructor(){this.value="valid"}dirty(){this.value==="valid"&&(this.value="dirty")}abort(){this.value!=="aborted"&&(this.value="aborted")}static mergeArray(r,o){const l=[];for(const s of o){if(s.status==="aborted")return Ze;s.status==="dirty"&&r.dirty(),l.push(s.value)}return{status:r.value,value:l}}static async mergeObjectAsync(r,o){const l=[];for(const s of o){const c=await s.key,f=await s.value;l.push({key:c,value:f})}return ca.mergeObjectSync(r,l)}static mergeObjectSync(r,o){const l={};for(const s of o){const{key:c,value:f}=s;if(c.status==="aborted"||f.status==="aborted")return Ze;c.status==="dirty"&&r.dirty(),f.status==="dirty"&&r.dirty(),c.value!=="__proto__"&&(typeof f.value<"u"||s.alwaysSet)&&(l[c.value]=f.value)}return{status:r.value,value:l}}}const Ze=Object.freeze({status:"aborted"}),ko=n=>({status:"dirty",value:n}),Ca=n=>({status:"valid",value:n}),Og=n=>n.status==="aborted",jg=n=>n.status==="dirty",bi=n=>n.status==="valid",cs=n=>typeof Promise<"u"&&n instanceof Promise;var je;(function(n){n.errToObj=r=>typeof r=="string"?{message:r}:r||{},n.toString=r=>typeof r=="string"?r:r==null?void 0:r.message})(je||(je={}));class Xn{constructor(r,o,l,s){this._cachedPath=[],this.parent=r,this.data=o,this._path=l,this._key=s}get path(){return this._cachedPath.length||(Array.isArray(this._key)?this._cachedPath.push(...this._path,...this._key):this._cachedPath.push(...this._path,this._key)),this._cachedPath}}const Rg=(n,r)=>{if(bi(r))return{success:!0,data:r.value};if(!n.common.issues.length)throw new Error("Validation failed but no issues detected.");return{success:!1,get error(){if(this._error)return this._error;const o=new fn(n.common.issues);return this._error=o,this._error}}};function Xe(n){if(!n)return{};const{errorMap:r,invalid_type_error:o,required_error:l,description:s}=n;if(r&&(o||l))throw new Error(`Can't use "invalid_type_error" or "required_error" in conjunction with custom error map.`);return r?{errorMap:r,description:s}:{errorMap:(f,h)=>{const{message:p}=n;return f.code==="invalid_enum_value"?{message:p??h.defaultError}:typeof h.data>"u"?{message:p??l??h.defaultError}:f.code!=="invalid_type"?{message:h.defaultError}:{message:p??o??h.defaultError}},description:s}}class We{get description(){return this._def.description}_getType(r){return qn(r.data)}_getOrReturnCtx(r,o){return o||{common:r.parent.common,data:r.data,parsedType:qn(r.data),schemaErrorMap:this._def.errorMap,path:r.path,parent:r.parent}}_processInputParams(r){return{status:new ca,ctx:{common:r.parent.common,data:r.data,parsedType:qn(r.data),schemaErrorMap:this._def.errorMap,path:r.path,parent:r.parent}}}_parseSync(r){const o=this._parse(r);if(cs(o))throw new Error("Synchronous parse encountered promise.");return o}_parseAsync(r){const o=this._parse(r);return Promise.resolve(o)}parse(r,o){const l=this.safeParse(r,o);if(l.success)return l.data;throw l.error}safeParse(r,o){const l={common:{issues:[],async:(o==null?void 0:o.async)??!1,contextualErrorMap:o==null?void 0:o.errorMap},path:(o==null?void 0:o.path)||[],schemaErrorMap:this._def.errorMap,parent:null,data:r,parsedType:qn(r)},s=this._parseSync({data:r,path:l.path,parent:l});return Rg(l,s)}"~validate"(r){var l,s;const o={common:{issues:[],async:!!this["~standard"].async},path:[],schemaErrorMap:this._def.errorMap,parent:null,data:r,parsedType:qn(r)};if(!this["~standard"].async)try{const c=this._parseSync({data:r,path:[],parent:o});return bi(c)?{value:c.value}:{issues:o.common.issues}}catch(c){(s=(l=c==null?void 0:c.message)==null?void 0:l.toLowerCase())!=null&&s.includes("encountered")&&(this["~standard"].async=!0),o.common={issues:[],async:!0}}return this._parseAsync({data:r,path:[],parent:o}).then(c=>bi(c)?{value:c.value}:{issues:o.common.issues})}async parseAsync(r,o){const l=await this.safeParseAsync(r,o);if(l.success)return l.data;throw l.error}async safeParseAsync(r,o){const l={common:{issues:[],contextualErrorMap:o==null?void 0:o.errorMap,async:!0},path:(o==null?void 0:o.path)||[],schemaErrorMap:this._def.errorMap,parent:null,data:r,parsedType:qn(r)},s=this._parse({data:r,path:l.path,parent:l}),c=await(cs(s)?s:Promise.resolve(s));return Rg(l,c)}refine(r,o){const l=s=>typeof o=="string"||typeof o>"u"?{message:o}:typeof o=="function"?o(s):o;return this._refinement((s,c)=>{const f=r(s),h=()=>c.addIssue({code:ye.custom,...l(s)});return typeof Promise<"u"&&f instanceof Promise?f.then(p=>p?!0:(h(),!1)):f?!0:(h(),!1)})}refinement(r,o){return this._refinement((l,s)=>r(l)?!0:(s.addIssue(typeof o=="function"?o(l,s):o),!1))}_refinement(r){return new xi({schema:this,typeName:Ve.ZodEffects,effect:{type:"refinement",refinement:r}})}superRefine(r){return this._refinement(r)}constructor(r){this.spa=this.safeParseAsync,this._def=r,this.parse=this.parse.bind(this),this.safeParse=this.safeParse.bind(this),this.parseAsync=this.parseAsync.bind(this),this.safeParseAsync=this.safeParseAsync.bind(this),this.spa=this.spa.bind(this),this.refine=this.refine.bind(this),this.refinement=this.refinement.bind(this),this.superRefine=this.superRefine.bind(this),this.optional=this.optional.bind(this),this.nullable=this.nullable.bind(this),this.nullish=this.nullish.bind(this),this.array=this.array.bind(this),this.promise=this.promise.bind(this),this.or=this.or.bind(this),this.and=this.and.bind(this),this.transform=this.transform.bind(this),this.brand=this.brand.bind(this),this.default=this.default.bind(this),this.catch=this.catch.bind(this),this.describe=this.describe.bind(this),this.pipe=this.pipe.bind(this),this.readonly=this.readonly.bind(this),this.isNullable=this.isNullable.bind(this),this.isOptional=this.isOptional.bind(this),this["~standard"]={version:1,vendor:"zod",validate:o=>this["~validate"](o)}}optional(){return Va.create(this,this._def)}nullable(){return wi.create(this,this._def)}nullish(){return this.nullable().optional()}array(){return za.create(this)}promise(){return ps.create(this,this._def)}or(r){return fs.create([this,r],this._def)}and(r){return hs.create(this,r,this._def)}transform(r){return new xi({...Xe(this._def),schema:this,typeName:Ve.ZodEffects,effect:{type:"transform",transform:r}})}default(r){const o=typeof r=="function"?r:()=>r;return new Ao({...Xe(this._def),innerType:this,defaultValue:o,typeName:Ve.ZodDefault})}brand(){return new u_({typeName:Ve.ZodBranded,type:this,...Xe(this._def)})}catch(r){const o=typeof r=="function"?r:()=>r;return new xd({...Xe(this._def),innerType:this,catchValue:o,typeName:Ve.ZodCatch})}describe(r){const o=this.constructor;return new o({...this._def,description:r})}pipe(r){return Xd.create(this,r)}readonly(){return wd.create(this)}isOptional(){return this.safeParse(void 0).success}isNullable(){return this.safeParse(null).success}}const q2=/^c[^\s-]{8,}$/i,G2=/^[0-9a-z]+$/,Y2=/^[0-9A-HJKMNP-TV-Z]{26}$/i,I2=/^[0-9a-fA-F]{8}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{12}$/i,X2=/^[a-z0-9_-]{21}$/i,Q2=/^[A-Za-z0-9-_]+\.[A-Za-z0-9-_]+\.[A-Za-z0-9-_]*$/,F2=/^[-+]?P(?!$)(?:(?:[-+]?\d+Y)|(?:[-+]?\d+[.,]\d+Y$))?(?:(?:[-+]?\d+M)|(?:[-+]?\d+[.,]\d+M$))?(?:(?:[-+]?\d+W)|(?:[-+]?\d+[.,]\d+W$))?(?:(?:[-+]?\d+D)|(?:[-+]?\d+[.,]\d+D$))?(?:T(?=[\d+-])(?:(?:[-+]?\d+H)|(?:[-+]?\d+[.,]\d+H$))?(?:(?:[-+]?\d+M)|(?:[-+]?\d+[.,]\d+M$))?(?:[-+]?\d+(?:[.,]\d+)?S)?)??$/,K2=/^(?!\.)(?!.*\.\.)([A-Z0-9_'+\-\.]*)[A-Z0-9_+-]@([A-Z0-9][A-Z0-9\-]*\.)+[A-Z]{2,}$/i,P2="^(\\p{Extended_Pictographic}|\\p{Emoji_Component})+$";let rd;const J2=/^(?:(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])$/,W2=/^(?:(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\/(3[0-2]|[12]?[0-9])$/,$2=/^(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))$/,e_=/^(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))\/(12[0-8]|1[01][0-9]|[1-9]?[0-9])$/,t_=/^([0-9a-zA-Z+/]{4})*(([0-9a-zA-Z+/]{2}==)|([0-9a-zA-Z+/]{3}=))?$/,a_=/^([0-9a-zA-Z-_]{4})*(([0-9a-zA-Z-_]{2}(==)?)|([0-9a-zA-Z-_]{3}(=)?))?$/,u0="((\\d\\d[2468][048]|\\d\\d[13579][26]|\\d\\d0[48]|[02468][048]00|[13579][26]00)-02-29|\\d{4}-((0[13578]|1[02])-(0[1-9]|[12]\\d|3[01])|(0[469]|11)-(0[1-9]|[12]\\d|30)|(02)-(0[1-9]|1\\d|2[0-8])))",n_=new RegExp(`^${u0}$`);function d0(n){let r="[0-5]\\d";n.precision?r=`${r}\\.\\d{${n.precision}}`:n.precision==null&&(r=`${r}(\\.\\d+)?`);const o=n.precision?"+":"?";return`([01]\\d|2[0-3]):[0-5]\\d(:${r})${o}`}function r_(n){return new RegExp(`^${d0(n)}$`)}function i_(n){let r=`${u0}T${d0(n)}`;const o=[];return o.push(n.local?"Z?":"Z"),n.offset&&o.push("([+-]\\d{2}:?\\d{2})"),r=`${r}(${o.join("|")})`,new RegExp(`^${r}$`)}function o_(n,r){return!!((r==="v4"||!r)&&J2.test(n)||(r==="v6"||!r)&&$2.test(n))}function l_(n,r){if(!Q2.test(n))return!1;try{const[o]=n.split(".");if(!o)return!1;const l=o.replace(/-/g,"+").replace(/_/g,"/").padEnd(o.length+(4-o.length%4)%4,"="),s=JSON.parse(atob(l));return!(typeof s!="object"||s===null||"typ"in s&&(s==null?void 0:s.typ)!=="JWT"||!s.alg||r&&s.alg!==r)}catch{return!1}}function s_(n,r){return!!((r==="v4"||!r)&&W2.test(n)||(r==="v6"||!r)&&e_.test(n))}class dn extends We{_parse(r){if(this._def.coerce&&(r.data=String(r.data)),this._getType(r)!==Ne.string){const c=this._getOrReturnCtx(r);return ze(c,{code:ye.invalid_type,expected:Ne.string,received:c.parsedType}),Ze}const l=new ca;let s;for(const c of this._def.checks)if(c.kind==="min")r.data.length<c.value&&(s=this._getOrReturnCtx(r,s),ze(s,{code:ye.too_small,minimum:c.value,type:"string",inclusive:!0,exact:!1,message:c.message}),l.dirty());else if(c.kind==="max")r.data.length>c.value&&(s=this._getOrReturnCtx(r,s),ze(s,{code:ye.too_big,maximum:c.value,type:"string",inclusive:!0,exact:!1,message:c.message}),l.dirty());else if(c.kind==="length"){const f=r.data.length>c.value,h=r.data.length<c.value;(f||h)&&(s=this._getOrReturnCtx(r,s),f?ze(s,{code:ye.too_big,maximum:c.value,type:"string",inclusive:!0,exact:!0,message:c.message}):h&&ze(s,{code:ye.too_small,minimum:c.value,type:"string",inclusive:!0,exact:!0,message:c.message}),l.dirty())}else if(c.kind==="email")K2.test(r.data)||(s=this._getOrReturnCtx(r,s),ze(s,{validation:"email",code:ye.invalid_string,message:c.message}),l.dirty());else if(c.kind==="emoji")rd||(rd=new RegExp(P2,"u")),rd.test(r.data)||(s=this._getOrReturnCtx(r,s),ze(s,{validation:"emoji",code:ye.invalid_string,message:c.message}),l.dirty());else if(c.kind==="uuid")I2.test(r.data)||(s=this._getOrReturnCtx(r,s),ze(s,{validation:"uuid",code:ye.invalid_string,message:c.message}),l.dirty());else if(c.kind==="nanoid")X2.test(r.data)||(s=this._getOrReturnCtx(r,s),ze(s,{validation:"nanoid",code:ye.invalid_string,message:c.message}),l.dirty());else if(c.kind==="cuid")q2.test(r.data)||(s=this._getOrReturnCtx(r,s),ze(s,{validation:"cuid",code:ye.invalid_string,message:c.message}),l.dirty());else if(c.kind==="cuid2")G2.test(r.data)||(s=this._getOrReturnCtx(r,s),ze(s,{validation:"cuid2",code:ye.invalid_string,message:c.message}),l.dirty());else if(c.kind==="ulid")Y2.test(r.data)||(s=this._getOrReturnCtx(r,s),ze(s,{validation:"ulid",code:ye.invalid_string,message:c.message}),l.dirty());else if(c.kind==="url")try{new URL(r.data)}catch{s=this._getOrReturnCtx(r,s),ze(s,{validation:"url",code:ye.invalid_string,message:c.message}),l.dirty()}else c.kind==="regex"?(c.regex.lastIndex=0,c.regex.test(r.data)||(s=this._getOrReturnCtx(r,s),ze(s,{validation:"regex",code:ye.invalid_string,message:c.message}),l.dirty())):c.kind==="trim"?r.data=r.data.trim():c.kind==="includes"?r.data.includes(c.value,c.position)||(s=this._getOrReturnCtx(r,s),ze(s,{code:ye.invalid_string,validation:{includes:c.value,position:c.position},message:c.message}),l.dirty()):c.kind==="toLowerCase"?r.data=r.data.toLowerCase():c.kind==="toUpperCase"?r.data=r.data.toUpperCase():c.kind==="startsWith"?r.data.startsWith(c.value)||(s=this._getOrReturnCtx(r,s),ze(s,{code:ye.invalid_string,validation:{startsWith:c.value},message:c.message}),l.dirty()):c.kind==="endsWith"?r.data.endsWith(c.value)||(s=this._getOrReturnCtx(r,s),ze(s,{code:ye.invalid_string,validation:{endsWith:c.value},message:c.message}),l.dirty()):c.kind==="datetime"?i_(c).test(r.data)||(s=this._getOrReturnCtx(r,s),ze(s,{code:ye.invalid_string,validation:"datetime",message:c.message}),l.dirty()):c.kind==="date"?n_.test(r.data)||(s=this._getOrReturnCtx(r,s),ze(s,{code:ye.invalid_string,validation:"date",message:c.message}),l.dirty()):c.kind==="time"?r_(c).test(r.data)||(s=this._getOrReturnCtx(r,s),ze(s,{code:ye.invalid_string,validation:"time",message:c.message}),l.dirty()):c.kind==="duration"?F2.test(r.data)||(s=this._getOrReturnCtx(r,s),ze(s,{validation:"duration",code:ye.invalid_string,message:c.message}),l.dirty()):c.kind==="ip"?o_(r.data,c.version)||(s=this._getOrReturnCtx(r,s),ze(s,{validation:"ip",code:ye.invalid_string,message:c.message}),l.dirty()):c.kind==="jwt"?l_(r.data,c.alg)||(s=this._getOrReturnCtx(r,s),ze(s,{validation:"jwt",code:ye.invalid_string,message:c.message}),l.dirty()):c.kind==="cidr"?s_(r.data,c.version)||(s=this._getOrReturnCtx(r,s),ze(s,{validation:"cidr",code:ye.invalid_string,message:c.message}),l.dirty()):c.kind==="base64"?t_.test(r.data)||(s=this._getOrReturnCtx(r,s),ze(s,{validation:"base64",code:ye.invalid_string,message:c.message}),l.dirty()):c.kind==="base64url"?a_.test(r.data)||(s=this._getOrReturnCtx(r,s),ze(s,{validation:"base64url",code:ye.invalid_string,message:c.message}),l.dirty()):tt.assertNever(c);return{status:l.value,value:r.data}}_regex(r,o,l){return this.refinement(s=>r.test(s),{validation:o,code:ye.invalid_string,...je.errToObj(l)})}_addCheck(r){return new dn({...this._def,checks:[...this._def.checks,r]})}email(r){return this._addCheck({kind:"email",...je.errToObj(r)})}url(r){return this._addCheck({kind:"url",...je.errToObj(r)})}emoji(r){return this._addCheck({kind:"emoji",...je.errToObj(r)})}uuid(r){return this._addCheck({kind:"uuid",...je.errToObj(r)})}nanoid(r){return this._addCheck({kind:"nanoid",...je.errToObj(r)})}cuid(r){return this._addCheck({kind:"cuid",...je.errToObj(r)})}cuid2(r){return this._addCheck({kind:"cuid2",...je.errToObj(r)})}ulid(r){return this._addCheck({kind:"ulid",...je.errToObj(r)})}base64(r){return this._addCheck({kind:"base64",...je.errToObj(r)})}base64url(r){return this._addCheck({kind:"base64url",...je.errToObj(r)})}jwt(r){return this._addCheck({kind:"jwt",...je.errToObj(r)})}ip(r){return this._addCheck({kind:"ip",...je.errToObj(r)})}cidr(r){return this._addCheck({kind:"cidr",...je.errToObj(r)})}datetime(r){return typeof r=="string"?this._addCheck({kind:"datetime",precision:null,offset:!1,local:!1,message:r}):this._addCheck({kind:"datetime",precision:typeof(r==null?void 0:r.precision)>"u"?null:r==null?void 0:r.precision,offset:(r==null?void 0:r.offset)??!1,local:(r==null?void 0:r.local)??!1,...je.errToObj(r==null?void 0:r.message)})}date(r){return this._addCheck({kind:"date",message:r})}time(r){return typeof r=="string"?this._addCheck({kind:"time",precision:null,message:r}):this._addCheck({kind:"time",precision:typeof(r==null?void 0:r.precision)>"u"?null:r==null?void 0:r.precision,...je.errToObj(r==null?void 0:r.message)})}duration(r){return this._addCheck({kind:"duration",...je.errToObj(r)})}regex(r,o){return this._addCheck({kind:"regex",regex:r,...je.errToObj(o)})}includes(r,o){return this._addCheck({kind:"includes",value:r,position:o==null?void 0:o.position,...je.errToObj(o==null?void 0:o.message)})}startsWith(r,o){return this._addCheck({kind:"startsWith",value:r,...je.errToObj(o)})}endsWith(r,o){return this._addCheck({kind:"endsWith",value:r,...je.errToObj(o)})}min(r,o){return this._addCheck({kind:"min",value:r,...je.errToObj(o)})}max(r,o){return this._addCheck({kind:"max",value:r,...je.errToObj(o)})}length(r,o){return this._addCheck({kind:"length",value:r,...je.errToObj(o)})}nonempty(r){return this.min(1,je.errToObj(r))}trim(){return new dn({...this._def,checks:[...this._def.checks,{kind:"trim"}]})}toLowerCase(){return new dn({...this._def,checks:[...this._def.checks,{kind:"toLowerCase"}]})}toUpperCase(){return new dn({...this._def,checks:[...this._def.checks,{kind:"toUpperCase"}]})}get isDatetime(){return!!this._def.checks.find(r=>r.kind==="datetime")}get isDate(){return!!this._def.checks.find(r=>r.kind==="date")}get isTime(){return!!this._def.checks.find(r=>r.kind==="time")}get isDuration(){return!!this._def.checks.find(r=>r.kind==="duration")}get isEmail(){return!!this._def.checks.find(r=>r.kind==="email")}get isURL(){return!!this._def.checks.find(r=>r.kind==="url")}get isEmoji(){return!!this._def.checks.find(r=>r.kind==="emoji")}get isUUID(){return!!this._def.checks.find(r=>r.kind==="uuid")}get isNANOID(){return!!this._def.checks.find(r=>r.kind==="nanoid")}get isCUID(){return!!this._def.checks.find(r=>r.kind==="cuid")}get isCUID2(){return!!this._def.checks.find(r=>r.kind==="cuid2")}get isULID(){return!!this._def.checks.find(r=>r.kind==="ulid")}get isIP(){return!!this._def.checks.find(r=>r.kind==="ip")}get isCIDR(){return!!this._def.checks.find(r=>r.kind==="cidr")}get isBase64(){return!!this._def.checks.find(r=>r.kind==="base64")}get isBase64url(){return!!this._def.checks.find(r=>r.kind==="base64url")}get minLength(){let r=null;for(const o of this._def.checks)o.kind==="min"&&(r===null||o.value>r)&&(r=o.value);return r}get maxLength(){let r=null;for(const o of this._def.checks)o.kind==="max"&&(r===null||o.value<r)&&(r=o.value);return r}}dn.create=n=>new dn({checks:[],typeName:Ve.ZodString,coerce:(n==null?void 0:n.coerce)??!1,...Xe(n)});function c_(n,r){const o=(n.toString().split(".")[1]||"").length,l=(r.toString().split(".")[1]||"").length,s=o>l?o:l,c=Number.parseInt(n.toFixed(s).replace(".","")),f=Number.parseInt(r.toFixed(s).replace(".",""));return c%f/10**s}class yi extends We{constructor(){super(...arguments),this.min=this.gte,this.max=this.lte,this.step=this.multipleOf}_parse(r){if(this._def.coerce&&(r.data=Number(r.data)),this._getType(r)!==Ne.number){const c=this._getOrReturnCtx(r);return ze(c,{code:ye.invalid_type,expected:Ne.number,received:c.parsedType}),Ze}let l;const s=new ca;for(const c of this._def.checks)c.kind==="int"?tt.isInteger(r.data)||(l=this._getOrReturnCtx(r,l),ze(l,{code:ye.invalid_type,expected:"integer",received:"float",message:c.message}),s.dirty()):c.kind==="min"?(c.inclusive?r.data<c.value:r.data<=c.value)&&(l=this._getOrReturnCtx(r,l),ze(l,{code:ye.too_small,minimum:c.value,type:"number",inclusive:c.inclusive,exact:!1,message:c.message}),s.dirty()):c.kind==="max"?(c.inclusive?r.data>c.value:r.data>=c.value)&&(l=this._getOrReturnCtx(r,l),ze(l,{code:ye.too_big,maximum:c.value,type:"number",inclusive:c.inclusive,exact:!1,message:c.message}),s.dirty()):c.kind==="multipleOf"?c_(r.data,c.value)!==0&&(l=this._getOrReturnCtx(r,l),ze(l,{code:ye.not_multiple_of,multipleOf:c.value,message:c.message}),s.dirty()):c.kind==="finite"?Number.isFinite(r.data)||(l=this._getOrReturnCtx(r,l),ze(l,{code:ye.not_finite,message:c.message}),s.dirty()):tt.assertNever(c);return{status:s.value,value:r.data}}gte(r,o){return this.setLimit("min",r,!0,je.toString(o))}gt(r,o){return this.setLimit("min",r,!1,je.toString(o))}lte(r,o){return this.setLimit("max",r,!0,je.toString(o))}lt(r,o){return this.setLimit("max",r,!1,je.toString(o))}setLimit(r,o,l,s){return new yi({...this._def,checks:[...this._def.checks,{kind:r,value:o,inclusive:l,message:je.toString(s)}]})}_addCheck(r){return new yi({...this._def,checks:[...this._def.checks,r]})}int(r){return this._addCheck({kind:"int",message:je.toString(r)})}positive(r){return this._addCheck({kind:"min",value:0,inclusive:!1,message:je.toString(r)})}negative(r){return this._addCheck({kind:"max",value:0,inclusive:!1,message:je.toString(r)})}nonpositive(r){return this._addCheck({kind:"max",value:0,inclusive:!0,message:je.toString(r)})}nonnegative(r){return this._addCheck({kind:"min",value:0,inclusive:!0,message:je.toString(r)})}multipleOf(r,o){return this._addCheck({kind:"multipleOf",value:r,message:je.toString(o)})}finite(r){return this._addCheck({kind:"finite",message:je.toString(r)})}safe(r){return this._addCheck({kind:"min",inclusive:!0,value:Number.MIN_SAFE_INTEGER,message:je.toString(r)})._addCheck({kind:"max",inclusive:!0,value:Number.MAX_SAFE_INTEGER,message:je.toString(r)})}get minValue(){let r=null;for(const o of this._def.checks)o.kind==="min"&&(r===null||o.value>r)&&(r=o.value);return r}get maxValue(){let r=null;for(const o of this._def.checks)o.kind==="max"&&(r===null||o.value<r)&&(r=o.value);return r}get isInt(){return!!this._def.checks.find(r=>r.kind==="int"||r.kind==="multipleOf"&&tt.isInteger(r.value))}get isFinite(){let r=null,o=null;for(const l of this._def.checks){if(l.kind==="finite"||l.kind==="int"||l.kind==="multipleOf")return!0;l.kind==="min"?(o===null||l.value>o)&&(o=l.value):l.kind==="max"&&(r===null||l.value<r)&&(r=l.value)}return Number.isFinite(o)&&Number.isFinite(r)}}yi.create=n=>new yi({checks:[],typeName:Ve.ZodNumber,coerce:(n==null?void 0:n.coerce)||!1,...Xe(n)});class zo extends We{constructor(){super(...arguments),this.min=this.gte,this.max=this.lte}_parse(r){if(this._def.coerce)try{r.data=BigInt(r.data)}catch{return this._getInvalidInput(r)}if(this._getType(r)!==Ne.bigint)return this._getInvalidInput(r);let l;const s=new ca;for(const c of this._def.checks)c.kind==="min"?(c.inclusive?r.data<c.value:r.data<=c.value)&&(l=this._getOrReturnCtx(r,l),ze(l,{code:ye.too_small,type:"bigint",minimum:c.value,inclusive:c.inclusive,message:c.message}),s.dirty()):c.kind==="max"?(c.inclusive?r.data>c.value:r.data>=c.value)&&(l=this._getOrReturnCtx(r,l),ze(l,{code:ye.too_big,type:"bigint",maximum:c.value,inclusive:c.inclusive,message:c.message}),s.dirty()):c.kind==="multipleOf"?r.data%c.value!==BigInt(0)&&(l=this._getOrReturnCtx(r,l),ze(l,{code:ye.not_multiple_of,multipleOf:c.value,message:c.message}),s.dirty()):tt.assertNever(c);return{status:s.value,value:r.data}}_getInvalidInput(r){const o=this._getOrReturnCtx(r);return ze(o,{code:ye.invalid_type,expected:Ne.bigint,received:o.parsedType}),Ze}gte(r,o){return this.setLimit("min",r,!0,je.toString(o))}gt(r,o){return this.setLimit("min",r,!1,je.toString(o))}lte(r,o){return this.setLimit("max",r,!0,je.toString(o))}lt(r,o){return this.setLimit("max",r,!1,je.toString(o))}setLimit(r,o,l,s){return new zo({...this._def,checks:[...this._def.checks,{kind:r,value:o,inclusive:l,message:je.toString(s)}]})}_addCheck(r){return new zo({...this._def,checks:[...this._def.checks,r]})}positive(r){return this._addCheck({kind:"min",value:BigInt(0),inclusive:!1,message:je.toString(r)})}negative(r){return this._addCheck({kind:"max",value:BigInt(0),inclusive:!1,message:je.toString(r)})}nonpositive(r){return this._addCheck({kind:"max",value:BigInt(0),inclusive:!0,message:je.toString(r)})}nonnegative(r){return this._addCheck({kind:"min",value:BigInt(0),inclusive:!0,message:je.toString(r)})}multipleOf(r,o){return this._addCheck({kind:"multipleOf",value:r,message:je.toString(o)})}get minValue(){let r=null;for(const o of this._def.checks)o.kind==="min"&&(r===null||o.value>r)&&(r=o.value);return r}get maxValue(){let r=null;for(const o of this._def.checks)o.kind==="max"&&(r===null||o.value<r)&&(r=o.value);return r}}zo.create=n=>new zo({checks:[],typeName:Ve.ZodBigInt,coerce:(n==null?void 0:n.coerce)??!1,...Xe(n)});class us extends We{_parse(r){if(this._def.coerce&&(r.data=!!r.data),this._getType(r)!==Ne.boolean){const l=this._getOrReturnCtx(r);return ze(l,{code:ye.invalid_type,expected:Ne.boolean,received:l.parsedType}),Ze}return Ca(r.data)}}us.create=n=>new us({typeName:Ve.ZodBoolean,coerce:(n==null?void 0:n.coerce)||!1,...Xe(n)});class ds extends We{_parse(r){if(this._def.coerce&&(r.data=new Date(r.data)),this._getType(r)!==Ne.date){const c=this._getOrReturnCtx(r);return ze(c,{code:ye.invalid_type,expected:Ne.date,received:c.parsedType}),Ze}if(Number.isNaN(r.data.getTime())){const c=this._getOrReturnCtx(r);return ze(c,{code:ye.invalid_date}),Ze}const l=new ca;let s;for(const c of this._def.checks)c.kind==="min"?r.data.getTime()<c.value&&(s=this._getOrReturnCtx(r,s),ze(s,{code:ye.too_small,message:c.message,inclusive:!0,exact:!1,minimum:c.value,type:"date"}),l.dirty()):c.kind==="max"?r.data.getTime()>c.value&&(s=this._getOrReturnCtx(r,s),ze(s,{code:ye.too_big,message:c.message,inclusive:!0,exact:!1,maximum:c.value,type:"date"}),l.dirty()):tt.assertNever(c);return{status:l.value,value:new Date(r.data.getTime())}}_addCheck(r){return new ds({...this._def,checks:[...this._def.checks,r]})}min(r,o){return this._addCheck({kind:"min",value:r.getTime(),message:je.toString(o)})}max(r,o){return this._addCheck({kind:"max",value:r.getTime(),message:je.toString(o)})}get minDate(){let r=null;for(const o of this._def.checks)o.kind==="min"&&(r===null||o.value>r)&&(r=o.value);return r!=null?new Date(r):null}get maxDate(){let r=null;for(const o of this._def.checks)o.kind==="max"&&(r===null||o.value<r)&&(r=o.value);return r!=null?new Date(r):null}}ds.create=n=>new ds({checks:[],coerce:(n==null?void 0:n.coerce)||!1,typeName:Ve.ZodDate,...Xe(n)});class Mg extends We{_parse(r){if(this._getType(r)!==Ne.symbol){const l=this._getOrReturnCtx(r);return ze(l,{code:ye.invalid_type,expected:Ne.symbol,received:l.parsedType}),Ze}return Ca(r.data)}}Mg.create=n=>new Mg({typeName:Ve.ZodSymbol,...Xe(n)});class Dg extends We{_parse(r){if(this._getType(r)!==Ne.undefined){const l=this._getOrReturnCtx(r);return ze(l,{code:ye.invalid_type,expected:Ne.undefined,received:l.parsedType}),Ze}return Ca(r.data)}}Dg.create=n=>new Dg({typeName:Ve.ZodUndefined,...Xe(n)});class Bg extends We{_parse(r){if(this._getType(r)!==Ne.null){const l=this._getOrReturnCtx(r);return ze(l,{code:ye.invalid_type,expected:Ne.null,received:l.parsedType}),Ze}return Ca(r.data)}}Bg.create=n=>new Bg({typeName:Ve.ZodNull,...Xe(n)});class Ug extends We{constructor(){super(...arguments),this._any=!0}_parse(r){return Ca(r.data)}}Ug.create=n=>new Ug({typeName:Ve.ZodAny,...Xe(n)});class Lg extends We{constructor(){super(...arguments),this._unknown=!0}_parse(r){return Ca(r.data)}}Lg.create=n=>new Lg({typeName:Ve.ZodUnknown,...Xe(n)});class Qn extends We{_parse(r){const o=this._getOrReturnCtx(r);return ze(o,{code:ye.invalid_type,expected:Ne.never,received:o.parsedType}),Ze}}Qn.create=n=>new Qn({typeName:Ve.ZodNever,...Xe(n)});class Hg extends We{_parse(r){if(this._getType(r)!==Ne.undefined){const l=this._getOrReturnCtx(r);return ze(l,{code:ye.invalid_type,expected:Ne.void,received:l.parsedType}),Ze}return Ca(r.data)}}Hg.create=n=>new Hg({typeName:Ve.ZodVoid,...Xe(n)});class za extends We{_parse(r){const{ctx:o,status:l}=this._processInputParams(r),s=this._def;if(o.parsedType!==Ne.array)return ze(o,{code:ye.invalid_type,expected:Ne.array,received:o.parsedType}),Ze;if(s.exactLength!==null){const f=o.data.length>s.exactLength.value,h=o.data.length<s.exactLength.value;(f||h)&&(ze(o,{code:f?ye.too_big:ye.too_small,minimum:h?s.exactLength.value:void 0,maximum:f?s.exactLength.value:void 0,type:"array",inclusive:!0,exact:!0,message:s.exactLength.message}),l.dirty())}if(s.minLength!==null&&o.data.length<s.minLength.value&&(ze(o,{code:ye.too_small,minimum:s.minLength.value,type:"array",inclusive:!0,exact:!1,message:s.minLength.message}),l.dirty()),s.maxLength!==null&&o.data.length>s.maxLength.value&&(ze(o,{code:ye.too_big,maximum:s.maxLength.value,type:"array",inclusive:!0,exact:!1,message:s.maxLength.message}),l.dirty()),o.common.async)return Promise.all([...o.data].map((f,h)=>s.type._parseAsync(new Xn(o,f,o.path,h)))).then(f=>ca.mergeArray(l,f));const c=[...o.data].map((f,h)=>s.type._parseSync(new Xn(o,f,o.path,h)));return ca.mergeArray(l,c)}get element(){return this._def.type}min(r,o){return new za({...this._def,minLength:{value:r,message:je.toString(o)}})}max(r,o){return new za({...this._def,maxLength:{value:r,message:je.toString(o)}})}length(r,o){return new za({...this._def,exactLength:{value:r,message:je.toString(o)}})}nonempty(r){return this.min(1,r)}}za.create=(n,r)=>new za({type:n,minLength:null,maxLength:null,exactLength:null,typeName:Ve.ZodArray,...Xe(r)});function pi(n){if(n instanceof yt){const r={};for(const o in n.shape){const l=n.shape[o];r[o]=Va.create(pi(l))}return new yt({...n._def,shape:()=>r})}else return n instanceof za?new za({...n._def,type:pi(n.element)}):n instanceof Va?Va.create(pi(n.unwrap())):n instanceof wi?wi.create(pi(n.unwrap())):n instanceof xr?xr.create(n.items.map(r=>pi(r))):n}class yt extends We{constructor(){super(...arguments),this._cached=null,this.nonstrict=this.passthrough,this.augment=this.extend}_getCached(){if(this._cached!==null)return this._cached;const r=this._def.shape(),o=tt.objectKeys(r);return this._cached={shape:r,keys:o},this._cached}_parse(r){if(this._getType(r)!==Ne.object){const m=this._getOrReturnCtx(r);return ze(m,{code:ye.invalid_type,expected:Ne.object,received:m.parsedType}),Ze}const{status:l,ctx:s}=this._processInputParams(r),{shape:c,keys:f}=this._getCached(),h=[];if(!(this._def.catchall instanceof Qn&&this._def.unknownKeys==="strip"))for(const m in s.data)f.includes(m)||h.push(m);const p=[];for(const m of f){const v=c[m],b=s.data[m];p.push({key:{status:"valid",value:m},value:v._parse(new Xn(s,b,s.path,m)),alwaysSet:m in s.data})}if(this._def.catchall instanceof Qn){const m=this._def.unknownKeys;if(m==="passthrough")for(const v of h)p.push({key:{status:"valid",value:v},value:{status:"valid",value:s.data[v]}});else if(m==="strict")h.length>0&&(ze(s,{code:ye.unrecognized_keys,keys:h}),l.dirty());else if(m!=="strip")throw new Error("Internal ZodObject error: invalid unknownKeys value.")}else{const m=this._def.catchall;for(const v of h){const b=s.data[v];p.push({key:{status:"valid",value:v},value:m._parse(new Xn(s,b,s.path,v)),alwaysSet:v in s.data})}}return s.common.async?Promise.resolve().then(async()=>{const m=[];for(const v of p){const b=await v.key,E=await v.value;m.push({key:b,value:E,alwaysSet:v.alwaysSet})}return m}).then(m=>ca.mergeObjectSync(l,m)):ca.mergeObjectSync(l,p)}get shape(){return this._def.shape()}strict(r){return je.errToObj,new yt({...this._def,unknownKeys:"strict",...r!==void 0?{errorMap:(o,l)=>{var c,f;const s=((f=(c=this._def).errorMap)==null?void 0:f.call(c,o,l).message)??l.defaultError;return o.code==="unrecognized_keys"?{message:je.errToObj(r).message??s}:{message:s}}}:{}})}strip(){return new yt({...this._def,unknownKeys:"strip"})}passthrough(){return new yt({...this._def,unknownKeys:"passthrough"})}extend(r){return new yt({...this._def,shape:()=>({...this._def.shape(),...r})})}merge(r){return new yt({unknownKeys:r._def.unknownKeys,catchall:r._def.catchall,shape:()=>({...this._def.shape(),...r._def.shape()}),typeName:Ve.ZodObject})}setKey(r,o){return this.augment({[r]:o})}catchall(r){return new yt({...this._def,catchall:r})}pick(r){const o={};for(const l of tt.objectKeys(r))r[l]&&this.shape[l]&&(o[l]=this.shape[l]);return new yt({...this._def,shape:()=>o})}omit(r){const o={};for(const l of tt.objectKeys(this.shape))r[l]||(o[l]=this.shape[l]);return new yt({...this._def,shape:()=>o})}deepPartial(){return pi(this)}partial(r){const o={};for(const l of tt.objectKeys(this.shape)){const s=this.shape[l];r&&!r[l]?o[l]=s:o[l]=s.optional()}return new yt({...this._def,shape:()=>o})}required(r){const o={};for(const l of tt.objectKeys(this.shape))if(r&&!r[l])o[l]=this.shape[l];else{let c=this.shape[l];for(;c instanceof Va;)c=c._def.innerType;o[l]=c}return new yt({...this._def,shape:()=>o})}keyof(){return f0(tt.objectKeys(this.shape))}}yt.create=(n,r)=>new yt({shape:()=>n,unknownKeys:"strip",catchall:Qn.create(),typeName:Ve.ZodObject,...Xe(r)});yt.strictCreate=(n,r)=>new yt({shape:()=>n,unknownKeys:"strict",catchall:Qn.create(),typeName:Ve.ZodObject,...Xe(r)});yt.lazycreate=(n,r)=>new yt({shape:n,unknownKeys:"strip",catchall:Qn.create(),typeName:Ve.ZodObject,...Xe(r)});class fs extends We{_parse(r){const{ctx:o}=this._processInputParams(r),l=this._def.options;function s(c){for(const h of c)if(h.result.status==="valid")return h.result;for(const h of c)if(h.result.status==="dirty")return o.common.issues.push(...h.ctx.common.issues),h.result;const f=c.map(h=>new fn(h.ctx.common.issues));return ze(o,{code:ye.invalid_union,unionErrors:f}),Ze}if(o.common.async)return Promise.all(l.map(async c=>{const f={...o,common:{...o.common,issues:[]},parent:null};return{result:await c._parseAsync({data:o.data,path:o.path,parent:f}),ctx:f}})).then(s);{let c;const f=[];for(const p of l){const m={...o,common:{...o.common,issues:[]},parent:null},v=p._parseSync({data:o.data,path:o.path,parent:m});if(v.status==="valid")return v;v.status==="dirty"&&!c&&(c={result:v,ctx:m}),m.common.issues.length&&f.push(m.common.issues)}if(c)return o.common.issues.push(...c.ctx.common.issues),c.result;const h=f.map(p=>new fn(p));return ze(o,{code:ye.invalid_union,unionErrors:h}),Ze}}get options(){return this._def.options}}fs.create=(n,r)=>new fs({options:n,typeName:Ve.ZodUnion,...Xe(r)});function yd(n,r){const o=qn(n),l=qn(r);if(n===r)return{valid:!0,data:n};if(o===Ne.object&&l===Ne.object){const s=tt.objectKeys(r),c=tt.objectKeys(n).filter(h=>s.indexOf(h)!==-1),f={...n,...r};for(const h of c){const p=yd(n[h],r[h]);if(!p.valid)return{valid:!1};f[h]=p.data}return{valid:!0,data:f}}else if(o===Ne.array&&l===Ne.array){if(n.length!==r.length)return{valid:!1};const s=[];for(let c=0;c<n.length;c++){const f=n[c],h=r[c],p=yd(f,h);if(!p.valid)return{valid:!1};s.push(p.data)}return{valid:!0,data:s}}else return o===Ne.date&&l===Ne.date&&+n==+r?{valid:!0,data:n}:{valid:!1}}class hs extends We{_parse(r){const{status:o,ctx:l}=this._processInputParams(r),s=(c,f)=>{if(Og(c)||Og(f))return Ze;const h=yd(c.value,f.value);return h.valid?((jg(c)||jg(f))&&o.dirty(),{status:o.value,value:h.data}):(ze(l,{code:ye.invalid_intersection_types}),Ze)};return l.common.async?Promise.all([this._def.left._parseAsync({data:l.data,path:l.path,parent:l}),this._def.right._parseAsync({data:l.data,path:l.path,parent:l})]).then(([c,f])=>s(c,f)):s(this._def.left._parseSync({data:l.data,path:l.path,parent:l}),this._def.right._parseSync({data:l.data,path:l.path,parent:l}))}}hs.create=(n,r,o)=>new hs({left:n,right:r,typeName:Ve.ZodIntersection,...Xe(o)});class xr extends We{_parse(r){const{status:o,ctx:l}=this._processInputParams(r);if(l.parsedType!==Ne.array)return ze(l,{code:ye.invalid_type,expected:Ne.array,received:l.parsedType}),Ze;if(l.data.length<this._def.items.length)return ze(l,{code:ye.too_small,minimum:this._def.items.length,inclusive:!0,exact:!1,type:"array"}),Ze;!this._def.rest&&l.data.length>this._def.items.length&&(ze(l,{code:ye.too_big,maximum:this._def.items.length,inclusive:!0,exact:!1,type:"array"}),o.dirty());const c=[...l.data].map((f,h)=>{const p=this._def.items[h]||this._def.rest;return p?p._parse(new Xn(l,f,l.path,h)):null}).filter(f=>!!f);return l.common.async?Promise.all(c).then(f=>ca.mergeArray(o,f)):ca.mergeArray(o,c)}get items(){return this._def.items}rest(r){return new xr({...this._def,rest:r})}}xr.create=(n,r)=>{if(!Array.isArray(n))throw new Error("You must pass an array of schemas to z.tuple([ ... ])");return new xr({items:n,typeName:Ve.ZodTuple,rest:null,...Xe(r)})};class Zg extends We{get keySchema(){return this._def.keyType}get valueSchema(){return this._def.valueType}_parse(r){const{status:o,ctx:l}=this._processInputParams(r);if(l.parsedType!==Ne.map)return ze(l,{code:ye.invalid_type,expected:Ne.map,received:l.parsedType}),Ze;const s=this._def.keyType,c=this._def.valueType,f=[...l.data.entries()].map(([h,p],m)=>({key:s._parse(new Xn(l,h,l.path,[m,"key"])),value:c._parse(new Xn(l,p,l.path,[m,"value"]))}));if(l.common.async){const h=new Map;return Promise.resolve().then(async()=>{for(const p of f){const m=await p.key,v=await p.value;if(m.status==="aborted"||v.status==="aborted")return Ze;(m.status==="dirty"||v.status==="dirty")&&o.dirty(),h.set(m.value,v.value)}return{status:o.value,value:h}})}else{const h=new Map;for(const p of f){const m=p.key,v=p.value;if(m.status==="aborted"||v.status==="aborted")return Ze;(m.status==="dirty"||v.status==="dirty")&&o.dirty(),h.set(m.value,v.value)}return{status:o.value,value:h}}}}Zg.create=(n,r,o)=>new Zg({valueType:r,keyType:n,typeName:Ve.ZodMap,...Xe(o)});class Co extends We{_parse(r){const{status:o,ctx:l}=this._processInputParams(r);if(l.parsedType!==Ne.set)return ze(l,{code:ye.invalid_type,expected:Ne.set,received:l.parsedType}),Ze;const s=this._def;s.minSize!==null&&l.data.size<s.minSize.value&&(ze(l,{code:ye.too_small,minimum:s.minSize.value,type:"set",inclusive:!0,exact:!1,message:s.minSize.message}),o.dirty()),s.maxSize!==null&&l.data.size>s.maxSize.value&&(ze(l,{code:ye.too_big,maximum:s.maxSize.value,type:"set",inclusive:!0,exact:!1,message:s.maxSize.message}),o.dirty());const c=this._def.valueType;function f(p){const m=new Set;for(const v of p){if(v.status==="aborted")return Ze;v.status==="dirty"&&o.dirty(),m.add(v.value)}return{status:o.value,value:m}}const h=[...l.data.values()].map((p,m)=>c._parse(new Xn(l,p,l.path,m)));return l.common.async?Promise.all(h).then(p=>f(p)):f(h)}min(r,o){return new Co({...this._def,minSize:{value:r,message:je.toString(o)}})}max(r,o){return new Co({...this._def,maxSize:{value:r,message:je.toString(o)}})}size(r,o){return this.min(r,o).max(r,o)}nonempty(r){return this.min(1,r)}}Co.create=(n,r)=>new Co({valueType:n,minSize:null,maxSize:null,typeName:Ve.ZodSet,...Xe(r)});class Vg extends We{get schema(){return this._def.getter()}_parse(r){const{ctx:o}=this._processInputParams(r);return this._def.getter()._parse({data:o.data,path:o.path,parent:o})}}Vg.create=(n,r)=>new Vg({getter:n,typeName:Ve.ZodLazy,...Xe(r)});class qg extends We{_parse(r){if(r.data!==this._def.value){const o=this._getOrReturnCtx(r);return ze(o,{received:o.data,code:ye.invalid_literal,expected:this._def.value}),Ze}return{status:"valid",value:r.data}}get value(){return this._def.value}}qg.create=(n,r)=>new qg({value:n,typeName:Ve.ZodLiteral,...Xe(r)});function f0(n,r){return new Fn({values:n,typeName:Ve.ZodEnum,...Xe(r)})}class Fn extends We{_parse(r){if(typeof r.data!="string"){const o=this._getOrReturnCtx(r),l=this._def.values;return ze(o,{expected:tt.joinValues(l),received:o.parsedType,code:ye.invalid_type}),Ze}if(this._cache||(this._cache=new Set(this._def.values)),!this._cache.has(r.data)){const o=this._getOrReturnCtx(r),l=this._def.values;return ze(o,{received:o.data,code:ye.invalid_enum_value,options:l}),Ze}return Ca(r.data)}get options(){return this._def.values}get enum(){const r={};for(const o of this._def.values)r[o]=o;return r}get Values(){const r={};for(const o of this._def.values)r[o]=o;return r}get Enum(){const r={};for(const o of this._def.values)r[o]=o;return r}extract(r,o=this._def){return Fn.create(r,{...this._def,...o})}exclude(r,o=this._def){return Fn.create(this.options.filter(l=>!r.includes(l)),{...this._def,...o})}}Fn.create=f0;class Gg extends We{_parse(r){const o=tt.getValidEnumValues(this._def.values),l=this._getOrReturnCtx(r);if(l.parsedType!==Ne.string&&l.parsedType!==Ne.number){const s=tt.objectValues(o);return ze(l,{expected:tt.joinValues(s),received:l.parsedType,code:ye.invalid_type}),Ze}if(this._cache||(this._cache=new Set(tt.getValidEnumValues(this._def.values))),!this._cache.has(r.data)){const s=tt.objectValues(o);return ze(l,{received:l.data,code:ye.invalid_enum_value,options:s}),Ze}return Ca(r.data)}get enum(){return this._def.values}}Gg.create=(n,r)=>new Gg({values:n,typeName:Ve.ZodNativeEnum,...Xe(r)});class ps extends We{unwrap(){return this._def.type}_parse(r){const{ctx:o}=this._processInputParams(r);if(o.parsedType!==Ne.promise&&o.common.async===!1)return ze(o,{code:ye.invalid_type,expected:Ne.promise,received:o.parsedType}),Ze;const l=o.parsedType===Ne.promise?o.data:Promise.resolve(o.data);return Ca(l.then(s=>this._def.type.parseAsync(s,{path:o.path,errorMap:o.common.contextualErrorMap})))}}ps.create=(n,r)=>new ps({type:n,typeName:Ve.ZodPromise,...Xe(r)});class xi extends We{innerType(){return this._def.schema}sourceType(){return this._def.schema._def.typeName===Ve.ZodEffects?this._def.schema.sourceType():this._def.schema}_parse(r){const{status:o,ctx:l}=this._processInputParams(r),s=this._def.effect||null,c={addIssue:f=>{ze(l,f),f.fatal?o.abort():o.dirty()},get path(){return l.path}};if(c.addIssue=c.addIssue.bind(c),s.type==="preprocess"){const f=s.transform(l.data,c);if(l.common.async)return Promise.resolve(f).then(async h=>{if(o.value==="aborted")return Ze;const p=await this._def.schema._parseAsync({data:h,path:l.path,parent:l});return p.status==="aborted"?Ze:p.status==="dirty"||o.value==="dirty"?ko(p.value):p});{if(o.value==="aborted")return Ze;const h=this._def.schema._parseSync({data:f,path:l.path,parent:l});return h.status==="aborted"?Ze:h.status==="dirty"||o.value==="dirty"?ko(h.value):h}}if(s.type==="refinement"){const f=h=>{const p=s.refinement(h,c);if(l.common.async)return Promise.resolve(p);if(p instanceof Promise)throw new Error("Async refinement encountered during synchronous parse operation. Use .parseAsync instead.");return h};if(l.common.async===!1){const h=this._def.schema._parseSync({data:l.data,path:l.path,parent:l});return h.status==="aborted"?Ze:(h.status==="dirty"&&o.dirty(),f(h.value),{status:o.value,value:h.value})}else return this._def.schema._parseAsync({data:l.data,path:l.path,parent:l}).then(h=>h.status==="aborted"?Ze:(h.status==="dirty"&&o.dirty(),f(h.value).then(()=>({status:o.value,value:h.value}))))}if(s.type==="transform")if(l.common.async===!1){const f=this._def.schema._parseSync({data:l.data,path:l.path,parent:l});if(!bi(f))return Ze;const h=s.transform(f.value,c);if(h instanceof Promise)throw new Error("Asynchronous transform encountered during synchronous parse operation. Use .parseAsync instead.");return{status:o.value,value:h}}else return this._def.schema._parseAsync({data:l.data,path:l.path,parent:l}).then(f=>bi(f)?Promise.resolve(s.transform(f.value,c)).then(h=>({status:o.value,value:h})):Ze);tt.assertNever(s)}}xi.create=(n,r,o)=>new xi({schema:n,typeName:Ve.ZodEffects,effect:r,...Xe(o)});xi.createWithPreprocess=(n,r,o)=>new xi({schema:r,effect:{type:"preprocess",transform:n},typeName:Ve.ZodEffects,...Xe(o)});class Va extends We{_parse(r){return this._getType(r)===Ne.undefined?Ca(void 0):this._def.innerType._parse(r)}unwrap(){return this._def.innerType}}Va.create=(n,r)=>new Va({innerType:n,typeName:Ve.ZodOptional,...Xe(r)});class wi extends We{_parse(r){return this._getType(r)===Ne.null?Ca(null):this._def.innerType._parse(r)}unwrap(){return this._def.innerType}}wi.create=(n,r)=>new wi({innerType:n,typeName:Ve.ZodNullable,...Xe(r)});class Ao extends We{_parse(r){const{ctx:o}=this._processInputParams(r);let l=o.data;return o.parsedType===Ne.undefined&&(l=this._def.defaultValue()),this._def.innerType._parse({data:l,path:o.path,parent:o})}removeDefault(){return this._def.innerType}}Ao.create=(n,r)=>new Ao({innerType:n,typeName:Ve.ZodDefault,defaultValue:typeof r.default=="function"?r.default:()=>r.default,...Xe(r)});class xd extends We{_parse(r){const{ctx:o}=this._processInputParams(r),l={...o,common:{...o.common,issues:[]}},s=this._def.innerType._parse({data:l.data,path:l.path,parent:{...l}});return cs(s)?s.then(c=>({status:"valid",value:c.status==="valid"?c.value:this._def.catchValue({get error(){return new fn(l.common.issues)},input:l.data})})):{status:"valid",value:s.status==="valid"?s.value:this._def.catchValue({get error(){return new fn(l.common.issues)},input:l.data})}}removeCatch(){return this._def.innerType}}xd.create=(n,r)=>new xd({innerType:n,typeName:Ve.ZodCatch,catchValue:typeof r.catch=="function"?r.catch:()=>r.catch,...Xe(r)});class Yg extends We{_parse(r){if(this._getType(r)!==Ne.nan){const l=this._getOrReturnCtx(r);return ze(l,{code:ye.invalid_type,expected:Ne.nan,received:l.parsedType}),Ze}return{status:"valid",value:r.data}}}Yg.create=n=>new Yg({typeName:Ve.ZodNaN,...Xe(n)});class u_ extends We{_parse(r){const{ctx:o}=this._processInputParams(r),l=o.data;return this._def.type._parse({data:l,path:o.path,parent:o})}unwrap(){return this._def.type}}class Xd extends We{_parse(r){const{status:o,ctx:l}=this._processInputParams(r);if(l.common.async)return(async()=>{const c=await this._def.in._parseAsync({data:l.data,path:l.path,parent:l});return c.status==="aborted"?Ze:c.status==="dirty"?(o.dirty(),ko(c.value)):this._def.out._parseAsync({data:c.value,path:l.path,parent:l})})();{const s=this._def.in._parseSync({data:l.data,path:l.path,parent:l});return s.status==="aborted"?Ze:s.status==="dirty"?(o.dirty(),{status:"dirty",value:s.value}):this._def.out._parseSync({data:s.value,path:l.path,parent:l})}}static create(r,o){return new Xd({in:r,out:o,typeName:Ve.ZodPipeline})}}class wd extends We{_parse(r){const o=this._def.innerType._parse(r),l=s=>(bi(s)&&(s.value=Object.freeze(s.value)),s);return cs(o)?o.then(s=>l(s)):l(o)}unwrap(){return this._def.innerType}}wd.create=(n,r)=>new wd({innerType:n,typeName:Ve.ZodReadonly,...Xe(r)});var Ve;(function(n){n.ZodString="ZodString",n.ZodNumber="ZodNumber",n.ZodNaN="ZodNaN",n.ZodBigInt="ZodBigInt",n.ZodBoolean="ZodBoolean",n.ZodDate="ZodDate",n.ZodSymbol="ZodSymbol",n.ZodUndefined="ZodUndefined",n.ZodNull="ZodNull",n.ZodAny="ZodAny",n.ZodUnknown="ZodUnknown",n.ZodNever="ZodNever",n.ZodVoid="ZodVoid",n.ZodArray="ZodArray",n.ZodObject="ZodObject",n.ZodUnion="ZodUnion",n.ZodDiscriminatedUnion="ZodDiscriminatedUnion",n.ZodIntersection="ZodIntersection",n.ZodTuple="ZodTuple",n.ZodRecord="ZodRecord",n.ZodMap="ZodMap",n.ZodSet="ZodSet",n.ZodFunction="ZodFunction",n.ZodLazy="ZodLazy",n.ZodLiteral="ZodLiteral",n.ZodEnum="ZodEnum",n.ZodEffects="ZodEffects",n.ZodNativeEnum="ZodNativeEnum",n.ZodOptional="ZodOptional",n.ZodNullable="ZodNullable",n.ZodDefault="ZodDefault",n.ZodCatch="ZodCatch",n.ZodPromise="ZodPromise",n.ZodBranded="ZodBranded",n.ZodPipeline="ZodPipeline",n.ZodReadonly="ZodReadonly"})(Ve||(Ve={}));const we=dn.create,ks=us.create;Qn.create;const Bt=za.create,rt=yt.create;fs.create;hs.create;xr.create;const Ea=Fn.create;ps.create;Va.create;wi.create;rt({paddingTop:Ea(["none","sm","md","lg","xl","2xl"]).default("md").describe("ui:select"),paddingBottom:Ea(["none","sm","md","lg","xl","2xl"]).default("md").describe("ui:select"),theme:Ea(["dark","light","accent"]).default("dark").describe("ui:select"),container:Ea(["boxed","fluid"]).default("boxed").describe("ui:select")});const h0=rt({label:we().describe("ui:text"),href:we().describe("ui:text"),variant:Ea(["primary","secondary"]).default("primary").describe("ui:select")}),d_=rt({val:we().describe("ui:text"),label:we().describe("ui:text")}),f_=rt({anchorId:we().optional().describe("ui:text"),badge:we().optional().describe("ui:text"),title:we().describe("ui:text"),titleHighlight:we().optional().describe("ui:text"),description:we().optional().describe("ui:textarea"),ctas:Bt(h0).optional().describe("ui:list"),metrics:Bt(d_).optional().describe("ui:list")}),h_=rt({icon:we().optional().describe("ui:icon-picker"),emoji:we().optional().describe("ui:text"),title:we().describe("ui:text"),description:we().describe("ui:textarea")}),p_=rt({anchorId:we().optional().describe("ui:text"),sectionTitle:we().describe("ui:text"),cards:Bt(h_).describe("ui:list")}),m_=rt({content:we().describe("ui:text"),isComment:ks().default(!1).describe("ui:checkbox")}),g_=rt({anchorId:we().optional().describe("ui:text"),label:we().optional().describe("ui:text"),lines:Bt(m_).describe("ui:list")}),v_=rt({label:we().describe("ui:text"),variant:Ea(["red","amber","green","blue"]).describe("ui:select")}),b_=rt({blocks:Bt(v_).describe("ui:list"),label:we().describe("ui:text")}),y_=rt({text:we().describe("ui:textarea"),isBold:ks().default(!1).describe("ui:checkbox")}),x_=rt({anchorId:we().optional().describe("ui:text"),siloGroups:Bt(b_).describe("ui:list"),title:we().describe("ui:text"),paragraphs:Bt(y_).describe("ui:list"),highlight:we().optional().describe("ui:text")}),w_=rt({icon:we().describe("ui:text"),iconVariant:Ea(["split","registry","federation"]).describe("ui:select"),title:we().describe("ui:text"),description:we().describe("ui:textarea"),tag:we().describe("ui:text"),tagVariant:Ea(["core","pattern","enterprise"]).describe("ui:select")}),__=rt({anchorId:we().optional().describe("ui:text"),label:we().optional().describe("ui:text"),title:we().describe("ui:text"),description:we().optional().describe("ui:textarea"),pillars:Bt(w_).describe("ui:list")}),S_=rt({number:we().describe("ui:text"),layerLevel:Ea(["l0","l1","l2"]).describe("ui:select"),title:we().describe("ui:text"),description:we().describe("ui:textarea")}),k_=rt({content:we().describe("ui:text"),tokenType:Ea(["plain","keyword","type","string","comment","operator"]).default("plain").describe("ui:select")}),E_=rt({anchorId:we().optional().describe("ui:text"),label:we().optional().describe("ui:text"),title:we().describe("ui:text"),description:we().optional().describe("ui:textarea"),layers:Bt(S_).describe("ui:list"),codeFilename:we().optional().describe("ui:text"),codeLines:Bt(k_).optional().describe("ui:list")}),z_=rt({text:we().describe("ui:text")}),C_=rt({tier:we().describe("ui:text"),name:we().describe("ui:text"),price:we().describe("ui:text"),priceSuffix:we().optional().describe("ui:text"),delivery:we().describe("ui:text"),features:Bt(z_).describe("ui:list"),featured:ks().default(!1).describe("ui:checkbox"),ctaLabel:we().optional().describe("ui:text"),ctaHref:we().optional().describe("ui:text"),ctaVariant:Ea(["primary","secondary"]).default("secondary").describe("ui:select")}),A_=rt({anchorId:we().optional().describe("ui:text"),label:we().optional().describe("ui:text"),title:we().describe("ui:text"),description:we().optional().describe("ui:textarea"),products:Bt(C_).describe("ui:list")}),T_=rt({label:we().describe("ui:text")}),N_=rt({label:we().describe("ui:text"),variant:Ea(["tailwind","bootstrap"]).describe("ui:select")}),O_=rt({anchorId:we().optional().describe("ui:text"),label:we().optional().describe("ui:text"),title:we().describe("ui:text"),subtitle:we().describe("ui:text"),paragraphs:Bt(rt({text:we().describe("ui:textarea")})).describe("ui:list"),badges:Bt(T_).optional().describe("ui:list"),engines:Bt(N_).optional().describe("ui:list"),codeSnippet:we().optional().describe("ui:textarea")}),j_=rt({anchorId:we().optional().describe("ui:text"),label:we().optional().describe("ui:text"),title:we().describe("ui:text"),quote:we().describe("ui:textarea"),quoteHighlightWord:we().optional().describe("ui:text"),description:we().optional().describe("ui:textarea")}),R_=rt({anchorId:we().optional().describe("ui:text"),label:we().optional().describe("ui:text"),title:we().describe("ui:text"),description:we().optional().describe("ui:textarea"),ctas:Bt(h0).optional().describe("ui:list")}),M_={hero:f_,"feature-grid":p_,"code-block":g_,"problem-statement":x_,"pillars-grid":__,"arch-layers":E_,"product-triad":A_,"pa-section":O_,philosophy:j_,"cta-banner":R_,header:rt({logoText:we().describe("ui:text"),logoHighlight:we().optional().describe("ui:text"),logoIconText:we().optional().describe("ui:text"),links:Bt(rt({label:we().describe("ui:text"),href:we().describe("ui:text"),isCta:ks().default(!1).describe("ui:checkbox")})).describe("ui:list")}),footer:rt({brandText:we().describe("ui:text"),brandHighlight:we().optional().describe("ui:text"),copyright:we().describe("ui:text"),links:Bt(rt({label:we().describe("ui:text"),href:we().describe("ui:text")})).optional().describe("ui:list")})};function D_({className:n,type:r,...o}){return _.jsx("input",{type:r,"data-slot":"input",className:nt("dark:bg-input/30 border-input focus-visible:border-ring focus-visible:ring-ring/50 aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive dark:aria-invalid:border-destructive/50 disabled:bg-input/50 dark:disabled:bg-input/80 h-8 rounded-lg border bg-transparent px-2.5 py-1 text-base transition-colors file:h-6 file:text-sm file:font-medium focus-visible:ring-3 aria-invalid:ring-3 md:text-sm file:text-foreground placeholder:text-muted-foreground w-full min-w-0 outline-none file:inline-flex file:border-0 file:bg-transparent disabled:pointer-events-none disabled:cursor-not-allowed disabled:opacity-50",n),...o})}function B_({className:n,...r}){return _.jsx("textarea",{"data-slot":"textarea",className:nt("border-input dark:bg-input/30 focus-visible:border-ring focus-visible:ring-ring/50 aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive dark:aria-invalid:border-destructive/50 disabled:bg-input/50 dark:disabled:bg-input/80 rounded-lg border bg-transparent px-2.5 py-2 text-base transition-colors focus-visible:ring-3 aria-invalid:ring-3 md:text-sm placeholder:text-muted-foreground flex field-sizing-content min-h-16 w-full outline-none disabled:cursor-not-allowed disabled:opacity-50",n),...r})}function Ig(n,r){if(typeof n=="function")return n(r);n!=null&&(n.current=r)}function p0(...n){return r=>{let o=!1;const l=n.map(s=>{const c=Ig(s,r);return!o&&typeof c=="function"&&(o=!0),c});if(o)return()=>{for(let s=0;s<l.length;s++){const c=l[s];typeof c=="function"?c():Ig(n[s],null)}}}}function Tt(...n){return j.useCallback(p0(...n),n)}function ms(n){const r=U_(n),o=j.forwardRef((l,s)=>{const{children:c,...f}=l,h=j.Children.toArray(c),p=h.find(H_);if(p){const m=p.props.children,v=h.map(b=>b===p?j.Children.count(m)>1?j.Children.only(null):j.isValidElement(m)?m.props.children:null:b);return _.jsx(r,{...f,ref:s,children:j.isValidElement(m)?j.cloneElement(m,void 0,v):null})}return _.jsx(r,{...f,ref:s,children:c})});return o.displayName=`${n}.Slot`,o}function U_(n){const r=j.forwardRef((o,l)=>{const{children:s,...c}=o;if(j.isValidElement(s)){const f=V_(s),h=Z_(c,s.props);return s.type!==j.Fragment&&(h.ref=l?p0(l,f):f),j.cloneElement(s,h)}return j.Children.count(s)>1?j.Children.only(null):null});return r.displayName=`${n}.SlotClone`,r}var L_=Symbol("radix.slottable");function H_(n){return j.isValidElement(n)&&typeof n.type=="function"&&"__radixId"in n.type&&n.type.__radixId===L_}function Z_(n,r){const o={...r};for(const l in r){const s=n[l],c=r[l];/^on[A-Z]/.test(l)?s&&c?o[l]=(...h)=>{const p=c(...h);return s(...h),p}:s&&(o[l]=s):l==="style"?o[l]={...s,...c}:l==="className"&&(o[l]=[s,c].filter(Boolean).join(" "))}return{...n,...o}}function V_(n){var l,s;let r=(l=Object.getOwnPropertyDescriptor(n.props,"ref"))==null?void 0:l.get,o=r&&"isReactWarning"in r&&r.isReactWarning;return o?n.ref:(r=(s=Object.getOwnPropertyDescriptor(n,"ref"))==null?void 0:s.get,o=r&&"isReactWarning"in r&&r.isReactWarning,o?n.props.ref:n.props.ref||n.ref)}var q_=["a","button","div","form","h2","h3","img","input","label","li","nav","ol","p","select","span","svg","ul"],gt=q_.reduce((n,r)=>{const o=ms(`Primitive.${r}`),l=j.forwardRef((s,c)=>{const{asChild:f,...h}=s,p=f?o:r;return typeof window<"u"&&(window[Symbol.for("radix-ui")]=!0),_.jsx(p,{...h,ref:c})});return l.displayName=`Primitive.${r}`,{...n,[r]:l}},{});function G_(n,r){n&&No.flushSync(()=>n.dispatchEvent(r))}var m0=Object.freeze({position:"absolute",border:0,width:1,height:1,padding:0,margin:-1,overflow:"hidden",clip:"rect(0, 0, 0, 0)",whiteSpace:"nowrap",wordWrap:"normal"}),Y_="VisuallyHidden",I_=j.forwardRef((n,r)=>_.jsx(gt.span,{...n,ref:r,style:{...m0,...n.style}}));I_.displayName=Y_;function Es(n,r=[]){let o=[];function l(c,f){const h=j.createContext(f),p=o.length;o=[...o,f];const m=b=>{var k;const{scope:E,children:x,...z}=b,g=((k=E==null?void 0:E[n])==null?void 0:k[p])||h,w=j.useMemo(()=>z,Object.values(z));return _.jsx(g.Provider,{value:w,children:x})};m.displayName=c+"Provider";function v(b,E){var g;const x=((g=E==null?void 0:E[n])==null?void 0:g[p])||h,z=j.useContext(x);if(z)return z;if(f!==void 0)return f;throw new Error(`\`${b}\` must be used within \`${c}\``)}return[m,v]}const s=()=>{const c=o.map(f=>j.createContext(f));return function(h){const p=(h==null?void 0:h[n])||c;return j.useMemo(()=>({[`__scope${n}`]:{...h,[n]:p}}),[h,p])}};return s.scopeName=n,[l,X_(s,...r)]}function X_(...n){const r=n[0];if(n.length===1)return r;const o=()=>{const l=n.map(s=>({useScope:s(),scopeName:s.scopeName}));return function(c){const f=l.reduce((h,{useScope:p,scopeName:m})=>{const b=p(c)[`__scope${m}`];return{...h,...b}},{});return j.useMemo(()=>({[`__scope${r.scopeName}`]:f}),[f])}};return o.scopeName=r.scopeName,o}function Q_(n){const r=n+"CollectionProvider",[o,l]=Es(r),[s,c]=o(r,{collectionRef:{current:null},itemMap:new Map}),f=g=>{const{scope:w,children:k}=g,A=Sa.useRef(null),N=Sa.useRef(new Map).current;return _.jsx(s,{scope:w,itemMap:N,collectionRef:A,children:k})};f.displayName=r;const h=n+"CollectionSlot",p=ms(h),m=Sa.forwardRef((g,w)=>{const{scope:k,children:A}=g,N=c(h,k),R=Tt(w,N.collectionRef);return _.jsx(p,{ref:R,children:A})});m.displayName=h;const v=n+"CollectionItemSlot",b="data-radix-collection-item",E=ms(v),x=Sa.forwardRef((g,w)=>{const{scope:k,children:A,...N}=g,R=Sa.useRef(null),U=Tt(w,R),Y=c(v,k);return Sa.useEffect(()=>(Y.itemMap.set(R,{ref:R,...N}),()=>void Y.itemMap.delete(R))),_.jsx(E,{[b]:"",ref:U,children:A})});x.displayName=v;function z(g){const w=c(n+"CollectionConsumer",g);return Sa.useCallback(()=>{const A=w.collectionRef.current;if(!A)return[];const N=Array.from(A.querySelectorAll(`[${b}]`));return Array.from(w.itemMap.values()).sort((Y,H)=>N.indexOf(Y.ref.current)-N.indexOf(H.ref.current))},[w.collectionRef,w.itemMap])}return[{Provider:f,Slot:m,ItemSlot:x},z,l]}function _t(n,r,{checkForDefaultPrevented:o=!0}={}){return function(s){if(n==null||n(s),o===!1||!s.defaultPrevented)return r==null?void 0:r(s)}}var Gt=globalThis!=null&&globalThis.document?j.useLayoutEffect:()=>{},F_=Ld[" useInsertionEffect ".trim().toString()]||Gt;function _d({prop:n,defaultProp:r,onChange:o=()=>{},caller:l}){const[s,c,f]=K_({defaultProp:r,onChange:o}),h=n!==void 0,p=h?n:s;{const v=j.useRef(n!==void 0);j.useEffect(()=>{const b=v.current;b!==h&&console.warn(`${l} is changing from ${b?"controlled":"uncontrolled"} to ${h?"controlled":"uncontrolled"}. Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component.`),v.current=h},[h,l])}const m=j.useCallback(v=>{var b;if(h){const E=P_(v)?v(n):v;E!==n&&((b=f.current)==null||b.call(f,E))}else c(v)},[h,n,c,f]);return[p,m]}function K_({defaultProp:n,onChange:r}){const[o,l]=j.useState(n),s=j.useRef(o),c=j.useRef(r);return F_(()=>{c.current=r},[r]),j.useEffect(()=>{var f;s.current!==o&&((f=c.current)==null||f.call(c,o),s.current=o)},[o,s]),[o,l,c]}function P_(n){return typeof n=="function"}function J_(n,r){return j.useReducer((o,l)=>r[o][l]??o,n)}var g0=n=>{const{present:r,children:o}=n,l=W_(r),s=typeof o=="function"?o({present:l.isPresent}):j.Children.only(o),c=Tt(l.ref,$_(s));return typeof o=="function"||l.isPresent?j.cloneElement(s,{ref:c}):null};g0.displayName="Presence";function W_(n){const[r,o]=j.useState(),l=j.useRef(null),s=j.useRef(n),c=j.useRef("none"),f=n?"mounted":"unmounted",[h,p]=J_(f,{mounted:{UNMOUNT:"unmounted",ANIMATION_OUT:"unmountSuspended"},unmountSuspended:{MOUNT:"mounted",ANIMATION_END:"unmounted"},unmounted:{MOUNT:"mounted"}});return j.useEffect(()=>{const m=Kl(l.current);c.current=h==="mounted"?m:"none"},[h]),Gt(()=>{const m=l.current,v=s.current;if(v!==n){const E=c.current,x=Kl(m);n?p("MOUNT"):x==="none"||(m==null?void 0:m.display)==="none"?p("UNMOUNT"):p(v&&E!==x?"ANIMATION_OUT":"UNMOUNT"),s.current=n}},[n,p]),Gt(()=>{if(r){let m;const v=r.ownerDocument.defaultView??window,b=x=>{const g=Kl(l.current).includes(CSS.escape(x.animationName));if(x.target===r&&g&&(p("ANIMATION_END"),!s.current)){const w=r.style.animationFillMode;r.style.animationFillMode="forwards",m=v.setTimeout(()=>{r.style.animationFillMode==="forwards"&&(r.style.animationFillMode=w)})}},E=x=>{x.target===r&&(c.current=Kl(l.current))};return r.addEventListener("animationstart",E),r.addEventListener("animationcancel",b),r.addEventListener("animationend",b),()=>{v.clearTimeout(m),r.removeEventListener("animationstart",E),r.removeEventListener("animationcancel",b),r.removeEventListener("animationend",b)}}else p("ANIMATION_END")},[r,p]),{isPresent:["mounted","unmountSuspended"].includes(h),ref:j.useCallback(m=>{l.current=m?getComputedStyle(m):null,o(m)},[])}}function Kl(n){return(n==null?void 0:n.animationName)||"none"}function $_(n){var l,s;let r=(l=Object.getOwnPropertyDescriptor(n.props,"ref"))==null?void 0:l.get,o=r&&"isReactWarning"in r&&r.isReactWarning;return o?n.ref:(r=(s=Object.getOwnPropertyDescriptor(n,"ref"))==null?void 0:s.get,o=r&&"isReactWarning"in r&&r.isReactWarning,o?n.props.ref:n.props.ref||n.ref)}var e5=Ld[" useId ".trim().toString()]||(()=>{}),t5=0;function Qd(n){const[r,o]=j.useState(e5());return Gt(()=>{o(l=>l??String(t5++))},[n]),n||(r?`radix-${r}`:"")}var a5=j.createContext(void 0);function n5(n){const r=j.useContext(a5);return n||r||"ltr"}function wr(n){const r=j.useRef(n);return j.useEffect(()=>{r.current=n}),j.useMemo(()=>(...o)=>{var l;return(l=r.current)==null?void 0:l.call(r,...o)},[])}function r5(n,r=globalThis==null?void 0:globalThis.document){const o=wr(n);j.useEffect(()=>{const l=s=>{s.key==="Escape"&&o(s)};return r.addEventListener("keydown",l,{capture:!0}),()=>r.removeEventListener("keydown",l,{capture:!0})},[o,r])}var i5="DismissableLayer",Sd="dismissableLayer.update",o5="dismissableLayer.pointerDownOutside",l5="dismissableLayer.focusOutside",Xg,v0=j.createContext({layers:new Set,layersWithOutsidePointerEventsDisabled:new Set,branches:new Set}),b0=j.forwardRef((n,r)=>{const{disableOutsidePointerEvents:o=!1,onEscapeKeyDown:l,onPointerDownOutside:s,onFocusOutside:c,onInteractOutside:f,onDismiss:h,...p}=n,m=j.useContext(v0),[v,b]=j.useState(null),E=(v==null?void 0:v.ownerDocument)??(globalThis==null?void 0:globalThis.document),[,x]=j.useState({}),z=Tt(r,H=>b(H)),g=Array.from(m.layers),[w]=[...m.layersWithOutsidePointerEventsDisabled].slice(-1),k=g.indexOf(w),A=v?g.indexOf(v):-1,N=m.layersWithOutsidePointerEventsDisabled.size>0,R=A>=k,U=u5(H=>{const I=H.target,K=[...m.branches].some(se=>se.contains(I));!R||K||(s==null||s(H),f==null||f(H),H.defaultPrevented||h==null||h())},E),Y=d5(H=>{const I=H.target;[...m.branches].some(se=>se.contains(I))||(c==null||c(H),f==null||f(H),H.defaultPrevented||h==null||h())},E);return r5(H=>{A===m.layers.size-1&&(l==null||l(H),!H.defaultPrevented&&h&&(H.preventDefault(),h()))},E),j.useEffect(()=>{if(v)return o&&(m.layersWithOutsidePointerEventsDisabled.size===0&&(Xg=E.body.style.pointerEvents,E.body.style.pointerEvents="none"),m.layersWithOutsidePointerEventsDisabled.add(v)),m.layers.add(v),Qg(),()=>{o&&m.layersWithOutsidePointerEventsDisabled.size===1&&(E.body.style.pointerEvents=Xg)}},[v,E,o,m]),j.useEffect(()=>()=>{v&&(m.layers.delete(v),m.layersWithOutsidePointerEventsDisabled.delete(v),Qg())},[v,m]),j.useEffect(()=>{const H=()=>x({});return document.addEventListener(Sd,H),()=>document.removeEventListener(Sd,H)},[]),_.jsx(gt.div,{...p,ref:z,style:{pointerEvents:N?R?"auto":"none":void 0,...n.style},onFocusCapture:_t(n.onFocusCapture,Y.onFocusCapture),onBlurCapture:_t(n.onBlurCapture,Y.onBlurCapture),onPointerDownCapture:_t(n.onPointerDownCapture,U.onPointerDownCapture)})});b0.displayName=i5;var s5="DismissableLayerBranch",c5=j.forwardRef((n,r)=>{const o=j.useContext(v0),l=j.useRef(null),s=Tt(r,l);return j.useEffect(()=>{const c=l.current;if(c)return o.branches.add(c),()=>{o.branches.delete(c)}},[o.branches]),_.jsx(gt.div,{...n,ref:s})});c5.displayName=s5;function u5(n,r=globalThis==null?void 0:globalThis.document){const o=wr(n),l=j.useRef(!1),s=j.useRef(()=>{});return j.useEffect(()=>{const c=h=>{if(h.target&&!l.current){let p=function(){y0(o5,o,m,{discrete:!0})};const m={originalEvent:h};h.pointerType==="touch"?(r.removeEventListener("click",s.current),s.current=p,r.addEventListener("click",s.current,{once:!0})):p()}else r.removeEventListener("click",s.current);l.current=!1},f=window.setTimeout(()=>{r.addEventListener("pointerdown",c)},0);return()=>{window.clearTimeout(f),r.removeEventListener("pointerdown",c),r.removeEventListener("click",s.current)}},[r,o]),{onPointerDownCapture:()=>l.current=!0}}function d5(n,r=globalThis==null?void 0:globalThis.document){const o=wr(n),l=j.useRef(!1);return j.useEffect(()=>{const s=c=>{c.target&&!l.current&&y0(l5,o,{originalEvent:c},{discrete:!1})};return r.addEventListener("focusin",s),()=>r.removeEventListener("focusin",s)},[r,o]),{onFocusCapture:()=>l.current=!0,onBlurCapture:()=>l.current=!1}}function Qg(){const n=new CustomEvent(Sd);document.dispatchEvent(n)}function y0(n,r,o,{discrete:l}){const s=o.originalEvent.target,c=new CustomEvent(n,{bubbles:!1,cancelable:!0,detail:o});r&&s.addEventListener(n,r,{once:!0}),l?G_(s,c):s.dispatchEvent(c)}var id="focusScope.autoFocusOnMount",od="focusScope.autoFocusOnUnmount",Fg={bubbles:!1,cancelable:!0},f5="FocusScope",x0=j.forwardRef((n,r)=>{const{loop:o=!1,trapped:l=!1,onMountAutoFocus:s,onUnmountAutoFocus:c,...f}=n,[h,p]=j.useState(null),m=wr(s),v=wr(c),b=j.useRef(null),E=Tt(r,g=>p(g)),x=j.useRef({paused:!1,pause(){this.paused=!0},resume(){this.paused=!1}}).current;j.useEffect(()=>{if(l){let g=function(N){if(x.paused||!h)return;const R=N.target;h.contains(R)?b.current=R:Vn(b.current,{select:!0})},w=function(N){if(x.paused||!h)return;const R=N.relatedTarget;R!==null&&(h.contains(R)||Vn(b.current,{select:!0}))},k=function(N){if(document.activeElement===document.body)for(const U of N)U.removedNodes.length>0&&Vn(h)};document.addEventListener("focusin",g),document.addEventListener("focusout",w);const A=new MutationObserver(k);return h&&A.observe(h,{childList:!0,subtree:!0}),()=>{document.removeEventListener("focusin",g),document.removeEventListener("focusout",w),A.disconnect()}}},[l,h,x.paused]),j.useEffect(()=>{if(h){Pg.add(x);const g=document.activeElement;if(!h.contains(g)){const k=new CustomEvent(id,Fg);h.addEventListener(id,m),h.dispatchEvent(k),k.defaultPrevented||(h5(b5(w0(h)),{select:!0}),document.activeElement===g&&Vn(h))}return()=>{h.removeEventListener(id,m),setTimeout(()=>{const k=new CustomEvent(od,Fg);h.addEventListener(od,v),h.dispatchEvent(k),k.defaultPrevented||Vn(g??document.body,{select:!0}),h.removeEventListener(od,v),Pg.remove(x)},0)}}},[h,m,v,x]);const z=j.useCallback(g=>{if(!o&&!l||x.paused)return;const w=g.key==="Tab"&&!g.altKey&&!g.ctrlKey&&!g.metaKey,k=document.activeElement;if(w&&k){const A=g.currentTarget,[N,R]=p5(A);N&&R?!g.shiftKey&&k===R?(g.preventDefault(),o&&Vn(N,{select:!0})):g.shiftKey&&k===N&&(g.preventDefault(),o&&Vn(R,{select:!0})):k===A&&g.preventDefault()}},[o,l,x.paused]);return _.jsx(gt.div,{tabIndex:-1,...f,ref:E,onKeyDown:z})});x0.displayName=f5;function h5(n,{select:r=!1}={}){const o=document.activeElement;for(const l of n)if(Vn(l,{select:r}),document.activeElement!==o)return}function p5(n){const r=w0(n),o=Kg(r,n),l=Kg(r.reverse(),n);return[o,l]}function w0(n){const r=[],o=document.createTreeWalker(n,NodeFilter.SHOW_ELEMENT,{acceptNode:l=>{const s=l.tagName==="INPUT"&&l.type==="hidden";return l.disabled||l.hidden||s?NodeFilter.FILTER_SKIP:l.tabIndex>=0?NodeFilter.FILTER_ACCEPT:NodeFilter.FILTER_SKIP}});for(;o.nextNode();)r.push(o.currentNode);return r}function Kg(n,r){for(const o of n)if(!m5(o,{upTo:r}))return o}function m5(n,{upTo:r}){if(getComputedStyle(n).visibility==="hidden")return!0;for(;n;){if(r!==void 0&&n===r)return!1;if(getComputedStyle(n).display==="none")return!0;n=n.parentElement}return!1}function g5(n){return n instanceof HTMLInputElement&&"select"in n}function Vn(n,{select:r=!1}={}){if(n&&n.focus){const o=document.activeElement;n.focus({preventScroll:!0}),n!==o&&g5(n)&&r&&n.select()}}var Pg=v5();function v5(){let n=[];return{add(r){const o=n[0];r!==o&&(o==null||o.pause()),n=Jg(n,r),n.unshift(r)},remove(r){var o;n=Jg(n,r),(o=n[0])==null||o.resume()}}}function Jg(n,r){const o=[...n],l=o.indexOf(r);return l!==-1&&o.splice(l,1),o}function b5(n){return n.filter(r=>r.tagName!=="A")}var y5="Portal",_0=j.forwardRef((n,r)=>{var h;const{container:o,...l}=n,[s,c]=j.useState(!1);Gt(()=>c(!0),[]);const f=o||s&&((h=globalThis==null?void 0:globalThis.document)==null?void 0:h.body);return f?fw.createPortal(_.jsx(gt.div,{...l,ref:r}),f):null});_0.displayName=y5;var ld=0;function x5(){j.useEffect(()=>{const n=document.querySelectorAll("[data-radix-focus-guard]");return document.body.insertAdjacentElement("afterbegin",n[0]??Wg()),document.body.insertAdjacentElement("beforeend",n[1]??Wg()),ld++,()=>{ld===1&&document.querySelectorAll("[data-radix-focus-guard]").forEach(r=>r.remove()),ld--}},[])}function Wg(){const n=document.createElement("span");return n.setAttribute("data-radix-focus-guard",""),n.tabIndex=0,n.style.outline="none",n.style.opacity="0",n.style.position="fixed",n.style.pointerEvents="none",n}var Ha=function(){return Ha=Object.assign||function(r){for(var o,l=1,s=arguments.length;l<s;l++){o=arguments[l];for(var c in o)Object.prototype.hasOwnProperty.call(o,c)&&(r[c]=o[c])}return r},Ha.apply(this,arguments)};function S0(n,r){var o={};for(var l in n)Object.prototype.hasOwnProperty.call(n,l)&&r.indexOf(l)<0&&(o[l]=n[l]);if(n!=null&&typeof Object.getOwnPropertySymbols=="function")for(var s=0,l=Object.getOwnPropertySymbols(n);s<l.length;s++)r.indexOf(l[s])<0&&Object.prototype.propertyIsEnumerable.call(n,l[s])&&(o[l[s]]=n[l[s]]);return o}function w5(n,r,o){if(o||arguments.length===2)for(var l=0,s=r.length,c;l<s;l++)(c||!(l in r))&&(c||(c=Array.prototype.slice.call(r,0,l)),c[l]=r[l]);return n.concat(c||Array.prototype.slice.call(r))}var as="right-scroll-bar-position",ns="width-before-scroll-bar",_5="with-scroll-bars-hidden",S5="--removed-body-scroll-bar-size";function sd(n,r){return typeof n=="function"?n(r):n&&(n.current=r),n}function k5(n,r){var o=j.useState(function(){return{value:n,callback:r,facade:{get current(){return o.value},set current(l){var s=o.value;s!==l&&(o.value=l,o.callback(l,s))}}}})[0];return o.callback=r,o.facade}var E5=typeof window<"u"?j.useLayoutEffect:j.useEffect,$g=new WeakMap;function z5(n,r){var o=k5(null,function(l){return n.forEach(function(s){return sd(s,l)})});return E5(function(){var l=$g.get(o);if(l){var s=new Set(l),c=new Set(n),f=o.current;s.forEach(function(h){c.has(h)||sd(h,null)}),c.forEach(function(h){s.has(h)||sd(h,f)})}$g.set(o,n)},[n]),o}function C5(n){return n}function A5(n,r){r===void 0&&(r=C5);var o=[],l=!1,s={read:function(){if(l)throw new Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");return o.length?o[o.length-1]:n},useMedium:function(c){var f=r(c,l);return o.push(f),function(){o=o.filter(function(h){return h!==f})}},assignSyncMedium:function(c){for(l=!0;o.length;){var f=o;o=[],f.forEach(c)}o={push:function(h){return c(h)},filter:function(){return o}}},assignMedium:function(c){l=!0;var f=[];if(o.length){var h=o;o=[],h.forEach(c),f=o}var p=function(){var v=f;f=[],v.forEach(c)},m=function(){return Promise.resolve().then(p)};m(),o={push:function(v){f.push(v),m()},filter:function(v){return f=f.filter(v),o}}}};return s}function T5(n){n===void 0&&(n={});var r=A5(null);return r.options=Ha({async:!0,ssr:!1},n),r}var k0=function(n){var r=n.sideCar,o=S0(n,["sideCar"]);if(!r)throw new Error("Sidecar: please provide `sideCar` property to import the right car");var l=r.read();if(!l)throw new Error("Sidecar medium not found");return j.createElement(l,Ha({},o))};k0.isSideCarExport=!0;function N5(n,r){return n.useMedium(r),k0}var E0=T5(),cd=function(){},zs=j.forwardRef(function(n,r){var o=j.useRef(null),l=j.useState({onScrollCapture:cd,onWheelCapture:cd,onTouchMoveCapture:cd}),s=l[0],c=l[1],f=n.forwardProps,h=n.children,p=n.className,m=n.removeScrollBar,v=n.enabled,b=n.shards,E=n.sideCar,x=n.noRelative,z=n.noIsolation,g=n.inert,w=n.allowPinchZoom,k=n.as,A=k===void 0?"div":k,N=n.gapMode,R=S0(n,["forwardProps","children","className","removeScrollBar","enabled","shards","sideCar","noRelative","noIsolation","inert","allowPinchZoom","as","gapMode"]),U=E,Y=z5([o,r]),H=Ha(Ha({},R),s);return j.createElement(j.Fragment,null,v&&j.createElement(U,{sideCar:E0,removeScrollBar:m,shards:b,noRelative:x,noIsolation:z,inert:g,setCallbacks:c,allowPinchZoom:!!w,lockRef:o,gapMode:N}),f?j.cloneElement(j.Children.only(h),Ha(Ha({},H),{ref:Y})):j.createElement(A,Ha({},H,{className:p,ref:Y}),h))});zs.defaultProps={enabled:!0,removeScrollBar:!0,inert:!1};zs.classNames={fullWidth:ns,zeroRight:as};var O5=function(){if(typeof __webpack_nonce__<"u")return __webpack_nonce__};function j5(){if(!document)return null;var n=document.createElement("style");n.type="text/css";var r=O5();return r&&n.setAttribute("nonce",r),n}function R5(n,r){n.styleSheet?n.styleSheet.cssText=r:n.appendChild(document.createTextNode(r))}function M5(n){var r=document.head||document.getElementsByTagName("head")[0];r.appendChild(n)}var D5=function(){var n=0,r=null;return{add:function(o){n==0&&(r=j5())&&(R5(r,o),M5(r)),n++},remove:function(){n--,!n&&r&&(r.parentNode&&r.parentNode.removeChild(r),r=null)}}},B5=function(){var n=D5();return function(r,o){j.useEffect(function(){return n.add(r),function(){n.remove()}},[r&&o])}},z0=function(){var n=B5(),r=function(o){var l=o.styles,s=o.dynamic;return n(l,s),null};return r},U5={left:0,top:0,right:0,gap:0},ud=function(n){return parseInt(n||"",10)||0},L5=function(n){var r=window.getComputedStyle(document.body),o=r[n==="padding"?"paddingLeft":"marginLeft"],l=r[n==="padding"?"paddingTop":"marginTop"],s=r[n==="padding"?"paddingRight":"marginRight"];return[ud(o),ud(l),ud(s)]},H5=function(n){if(n===void 0&&(n="margin"),typeof window>"u")return U5;var r=L5(n),o=document.documentElement.clientWidth,l=window.innerWidth;return{left:r[0],top:r[1],right:r[2],gap:Math.max(0,l-o+r[2]-r[0])}},Z5=z0(),gi="data-scroll-locked",V5=function(n,r,o,l){var s=n.left,c=n.top,f=n.right,h=n.gap;return o===void 0&&(o="margin"),`
  .`.concat(_5,` {
   overflow: hidden `).concat(l,`;
   padding-right: `).concat(h,"px ").concat(l,`;
  }
  body[`).concat(gi,`] {
    overflow: hidden `).concat(l,`;
    overscroll-behavior: contain;
    `).concat([r&&"position: relative ".concat(l,";"),o==="margin"&&`
    padding-left: `.concat(s,`px;
    padding-top: `).concat(c,`px;
    padding-right: `).concat(f,`px;
    margin-left:0;
    margin-top:0;
    margin-right: `).concat(h,"px ").concat(l,`;
    `),o==="padding"&&"padding-right: ".concat(h,"px ").concat(l,";")].filter(Boolean).join(""),`
  }
  
  .`).concat(as,` {
    right: `).concat(h,"px ").concat(l,`;
  }
  
  .`).concat(ns,` {
    margin-right: `).concat(h,"px ").concat(l,`;
  }
  
  .`).concat(as," .").concat(as,` {
    right: 0 `).concat(l,`;
  }
  
  .`).concat(ns," .").concat(ns,` {
    margin-right: 0 `).concat(l,`;
  }
  
  body[`).concat(gi,`] {
    `).concat(S5,": ").concat(h,`px;
  }
`)},ev=function(){var n=parseInt(document.body.getAttribute(gi)||"0",10);return isFinite(n)?n:0},q5=function(){j.useEffect(function(){return document.body.setAttribute(gi,(ev()+1).toString()),function(){var n=ev()-1;n<=0?document.body.removeAttribute(gi):document.body.setAttribute(gi,n.toString())}},[])},G5=function(n){var r=n.noRelative,o=n.noImportant,l=n.gapMode,s=l===void 0?"margin":l;q5();var c=j.useMemo(function(){return H5(s)},[s]);return j.createElement(Z5,{styles:V5(c,!r,s,o?"":"!important")})},kd=!1;if(typeof window<"u")try{var Pl=Object.defineProperty({},"passive",{get:function(){return kd=!0,!0}});window.addEventListener("test",Pl,Pl),window.removeEventListener("test",Pl,Pl)}catch{kd=!1}var di=kd?{passive:!1}:!1,Y5=function(n){return n.tagName==="TEXTAREA"},C0=function(n,r){if(!(n instanceof Element))return!1;var o=window.getComputedStyle(n);return o[r]!=="hidden"&&!(o.overflowY===o.overflowX&&!Y5(n)&&o[r]==="visible")},I5=function(n){return C0(n,"overflowY")},X5=function(n){return C0(n,"overflowX")},tv=function(n,r){var o=r.ownerDocument,l=r;do{typeof ShadowRoot<"u"&&l instanceof ShadowRoot&&(l=l.host);var s=A0(n,l);if(s){var c=T0(n,l),f=c[1],h=c[2];if(f>h)return!0}l=l.parentNode}while(l&&l!==o.body);return!1},Q5=function(n){var r=n.scrollTop,o=n.scrollHeight,l=n.clientHeight;return[r,o,l]},F5=function(n){var r=n.scrollLeft,o=n.scrollWidth,l=n.clientWidth;return[r,o,l]},A0=function(n,r){return n==="v"?I5(r):X5(r)},T0=function(n,r){return n==="v"?Q5(r):F5(r)},K5=function(n,r){return n==="h"&&r==="rtl"?-1:1},P5=function(n,r,o,l,s){var c=K5(n,window.getComputedStyle(r).direction),f=c*l,h=o.target,p=r.contains(h),m=!1,v=f>0,b=0,E=0;do{if(!h)break;var x=T0(n,h),z=x[0],g=x[1],w=x[2],k=g-w-c*z;(z||k)&&A0(n,h)&&(b+=k,E+=z);var A=h.parentNode;h=A&&A.nodeType===Node.DOCUMENT_FRAGMENT_NODE?A.host:A}while(!p&&h!==document.body||p&&(r.contains(h)||r===h));return(v&&Math.abs(b)<1||!v&&Math.abs(E)<1)&&(m=!0),m},Jl=function(n){return"changedTouches"in n?[n.changedTouches[0].clientX,n.changedTouches[0].clientY]:[0,0]},av=function(n){return[n.deltaX,n.deltaY]},nv=function(n){return n&&"current"in n?n.current:n},J5=function(n,r){return n[0]===r[0]&&n[1]===r[1]},W5=function(n){return`
  .block-interactivity-`.concat(n,` {pointer-events: none;}
  .allow-interactivity-`).concat(n,` {pointer-events: all;}
`)},$5=0,fi=[];function eS(n){var r=j.useRef([]),o=j.useRef([0,0]),l=j.useRef(),s=j.useState($5++)[0],c=j.useState(z0)[0],f=j.useRef(n);j.useEffect(function(){f.current=n},[n]),j.useEffect(function(){if(n.inert){document.body.classList.add("block-interactivity-".concat(s));var g=w5([n.lockRef.current],(n.shards||[]).map(nv),!0).filter(Boolean);return g.forEach(function(w){return w.classList.add("allow-interactivity-".concat(s))}),function(){document.body.classList.remove("block-interactivity-".concat(s)),g.forEach(function(w){return w.classList.remove("allow-interactivity-".concat(s))})}}},[n.inert,n.lockRef.current,n.shards]);var h=j.useCallback(function(g,w){if("touches"in g&&g.touches.length===2||g.type==="wheel"&&g.ctrlKey)return!f.current.allowPinchZoom;var k=Jl(g),A=o.current,N="deltaX"in g?g.deltaX:A[0]-k[0],R="deltaY"in g?g.deltaY:A[1]-k[1],U,Y=g.target,H=Math.abs(N)>Math.abs(R)?"h":"v";if("touches"in g&&H==="h"&&Y.type==="range")return!1;var I=window.getSelection(),K=I&&I.anchorNode,se=K?K===Y||K.contains(Y):!1;if(se)return!1;var ge=tv(H,Y);if(!ge)return!0;if(ge?U=H:(U=H==="v"?"h":"v",ge=tv(H,Y)),!ge)return!1;if(!l.current&&"changedTouches"in g&&(N||R)&&(l.current=U),!U)return!0;var B=l.current||U;return P5(B,w,g,B==="h"?N:R)},[]),p=j.useCallback(function(g){var w=g;if(!(!fi.length||fi[fi.length-1]!==c)){var k="deltaY"in w?av(w):Jl(w),A=r.current.filter(function(U){return U.name===w.type&&(U.target===w.target||w.target===U.shadowParent)&&J5(U.delta,k)})[0];if(A&&A.should){w.cancelable&&w.preventDefault();return}if(!A){var N=(f.current.shards||[]).map(nv).filter(Boolean).filter(function(U){return U.contains(w.target)}),R=N.length>0?h(w,N[0]):!f.current.noIsolation;R&&w.cancelable&&w.preventDefault()}}},[]),m=j.useCallback(function(g,w,k,A){var N={name:g,delta:w,target:k,should:A,shadowParent:tS(k)};r.current.push(N),setTimeout(function(){r.current=r.current.filter(function(R){return R!==N})},1)},[]),v=j.useCallback(function(g){o.current=Jl(g),l.current=void 0},[]),b=j.useCallback(function(g){m(g.type,av(g),g.target,h(g,n.lockRef.current))},[]),E=j.useCallback(function(g){m(g.type,Jl(g),g.target,h(g,n.lockRef.current))},[]);j.useEffect(function(){return fi.push(c),n.setCallbacks({onScrollCapture:b,onWheelCapture:b,onTouchMoveCapture:E}),document.addEventListener("wheel",p,di),document.addEventListener("touchmove",p,di),document.addEventListener("touchstart",v,di),function(){fi=fi.filter(function(g){return g!==c}),document.removeEventListener("wheel",p,di),document.removeEventListener("touchmove",p,di),document.removeEventListener("touchstart",v,di)}},[]);var x=n.removeScrollBar,z=n.inert;return j.createElement(j.Fragment,null,z?j.createElement(c,{styles:W5(s)}):null,x?j.createElement(G5,{noRelative:n.noRelative,gapMode:n.gapMode}):null)}function tS(n){for(var r=null;n!==null;)n instanceof ShadowRoot&&(r=n.host,n=n.host),n=n.parentNode;return r}const aS=N5(E0,eS);var N0=j.forwardRef(function(n,r){return j.createElement(zs,Ha({},n,{ref:r,sideCar:aS}))});N0.classNames=zs.classNames;var nS=function(n){if(typeof document>"u")return null;var r=Array.isArray(n)?n[0]:n;return r.ownerDocument.body},hi=new WeakMap,Wl=new WeakMap,$l={},dd=0,O0=function(n){return n&&(n.host||O0(n.parentNode))},rS=function(n,r){return r.map(function(o){if(n.contains(o))return o;var l=O0(o);return l&&n.contains(l)?l:(console.error("aria-hidden",o,"in not contained inside",n,". Doing nothing"),null)}).filter(function(o){return!!o})},iS=function(n,r,o,l){var s=rS(r,Array.isArray(n)?n:[n]);$l[o]||($l[o]=new WeakMap);var c=$l[o],f=[],h=new Set,p=new Set(s),m=function(b){!b||h.has(b)||(h.add(b),m(b.parentNode))};s.forEach(m);var v=function(b){!b||p.has(b)||Array.prototype.forEach.call(b.children,function(E){if(h.has(E))v(E);else try{var x=E.getAttribute(l),z=x!==null&&x!=="false",g=(hi.get(E)||0)+1,w=(c.get(E)||0)+1;hi.set(E,g),c.set(E,w),f.push(E),g===1&&z&&Wl.set(E,!0),w===1&&E.setAttribute(o,"true"),z||E.setAttribute(l,"true")}catch(k){console.error("aria-hidden: cannot operate on ",E,k)}})};return v(r),h.clear(),dd++,function(){f.forEach(function(b){var E=hi.get(b)-1,x=c.get(b)-1;hi.set(b,E),c.set(b,x),E||(Wl.has(b)||b.removeAttribute(l),Wl.delete(b)),x||b.removeAttribute(o)}),dd--,dd||(hi=new WeakMap,hi=new WeakMap,Wl=new WeakMap,$l={})}},oS=function(n,r,o){o===void 0&&(o="data-aria-hidden");var l=Array.from(Array.isArray(n)?n:[n]),s=nS(n);return s?(l.push.apply(l,Array.from(s.querySelectorAll("[aria-live], script"))),iS(l,s,o,"aria-hidden")):function(){return null}};function j0(n){const r=j.useRef({value:n,previous:n});return j.useMemo(()=>(r.current.value!==n&&(r.current.previous=r.current.value,r.current.value=n),r.current.previous),[n])}function R0(n){const[r,o]=j.useState(void 0);return Gt(()=>{if(n){o({width:n.offsetWidth,height:n.offsetHeight});const l=new ResizeObserver(s=>{if(!Array.isArray(s)||!s.length)return;const c=s[0];let f,h;if("borderBoxSize"in c){const p=c.borderBoxSize,m=Array.isArray(p)?p[0]:p;f=m.inlineSize,h=m.blockSize}else f=n.offsetWidth,h=n.offsetHeight;o({width:f,height:h})});return l.observe(n,{box:"border-box"}),()=>l.unobserve(n)}else o(void 0)},[n]),r}var Cs="Checkbox",[lS]=Es(Cs),[sS,Fd]=lS(Cs);function cS(n){const{__scopeCheckbox:r,checked:o,children:l,defaultChecked:s,disabled:c,form:f,name:h,onCheckedChange:p,required:m,value:v="on",internal_do_not_use_render:b}=n,[E,x]=_d({prop:o,defaultProp:s??!1,onChange:p,caller:Cs}),[z,g]=j.useState(null),[w,k]=j.useState(null),A=j.useRef(!1),N=z?!!f||!!z.closest("form"):!0,R={checked:E,disabled:c,setChecked:x,control:z,setControl:g,name:h,form:f,value:v,hasConsumerStoppedPropagationRef:A,required:m,defaultChecked:In(s)?!1:s,isFormControl:N,bubbleInput:w,setBubbleInput:k};return _.jsx(sS,{scope:r,...R,children:uS(b)?b(R):l})}var M0="CheckboxTrigger",D0=j.forwardRef(({__scopeCheckbox:n,onKeyDown:r,onClick:o,...l},s)=>{const{control:c,value:f,disabled:h,checked:p,required:m,setControl:v,setChecked:b,hasConsumerStoppedPropagationRef:E,isFormControl:x,bubbleInput:z}=Fd(M0,n),g=Tt(s,v),w=j.useRef(p);return j.useEffect(()=>{const k=c==null?void 0:c.form;if(k){const A=()=>b(w.current);return k.addEventListener("reset",A),()=>k.removeEventListener("reset",A)}},[c,b]),_.jsx(gt.button,{type:"button",role:"checkbox","aria-checked":In(p)?"mixed":p,"aria-required":m,"data-state":V0(p),"data-disabled":h?"":void 0,disabled:h,value:f,...l,ref:g,onKeyDown:_t(r,k=>{k.key==="Enter"&&k.preventDefault()}),onClick:_t(o,k=>{b(A=>In(A)?!0:!A),z&&x&&(E.current=k.isPropagationStopped(),E.current||k.stopPropagation())})})});D0.displayName=M0;var B0=j.forwardRef((n,r)=>{const{__scopeCheckbox:o,name:l,checked:s,defaultChecked:c,required:f,disabled:h,value:p,onCheckedChange:m,form:v,...b}=n;return _.jsx(cS,{__scopeCheckbox:o,checked:s,defaultChecked:c,disabled:h,required:f,onCheckedChange:m,name:l,form:v,value:p,internal_do_not_use_render:({isFormControl:E})=>_.jsxs(_.Fragment,{children:[_.jsx(D0,{...b,ref:r,__scopeCheckbox:o}),E&&_.jsx(Z0,{__scopeCheckbox:o})]})})});B0.displayName=Cs;var U0="CheckboxIndicator",L0=j.forwardRef((n,r)=>{const{__scopeCheckbox:o,forceMount:l,...s}=n,c=Fd(U0,o);return _.jsx(g0,{present:l||In(c.checked)||c.checked===!0,children:_.jsx(gt.span,{"data-state":V0(c.checked),"data-disabled":c.disabled?"":void 0,...s,ref:r,style:{pointerEvents:"none",...n.style}})})});L0.displayName=U0;var H0="CheckboxBubbleInput",Z0=j.forwardRef(({__scopeCheckbox:n,...r},o)=>{const{control:l,hasConsumerStoppedPropagationRef:s,checked:c,defaultChecked:f,required:h,disabled:p,name:m,value:v,form:b,bubbleInput:E,setBubbleInput:x}=Fd(H0,n),z=Tt(o,x),g=j0(c),w=R0(l);j.useEffect(()=>{const A=E;if(!A)return;const N=window.HTMLInputElement.prototype,U=Object.getOwnPropertyDescriptor(N,"checked").set,Y=!s.current;if(g!==c&&U){const H=new Event("click",{bubbles:Y});A.indeterminate=In(c),U.call(A,In(c)?!1:c),A.dispatchEvent(H)}},[E,g,c,s]);const k=j.useRef(In(c)?!1:c);return _.jsx(gt.input,{type:"checkbox","aria-hidden":!0,defaultChecked:f??k.current,required:h,disabled:p,name:m,value:v,form:b,...r,tabIndex:-1,ref:z,style:{...r.style,...w,position:"absolute",pointerEvents:"none",opacity:0,margin:0,transform:"translateX(-100%)"}})});Z0.displayName=H0;function uS(n){return typeof n=="function"}function In(n){return n==="indeterminate"}function V0(n){return In(n)?"indeterminate":n?"checked":"unchecked"}const dS=["top","right","bottom","left"],Kn=Math.min,la=Math.max,gs=Math.round,es=Math.floor,qa=n=>({x:n,y:n}),fS={left:"right",right:"left",bottom:"top",top:"bottom"},hS={start:"end",end:"start"};function Ed(n,r,o){return la(n,Kn(r,o))}function hn(n,r){return typeof n=="function"?n(r):n}function pn(n){return n.split("-")[0]}function Ei(n){return n.split("-")[1]}function Kd(n){return n==="x"?"y":"x"}function Pd(n){return n==="y"?"height":"width"}const pS=new Set(["top","bottom"]);function Za(n){return pS.has(pn(n))?"y":"x"}function Jd(n){return Kd(Za(n))}function mS(n,r,o){o===void 0&&(o=!1);const l=Ei(n),s=Jd(n),c=Pd(s);let f=s==="x"?l===(o?"end":"start")?"right":"left":l==="start"?"bottom":"top";return r.reference[c]>r.floating[c]&&(f=vs(f)),[f,vs(f)]}function gS(n){const r=vs(n);return[zd(n),r,zd(r)]}function zd(n){return n.replace(/start|end/g,r=>hS[r])}const rv=["left","right"],iv=["right","left"],vS=["top","bottom"],bS=["bottom","top"];function yS(n,r,o){switch(n){case"top":case"bottom":return o?r?iv:rv:r?rv:iv;case"left":case"right":return r?vS:bS;default:return[]}}function xS(n,r,o,l){const s=Ei(n);let c=yS(pn(n),o==="start",l);return s&&(c=c.map(f=>f+"-"+s),r&&(c=c.concat(c.map(zd)))),c}function vs(n){return n.replace(/left|right|bottom|top/g,r=>fS[r])}function wS(n){return{top:0,right:0,bottom:0,left:0,...n}}function q0(n){return typeof n!="number"?wS(n):{top:n,right:n,bottom:n,left:n}}function bs(n){const{x:r,y:o,width:l,height:s}=n;return{width:l,height:s,top:o,left:r,right:r+l,bottom:o+s,x:r,y:o}}function ov(n,r,o){let{reference:l,floating:s}=n;const c=Za(r),f=Jd(r),h=Pd(f),p=pn(r),m=c==="y",v=l.x+l.width/2-s.width/2,b=l.y+l.height/2-s.height/2,E=l[h]/2-s[h]/2;let x;switch(p){case"top":x={x:v,y:l.y-s.height};break;case"bottom":x={x:v,y:l.y+l.height};break;case"right":x={x:l.x+l.width,y:b};break;case"left":x={x:l.x-s.width,y:b};break;default:x={x:l.x,y:l.y}}switch(Ei(r)){case"start":x[f]-=E*(o&&m?-1:1);break;case"end":x[f]+=E*(o&&m?-1:1);break}return x}async function _S(n,r){var o;r===void 0&&(r={});const{x:l,y:s,platform:c,rects:f,elements:h,strategy:p}=n,{boundary:m="clippingAncestors",rootBoundary:v="viewport",elementContext:b="floating",altBoundary:E=!1,padding:x=0}=hn(r,n),z=q0(x),w=h[E?b==="floating"?"reference":"floating":b],k=bs(await c.getClippingRect({element:(o=await(c.isElement==null?void 0:c.isElement(w)))==null||o?w:w.contextElement||await(c.getDocumentElement==null?void 0:c.getDocumentElement(h.floating)),boundary:m,rootBoundary:v,strategy:p})),A=b==="floating"?{x:l,y:s,width:f.floating.width,height:f.floating.height}:f.reference,N=await(c.getOffsetParent==null?void 0:c.getOffsetParent(h.floating)),R=await(c.isElement==null?void 0:c.isElement(N))?await(c.getScale==null?void 0:c.getScale(N))||{x:1,y:1}:{x:1,y:1},U=bs(c.convertOffsetParentRelativeRectToViewportRelativeRect?await c.convertOffsetParentRelativeRectToViewportRelativeRect({elements:h,rect:A,offsetParent:N,strategy:p}):A);return{top:(k.top-U.top+z.top)/R.y,bottom:(U.bottom-k.bottom+z.bottom)/R.y,left:(k.left-U.left+z.left)/R.x,right:(U.right-k.right+z.right)/R.x}}const SS=async(n,r,o)=>{const{placement:l="bottom",strategy:s="absolute",middleware:c=[],platform:f}=o,h=c.filter(Boolean),p=await(f.isRTL==null?void 0:f.isRTL(r));let m=await f.getElementRects({reference:n,floating:r,strategy:s}),{x:v,y:b}=ov(m,l,p),E=l,x={},z=0;for(let w=0;w<h.length;w++){var g;const{name:k,fn:A}=h[w],{x:N,y:R,data:U,reset:Y}=await A({x:v,y:b,initialPlacement:l,placement:E,strategy:s,middlewareData:x,rects:m,platform:{...f,detectOverflow:(g=f.detectOverflow)!=null?g:_S},elements:{reference:n,floating:r}});v=N??v,b=R??b,x={...x,[k]:{...x[k],...U}},Y&&z<=50&&(z++,typeof Y=="object"&&(Y.placement&&(E=Y.placement),Y.rects&&(m=Y.rects===!0?await f.getElementRects({reference:n,floating:r,strategy:s}):Y.rects),{x:v,y:b}=ov(m,E,p)),w=-1)}return{x:v,y:b,placement:E,strategy:s,middlewareData:x}},kS=n=>({name:"arrow",options:n,async fn(r){const{x:o,y:l,placement:s,rects:c,platform:f,elements:h,middlewareData:p}=r,{element:m,padding:v=0}=hn(n,r)||{};if(m==null)return{};const b=q0(v),E={x:o,y:l},x=Jd(s),z=Pd(x),g=await f.getDimensions(m),w=x==="y",k=w?"top":"left",A=w?"bottom":"right",N=w?"clientHeight":"clientWidth",R=c.reference[z]+c.reference[x]-E[x]-c.floating[z],U=E[x]-c.reference[x],Y=await(f.getOffsetParent==null?void 0:f.getOffsetParent(m));let H=Y?Y[N]:0;(!H||!await(f.isElement==null?void 0:f.isElement(Y)))&&(H=h.floating[N]||c.floating[z]);const I=R/2-U/2,K=H/2-g[z]/2-1,se=Kn(b[k],K),ge=Kn(b[A],K),B=se,W=H-g[z]-ge,C=H/2-g[z]/2+I,ae=Ed(B,C,W),V=!p.arrow&&Ei(s)!=null&&C!==ae&&c.reference[z]/2-(C<B?se:ge)-g[z]/2<0,q=V?C<B?C-B:C-W:0;return{[x]:E[x]+q,data:{[x]:ae,centerOffset:C-ae-q,...V&&{alignmentOffset:q}},reset:V}}}),ES=function(n){return n===void 0&&(n={}),{name:"flip",options:n,async fn(r){var o,l;const{placement:s,middlewareData:c,rects:f,initialPlacement:h,platform:p,elements:m}=r,{mainAxis:v=!0,crossAxis:b=!0,fallbackPlacements:E,fallbackStrategy:x="bestFit",fallbackAxisSideDirection:z="none",flipAlignment:g=!0,...w}=hn(n,r);if((o=c.arrow)!=null&&o.alignmentOffset)return{};const k=pn(s),A=Za(h),N=pn(h)===h,R=await(p.isRTL==null?void 0:p.isRTL(m.floating)),U=E||(N||!g?[vs(h)]:gS(h)),Y=z!=="none";!E&&Y&&U.push(...xS(h,g,z,R));const H=[h,...U],I=await p.detectOverflow(r,w),K=[];let se=((l=c.flip)==null?void 0:l.overflows)||[];if(v&&K.push(I[k]),b){const C=mS(s,f,R);K.push(I[C[0]],I[C[1]])}if(se=[...se,{placement:s,overflows:K}],!K.every(C=>C<=0)){var ge,B;const C=(((ge=c.flip)==null?void 0:ge.index)||0)+1,ae=H[C];if(ae&&(!(b==="alignment"?A!==Za(ae):!1)||se.every(Q=>Za(Q.placement)===A?Q.overflows[0]>0:!0)))return{data:{index:C,overflows:se},reset:{placement:ae}};let V=(B=se.filter(q=>q.overflows[0]<=0).sort((q,Q)=>q.overflows[1]-Q.overflows[1])[0])==null?void 0:B.placement;if(!V)switch(x){case"bestFit":{var W;const q=(W=se.filter(Q=>{if(Y){const ne=Za(Q.placement);return ne===A||ne==="y"}return!0}).map(Q=>[Q.placement,Q.overflows.filter(ne=>ne>0).reduce((ne,ve)=>ne+ve,0)]).sort((Q,ne)=>Q[1]-ne[1])[0])==null?void 0:W[0];q&&(V=q);break}case"initialPlacement":V=h;break}if(s!==V)return{reset:{placement:V}}}return{}}}};function lv(n,r){return{top:n.top-r.height,right:n.right-r.width,bottom:n.bottom-r.height,left:n.left-r.width}}function sv(n){return dS.some(r=>n[r]>=0)}const zS=function(n){return n===void 0&&(n={}),{name:"hide",options:n,async fn(r){const{rects:o,platform:l}=r,{strategy:s="referenceHidden",...c}=hn(n,r);switch(s){case"referenceHidden":{const f=await l.detectOverflow(r,{...c,elementContext:"reference"}),h=lv(f,o.reference);return{data:{referenceHiddenOffsets:h,referenceHidden:sv(h)}}}case"escaped":{const f=await l.detectOverflow(r,{...c,altBoundary:!0}),h=lv(f,o.floating);return{data:{escapedOffsets:h,escaped:sv(h)}}}default:return{}}}}},G0=new Set(["left","top"]);async function CS(n,r){const{placement:o,platform:l,elements:s}=n,c=await(l.isRTL==null?void 0:l.isRTL(s.floating)),f=pn(o),h=Ei(o),p=Za(o)==="y",m=G0.has(f)?-1:1,v=c&&p?-1:1,b=hn(r,n);let{mainAxis:E,crossAxis:x,alignmentAxis:z}=typeof b=="number"?{mainAxis:b,crossAxis:0,alignmentAxis:null}:{mainAxis:b.mainAxis||0,crossAxis:b.crossAxis||0,alignmentAxis:b.alignmentAxis};return h&&typeof z=="number"&&(x=h==="end"?z*-1:z),p?{x:x*v,y:E*m}:{x:E*m,y:x*v}}const AS=function(n){return n===void 0&&(n=0),{name:"offset",options:n,async fn(r){var o,l;const{x:s,y:c,placement:f,middlewareData:h}=r,p=await CS(r,n);return f===((o=h.offset)==null?void 0:o.placement)&&(l=h.arrow)!=null&&l.alignmentOffset?{}:{x:s+p.x,y:c+p.y,data:{...p,placement:f}}}}},TS=function(n){return n===void 0&&(n={}),{name:"shift",options:n,async fn(r){const{x:o,y:l,placement:s,platform:c}=r,{mainAxis:f=!0,crossAxis:h=!1,limiter:p={fn:k=>{let{x:A,y:N}=k;return{x:A,y:N}}},...m}=hn(n,r),v={x:o,y:l},b=await c.detectOverflow(r,m),E=Za(pn(s)),x=Kd(E);let z=v[x],g=v[E];if(f){const k=x==="y"?"top":"left",A=x==="y"?"bottom":"right",N=z+b[k],R=z-b[A];z=Ed(N,z,R)}if(h){const k=E==="y"?"top":"left",A=E==="y"?"bottom":"right",N=g+b[k],R=g-b[A];g=Ed(N,g,R)}const w=p.fn({...r,[x]:z,[E]:g});return{...w,data:{x:w.x-o,y:w.y-l,enabled:{[x]:f,[E]:h}}}}}},NS=function(n){return n===void 0&&(n={}),{options:n,fn(r){const{x:o,y:l,placement:s,rects:c,middlewareData:f}=r,{offset:h=0,mainAxis:p=!0,crossAxis:m=!0}=hn(n,r),v={x:o,y:l},b=Za(s),E=Kd(b);let x=v[E],z=v[b];const g=hn(h,r),w=typeof g=="number"?{mainAxis:g,crossAxis:0}:{mainAxis:0,crossAxis:0,...g};if(p){const N=E==="y"?"height":"width",R=c.reference[E]-c.floating[N]+w.mainAxis,U=c.reference[E]+c.reference[N]-w.mainAxis;x<R?x=R:x>U&&(x=U)}if(m){var k,A;const N=E==="y"?"width":"height",R=G0.has(pn(s)),U=c.reference[b]-c.floating[N]+(R&&((k=f.offset)==null?void 0:k[b])||0)+(R?0:w.crossAxis),Y=c.reference[b]+c.reference[N]+(R?0:((A=f.offset)==null?void 0:A[b])||0)-(R?w.crossAxis:0);z<U?z=U:z>Y&&(z=Y)}return{[E]:x,[b]:z}}}},OS=function(n){return n===void 0&&(n={}),{name:"size",options:n,async fn(r){var o,l;const{placement:s,rects:c,platform:f,elements:h}=r,{apply:p=()=>{},...m}=hn(n,r),v=await f.detectOverflow(r,m),b=pn(s),E=Ei(s),x=Za(s)==="y",{width:z,height:g}=c.floating;let w,k;b==="top"||b==="bottom"?(w=b,k=E===(await(f.isRTL==null?void 0:f.isRTL(h.floating))?"start":"end")?"left":"right"):(k=b,w=E==="end"?"top":"bottom");const A=g-v.top-v.bottom,N=z-v.left-v.right,R=Kn(g-v[w],A),U=Kn(z-v[k],N),Y=!r.middlewareData.shift;let H=R,I=U;if((o=r.middlewareData.shift)!=null&&o.enabled.x&&(I=N),(l=r.middlewareData.shift)!=null&&l.enabled.y&&(H=A),Y&&!E){const se=la(v.left,0),ge=la(v.right,0),B=la(v.top,0),W=la(v.bottom,0);x?I=z-2*(se!==0||ge!==0?se+ge:la(v.left,v.right)):H=g-2*(B!==0||W!==0?B+W:la(v.top,v.bottom))}await p({...r,availableWidth:I,availableHeight:H});const K=await f.getDimensions(h.floating);return z!==K.width||g!==K.height?{reset:{rects:!0}}:{}}}};function As(){return typeof window<"u"}function zi(n){return Y0(n)?(n.nodeName||"").toLowerCase():"#document"}function sa(n){var r;return(n==null||(r=n.ownerDocument)==null?void 0:r.defaultView)||window}function Ya(n){var r;return(r=(Y0(n)?n.ownerDocument:n.document)||window.document)==null?void 0:r.documentElement}function Y0(n){return As()?n instanceof Node||n instanceof sa(n).Node:!1}function ja(n){return As()?n instanceof Element||n instanceof sa(n).Element:!1}function Ga(n){return As()?n instanceof HTMLElement||n instanceof sa(n).HTMLElement:!1}function cv(n){return!As()||typeof ShadowRoot>"u"?!1:n instanceof ShadowRoot||n instanceof sa(n).ShadowRoot}const jS=new Set(["inline","contents"]);function jo(n){const{overflow:r,overflowX:o,overflowY:l,display:s}=Ra(n);return/auto|scroll|overlay|hidden|clip/.test(r+l+o)&&!jS.has(s)}const RS=new Set(["table","td","th"]);function MS(n){return RS.has(zi(n))}const DS=[":popover-open",":modal"];function Ts(n){return DS.some(r=>{try{return n.matches(r)}catch{return!1}})}const BS=["transform","translate","scale","rotate","perspective"],US=["transform","translate","scale","rotate","perspective","filter"],LS=["paint","layout","strict","content"];function Wd(n){const r=$d(),o=ja(n)?Ra(n):n;return BS.some(l=>o[l]?o[l]!=="none":!1)||(o.containerType?o.containerType!=="normal":!1)||!r&&(o.backdropFilter?o.backdropFilter!=="none":!1)||!r&&(o.filter?o.filter!=="none":!1)||US.some(l=>(o.willChange||"").includes(l))||LS.some(l=>(o.contain||"").includes(l))}function HS(n){let r=Pn(n);for(;Ga(r)&&!_i(r);){if(Wd(r))return r;if(Ts(r))return null;r=Pn(r)}return null}function $d(){return typeof CSS>"u"||!CSS.supports?!1:CSS.supports("-webkit-backdrop-filter","none")}const ZS=new Set(["html","body","#document"]);function _i(n){return ZS.has(zi(n))}function Ra(n){return sa(n).getComputedStyle(n)}function Ns(n){return ja(n)?{scrollLeft:n.scrollLeft,scrollTop:n.scrollTop}:{scrollLeft:n.scrollX,scrollTop:n.scrollY}}function Pn(n){if(zi(n)==="html")return n;const r=n.assignedSlot||n.parentNode||cv(n)&&n.host||Ya(n);return cv(r)?r.host:r}function I0(n){const r=Pn(n);return _i(r)?n.ownerDocument?n.ownerDocument.body:n.body:Ga(r)&&jo(r)?r:I0(r)}function To(n,r,o){var l;r===void 0&&(r=[]),o===void 0&&(o=!0);const s=I0(n),c=s===((l=n.ownerDocument)==null?void 0:l.body),f=sa(s);if(c){const h=Cd(f);return r.concat(f,f.visualViewport||[],jo(s)?s:[],h&&o?To(h):[])}return r.concat(s,To(s,[],o))}function Cd(n){return n.parent&&Object.getPrototypeOf(n.parent)?n.frameElement:null}function X0(n){const r=Ra(n);let o=parseFloat(r.width)||0,l=parseFloat(r.height)||0;const s=Ga(n),c=s?n.offsetWidth:o,f=s?n.offsetHeight:l,h=gs(o)!==c||gs(l)!==f;return h&&(o=c,l=f),{width:o,height:l,$:h}}function ef(n){return ja(n)?n:n.contextElement}function vi(n){const r=ef(n);if(!Ga(r))return qa(1);const o=r.getBoundingClientRect(),{width:l,height:s,$:c}=X0(r);let f=(c?gs(o.width):o.width)/l,h=(c?gs(o.height):o.height)/s;return(!f||!Number.isFinite(f))&&(f=1),(!h||!Number.isFinite(h))&&(h=1),{x:f,y:h}}const VS=qa(0);function Q0(n){const r=sa(n);return!$d()||!r.visualViewport?VS:{x:r.visualViewport.offsetLeft,y:r.visualViewport.offsetTop}}function qS(n,r,o){return r===void 0&&(r=!1),!o||r&&o!==sa(n)?!1:r}function _r(n,r,o,l){r===void 0&&(r=!1),o===void 0&&(o=!1);const s=n.getBoundingClientRect(),c=ef(n);let f=qa(1);r&&(l?ja(l)&&(f=vi(l)):f=vi(n));const h=qS(c,o,l)?Q0(c):qa(0);let p=(s.left+h.x)/f.x,m=(s.top+h.y)/f.y,v=s.width/f.x,b=s.height/f.y;if(c){const E=sa(c),x=l&&ja(l)?sa(l):l;let z=E,g=Cd(z);for(;g&&l&&x!==z;){const w=vi(g),k=g.getBoundingClientRect(),A=Ra(g),N=k.left+(g.clientLeft+parseFloat(A.paddingLeft))*w.x,R=k.top+(g.clientTop+parseFloat(A.paddingTop))*w.y;p*=w.x,m*=w.y,v*=w.x,b*=w.y,p+=N,m+=R,z=sa(g),g=Cd(z)}}return bs({width:v,height:b,x:p,y:m})}function Os(n,r){const o=Ns(n).scrollLeft;return r?r.left+o:_r(Ya(n)).left+o}function F0(n,r){const o=n.getBoundingClientRect(),l=o.left+r.scrollLeft-Os(n,o),s=o.top+r.scrollTop;return{x:l,y:s}}function GS(n){let{elements:r,rect:o,offsetParent:l,strategy:s}=n;const c=s==="fixed",f=Ya(l),h=r?Ts(r.floating):!1;if(l===f||h&&c)return o;let p={scrollLeft:0,scrollTop:0},m=qa(1);const v=qa(0),b=Ga(l);if((b||!b&&!c)&&((zi(l)!=="body"||jo(f))&&(p=Ns(l)),Ga(l))){const x=_r(l);m=vi(l),v.x=x.x+l.clientLeft,v.y=x.y+l.clientTop}const E=f&&!b&&!c?F0(f,p):qa(0);return{width:o.width*m.x,height:o.height*m.y,x:o.x*m.x-p.scrollLeft*m.x+v.x+E.x,y:o.y*m.y-p.scrollTop*m.y+v.y+E.y}}function YS(n){return Array.from(n.getClientRects())}function IS(n){const r=Ya(n),o=Ns(n),l=n.ownerDocument.body,s=la(r.scrollWidth,r.clientWidth,l.scrollWidth,l.clientWidth),c=la(r.scrollHeight,r.clientHeight,l.scrollHeight,l.clientHeight);let f=-o.scrollLeft+Os(n);const h=-o.scrollTop;return Ra(l).direction==="rtl"&&(f+=la(r.clientWidth,l.clientWidth)-s),{width:s,height:c,x:f,y:h}}const uv=25;function XS(n,r){const o=sa(n),l=Ya(n),s=o.visualViewport;let c=l.clientWidth,f=l.clientHeight,h=0,p=0;if(s){c=s.width,f=s.height;const v=$d();(!v||v&&r==="fixed")&&(h=s.offsetLeft,p=s.offsetTop)}const m=Os(l);if(m<=0){const v=l.ownerDocument,b=v.body,E=getComputedStyle(b),x=v.compatMode==="CSS1Compat"&&parseFloat(E.marginLeft)+parseFloat(E.marginRight)||0,z=Math.abs(l.clientWidth-b.clientWidth-x);z<=uv&&(c-=z)}else m<=uv&&(c+=m);return{width:c,height:f,x:h,y:p}}const QS=new Set(["absolute","fixed"]);function FS(n,r){const o=_r(n,!0,r==="fixed"),l=o.top+n.clientTop,s=o.left+n.clientLeft,c=Ga(n)?vi(n):qa(1),f=n.clientWidth*c.x,h=n.clientHeight*c.y,p=s*c.x,m=l*c.y;return{width:f,height:h,x:p,y:m}}function dv(n,r,o){let l;if(r==="viewport")l=XS(n,o);else if(r==="document")l=IS(Ya(n));else if(ja(r))l=FS(r,o);else{const s=Q0(n);l={x:r.x-s.x,y:r.y-s.y,width:r.width,height:r.height}}return bs(l)}function K0(n,r){const o=Pn(n);return o===r||!ja(o)||_i(o)?!1:Ra(o).position==="fixed"||K0(o,r)}function KS(n,r){const o=r.get(n);if(o)return o;let l=To(n,[],!1).filter(h=>ja(h)&&zi(h)!=="body"),s=null;const c=Ra(n).position==="fixed";let f=c?Pn(n):n;for(;ja(f)&&!_i(f);){const h=Ra(f),p=Wd(f);!p&&h.position==="fixed"&&(s=null),(c?!p&&!s:!p&&h.position==="static"&&!!s&&QS.has(s.position)||jo(f)&&!p&&K0(n,f))?l=l.filter(v=>v!==f):s=h,f=Pn(f)}return r.set(n,l),l}function PS(n){let{element:r,boundary:o,rootBoundary:l,strategy:s}=n;const f=[...o==="clippingAncestors"?Ts(r)?[]:KS(r,this._c):[].concat(o),l],h=f[0],p=f.reduce((m,v)=>{const b=dv(r,v,s);return m.top=la(b.top,m.top),m.right=Kn(b.right,m.right),m.bottom=Kn(b.bottom,m.bottom),m.left=la(b.left,m.left),m},dv(r,h,s));return{width:p.right-p.left,height:p.bottom-p.top,x:p.left,y:p.top}}function JS(n){const{width:r,height:o}=X0(n);return{width:r,height:o}}function WS(n,r,o){const l=Ga(r),s=Ya(r),c=o==="fixed",f=_r(n,!0,c,r);let h={scrollLeft:0,scrollTop:0};const p=qa(0);function m(){p.x=Os(s)}if(l||!l&&!c)if((zi(r)!=="body"||jo(s))&&(h=Ns(r)),l){const x=_r(r,!0,c,r);p.x=x.x+r.clientLeft,p.y=x.y+r.clientTop}else s&&m();c&&!l&&s&&m();const v=s&&!l&&!c?F0(s,h):qa(0),b=f.left+h.scrollLeft-p.x-v.x,E=f.top+h.scrollTop-p.y-v.y;return{x:b,y:E,width:f.width,height:f.height}}function fd(n){return Ra(n).position==="static"}function fv(n,r){if(!Ga(n)||Ra(n).position==="fixed")return null;if(r)return r(n);let o=n.offsetParent;return Ya(n)===o&&(o=o.ownerDocument.body),o}function P0(n,r){const o=sa(n);if(Ts(n))return o;if(!Ga(n)){let s=Pn(n);for(;s&&!_i(s);){if(ja(s)&&!fd(s))return s;s=Pn(s)}return o}let l=fv(n,r);for(;l&&MS(l)&&fd(l);)l=fv(l,r);return l&&_i(l)&&fd(l)&&!Wd(l)?o:l||HS(n)||o}const $S=async function(n){const r=this.getOffsetParent||P0,o=this.getDimensions,l=await o(n.floating);return{reference:WS(n.reference,await r(n.floating),n.strategy),floating:{x:0,y:0,width:l.width,height:l.height}}};function ek(n){return Ra(n).direction==="rtl"}const tk={convertOffsetParentRelativeRectToViewportRelativeRect:GS,getDocumentElement:Ya,getClippingRect:PS,getOffsetParent:P0,getElementRects:$S,getClientRects:YS,getDimensions:JS,getScale:vi,isElement:ja,isRTL:ek};function J0(n,r){return n.x===r.x&&n.y===r.y&&n.width===r.width&&n.height===r.height}function ak(n,r){let o=null,l;const s=Ya(n);function c(){var h;clearTimeout(l),(h=o)==null||h.disconnect(),o=null}function f(h,p){h===void 0&&(h=!1),p===void 0&&(p=1),c();const m=n.getBoundingClientRect(),{left:v,top:b,width:E,height:x}=m;if(h||r(),!E||!x)return;const z=es(b),g=es(s.clientWidth-(v+E)),w=es(s.clientHeight-(b+x)),k=es(v),N={rootMargin:-z+"px "+-g+"px "+-w+"px "+-k+"px",threshold:la(0,Kn(1,p))||1};let R=!0;function U(Y){const H=Y[0].intersectionRatio;if(H!==p){if(!R)return f();H?f(!1,H):l=setTimeout(()=>{f(!1,1e-7)},1e3)}H===1&&!J0(m,n.getBoundingClientRect())&&f(),R=!1}try{o=new IntersectionObserver(U,{...N,root:s.ownerDocument})}catch{o=new IntersectionObserver(U,N)}o.observe(n)}return f(!0),c}function nk(n,r,o,l){l===void 0&&(l={});const{ancestorScroll:s=!0,ancestorResize:c=!0,elementResize:f=typeof ResizeObserver=="function",layoutShift:h=typeof IntersectionObserver=="function",animationFrame:p=!1}=l,m=ef(n),v=s||c?[...m?To(m):[],...To(r)]:[];v.forEach(k=>{s&&k.addEventListener("scroll",o,{passive:!0}),c&&k.addEventListener("resize",o)});const b=m&&h?ak(m,o):null;let E=-1,x=null;f&&(x=new ResizeObserver(k=>{let[A]=k;A&&A.target===m&&x&&(x.unobserve(r),cancelAnimationFrame(E),E=requestAnimationFrame(()=>{var N;(N=x)==null||N.observe(r)})),o()}),m&&!p&&x.observe(m),x.observe(r));let z,g=p?_r(n):null;p&&w();function w(){const k=_r(n);g&&!J0(g,k)&&o(),g=k,z=requestAnimationFrame(w)}return o(),()=>{var k;v.forEach(A=>{s&&A.removeEventListener("scroll",o),c&&A.removeEventListener("resize",o)}),b==null||b(),(k=x)==null||k.disconnect(),x=null,p&&cancelAnimationFrame(z)}}const rk=AS,ik=TS,ok=ES,lk=OS,sk=zS,hv=kS,ck=NS,uk=(n,r,o)=>{const l=new Map,s={platform:tk,...o},c={...s.platform,_c:l};return SS(n,r,{...s,platform:c})};var dk=typeof document<"u",fk=function(){},rs=dk?j.useLayoutEffect:fk;function ys(n,r){if(n===r)return!0;if(typeof n!=typeof r)return!1;if(typeof n=="function"&&n.toString()===r.toString())return!0;let o,l,s;if(n&&r&&typeof n=="object"){if(Array.isArray(n)){if(o=n.length,o!==r.length)return!1;for(l=o;l--!==0;)if(!ys(n[l],r[l]))return!1;return!0}if(s=Object.keys(n),o=s.length,o!==Object.keys(r).length)return!1;for(l=o;l--!==0;)if(!{}.hasOwnProperty.call(r,s[l]))return!1;for(l=o;l--!==0;){const c=s[l];if(!(c==="_owner"&&n.$$typeof)&&!ys(n[c],r[c]))return!1}return!0}return n!==n&&r!==r}function W0(n){return typeof window>"u"?1:(n.ownerDocument.defaultView||window).devicePixelRatio||1}function pv(n,r){const o=W0(n);return Math.round(r*o)/o}function hd(n){const r=j.useRef(n);return rs(()=>{r.current=n}),r}function hk(n){n===void 0&&(n={});const{placement:r="bottom",strategy:o="absolute",middleware:l=[],platform:s,elements:{reference:c,floating:f}={},transform:h=!0,whileElementsMounted:p,open:m}=n,[v,b]=j.useState({x:0,y:0,strategy:o,placement:r,middlewareData:{},isPositioned:!1}),[E,x]=j.useState(l);ys(E,l)||x(l);const[z,g]=j.useState(null),[w,k]=j.useState(null),A=j.useCallback(Q=>{Q!==Y.current&&(Y.current=Q,g(Q))},[]),N=j.useCallback(Q=>{Q!==H.current&&(H.current=Q,k(Q))},[]),R=c||z,U=f||w,Y=j.useRef(null),H=j.useRef(null),I=j.useRef(v),K=p!=null,se=hd(p),ge=hd(s),B=hd(m),W=j.useCallback(()=>{if(!Y.current||!H.current)return;const Q={placement:r,strategy:o,middleware:E};ge.current&&(Q.platform=ge.current),uk(Y.current,H.current,Q).then(ne=>{const ve={...ne,isPositioned:B.current!==!1};C.current&&!ys(I.current,ve)&&(I.current=ve,No.flushSync(()=>{b(ve)}))})},[E,r,o,ge,B]);rs(()=>{m===!1&&I.current.isPositioned&&(I.current.isPositioned=!1,b(Q=>({...Q,isPositioned:!1})))},[m]);const C=j.useRef(!1);rs(()=>(C.current=!0,()=>{C.current=!1}),[]),rs(()=>{if(R&&(Y.current=R),U&&(H.current=U),R&&U){if(se.current)return se.current(R,U,W);W()}},[R,U,W,se,K]);const ae=j.useMemo(()=>({reference:Y,floating:H,setReference:A,setFloating:N}),[A,N]),V=j.useMemo(()=>({reference:R,floating:U}),[R,U]),q=j.useMemo(()=>{const Q={position:o,left:0,top:0};if(!V.floating)return Q;const ne=pv(V.floating,v.x),ve=pv(V.floating,v.y);return h?{...Q,transform:"translate("+ne+"px, "+ve+"px)",...W0(V.floating)>=1.5&&{willChange:"transform"}}:{position:o,left:ne,top:ve}},[o,h,V.floating,v.x,v.y]);return j.useMemo(()=>({...v,update:W,refs:ae,elements:V,floatingStyles:q}),[v,W,ae,V,q])}const pk=n=>{function r(o){return{}.hasOwnProperty.call(o,"current")}return{name:"arrow",options:n,fn(o){const{element:l,padding:s}=typeof n=="function"?n(o):n;return l&&r(l)?l.current!=null?hv({element:l.current,padding:s}).fn(o):{}:l?hv({element:l,padding:s}).fn(o):{}}}},mk=(n,r)=>({...rk(n),options:[n,r]}),gk=(n,r)=>({...ik(n),options:[n,r]}),vk=(n,r)=>({...ck(n),options:[n,r]}),bk=(n,r)=>({...ok(n),options:[n,r]}),yk=(n,r)=>({...lk(n),options:[n,r]}),xk=(n,r)=>({...sk(n),options:[n,r]}),wk=(n,r)=>({...pk(n),options:[n,r]});var _k="Arrow",$0=j.forwardRef((n,r)=>{const{children:o,width:l=10,height:s=5,...c}=n;return _.jsx(gt.svg,{...c,ref:r,width:l,height:s,viewBox:"0 0 30 10",preserveAspectRatio:"none",children:n.asChild?o:_.jsx("polygon",{points:"0,0 30,0 15,10"})})});$0.displayName=_k;var Sk=$0,tf="Popper",[eb,tb]=Es(tf),[kk,ab]=eb(tf),nb=n=>{const{__scopePopper:r,children:o}=n,[l,s]=j.useState(null);return _.jsx(kk,{scope:r,anchor:l,onAnchorChange:s,children:o})};nb.displayName=tf;var rb="PopperAnchor",ib=j.forwardRef((n,r)=>{const{__scopePopper:o,virtualRef:l,...s}=n,c=ab(rb,o),f=j.useRef(null),h=Tt(r,f),p=j.useRef(null);return j.useEffect(()=>{const m=p.current;p.current=(l==null?void 0:l.current)||f.current,m!==p.current&&c.onAnchorChange(p.current)}),l?null:_.jsx(gt.div,{...s,ref:h})});ib.displayName=rb;var af="PopperContent",[Ek,zk]=eb(af),ob=j.forwardRef((n,r)=>{var he,Se,ke,Me,Re,Le;const{__scopePopper:o,side:l="bottom",sideOffset:s=0,align:c="center",alignOffset:f=0,arrowPadding:h=0,avoidCollisions:p=!0,collisionBoundary:m=[],collisionPadding:v=0,sticky:b="partial",hideWhenDetached:E=!1,updatePositionStrategy:x="optimized",onPlaced:z,...g}=n,w=ab(af,o),[k,A]=j.useState(null),N=Tt(r,st=>A(st)),[R,U]=j.useState(null),Y=R0(R),H=(Y==null?void 0:Y.width)??0,I=(Y==null?void 0:Y.height)??0,K=l+(c!=="center"?"-"+c:""),se=typeof v=="number"?v:{top:0,right:0,bottom:0,left:0,...v},ge=Array.isArray(m)?m:[m],B=ge.length>0,W={padding:se,boundary:ge.filter(Ak),altBoundary:B},{refs:C,floatingStyles:ae,placement:V,isPositioned:q,middlewareData:Q}=hk({strategy:"fixed",placement:K,whileElementsMounted:(...st)=>nk(...st,{animationFrame:x==="always"}),elements:{reference:w.anchor},middleware:[mk({mainAxis:s+I,alignmentAxis:f}),p&&gk({mainAxis:!0,crossAxis:!1,limiter:b==="partial"?vk():void 0,...W}),p&&bk({...W}),yk({...W,apply:({elements:st,rects:S,availableWidth:ue,availableHeight:ie})=>{const{width:L,height:M}=S.reference,X=st.floating.style;X.setProperty("--radix-popper-available-width",`${ue}px`),X.setProperty("--radix-popper-available-height",`${ie}px`),X.setProperty("--radix-popper-anchor-width",`${L}px`),X.setProperty("--radix-popper-anchor-height",`${M}px`)}}),R&&wk({element:R,padding:h}),Tk({arrowWidth:H,arrowHeight:I}),E&&xk({strategy:"referenceHidden",...W})]}),[ne,ve]=cb(V),O=wr(z);Gt(()=>{q&&(O==null||O())},[q,O]);const D=(he=Q.arrow)==null?void 0:he.x,re=(Se=Q.arrow)==null?void 0:Se.y,ee=((ke=Q.arrow)==null?void 0:ke.centerOffset)!==0,[le,Ee]=j.useState();return Gt(()=>{k&&Ee(window.getComputedStyle(k).zIndex)},[k]),_.jsx("div",{ref:C.setFloating,"data-radix-popper-content-wrapper":"",style:{...ae,transform:q?ae.transform:"translate(0, -200%)",minWidth:"max-content",zIndex:le,"--radix-popper-transform-origin":[(Me=Q.transformOrigin)==null?void 0:Me.x,(Re=Q.transformOrigin)==null?void 0:Re.y].join(" "),...((Le=Q.hide)==null?void 0:Le.referenceHidden)&&{visibility:"hidden",pointerEvents:"none"}},dir:n.dir,children:_.jsx(Ek,{scope:o,placedSide:ne,onArrowChange:U,arrowX:D,arrowY:re,shouldHideArrow:ee,children:_.jsx(gt.div,{"data-side":ne,"data-align":ve,...g,ref:N,style:{...g.style,animation:q?void 0:"none"}})})})});ob.displayName=af;var lb="PopperArrow",Ck={top:"bottom",right:"left",bottom:"top",left:"right"},sb=j.forwardRef(function(r,o){const{__scopePopper:l,...s}=r,c=zk(lb,l),f=Ck[c.placedSide];return _.jsx("span",{ref:c.onArrowChange,style:{position:"absolute",left:c.arrowX,top:c.arrowY,[f]:0,transformOrigin:{top:"",right:"0 0",bottom:"center 0",left:"100% 0"}[c.placedSide],transform:{top:"translateY(100%)",right:"translateY(50%) rotate(90deg) translateX(-50%)",bottom:"rotate(180deg)",left:"translateY(50%) rotate(-90deg) translateX(50%)"}[c.placedSide],visibility:c.shouldHideArrow?"hidden":void 0},children:_.jsx(Sk,{...s,ref:o,style:{...s.style,display:"block"}})})});sb.displayName=lb;function Ak(n){return n!==null}var Tk=n=>({name:"transformOrigin",options:n,fn(r){var w,k,A;const{placement:o,rects:l,middlewareData:s}=r,f=((w=s.arrow)==null?void 0:w.centerOffset)!==0,h=f?0:n.arrowWidth,p=f?0:n.arrowHeight,[m,v]=cb(o),b={start:"0%",center:"50%",end:"100%"}[v],E=(((k=s.arrow)==null?void 0:k.x)??0)+h/2,x=(((A=s.arrow)==null?void 0:A.y)??0)+p/2;let z="",g="";return m==="bottom"?(z=f?b:`${E}px`,g=`${-p}px`):m==="top"?(z=f?b:`${E}px`,g=`${l.floating.height+p}px`):m==="right"?(z=`${-p}px`,g=f?b:`${x}px`):m==="left"&&(z=`${l.floating.width+p}px`,g=f?b:`${x}px`),{data:{x:z,y:g}}}});function cb(n){const[r,o="center"]=n.split("-");return[r,o]}var Nk=nb,Ok=ib,jk=ob,Rk=sb,Mk="Label",ub=j.forwardRef((n,r)=>_.jsx(gt.label,{...n,ref:r,onMouseDown:o=>{var s;o.target.closest("button, input, select, textarea")||((s=n.onMouseDown)==null||s.call(n,o),!o.defaultPrevented&&o.detail>1&&o.preventDefault())}}));ub.displayName=Mk;var Dk=ub;function mv(n,[r,o]){return Math.min(o,Math.max(r,n))}var Bk=[" ","Enter","ArrowUp","ArrowDown"],Uk=[" ","Enter"],Sr="Select",[js,Rs,Lk]=Q_(Sr),[Ci]=Es(Sr,[Lk,tb]),Ms=tb(),[Hk,Jn]=Ci(Sr),[Zk,Vk]=Ci(Sr),db=n=>{const{__scopeSelect:r,children:o,open:l,defaultOpen:s,onOpenChange:c,value:f,defaultValue:h,onValueChange:p,dir:m,name:v,autoComplete:b,disabled:E,required:x,form:z}=n,g=Ms(r),[w,k]=j.useState(null),[A,N]=j.useState(null),[R,U]=j.useState(!1),Y=n5(m),[H,I]=_d({prop:l,defaultProp:s??!1,onChange:c,caller:Sr}),[K,se]=_d({prop:f,defaultProp:h,onChange:p,caller:Sr}),ge=j.useRef(null),B=w?z||!!w.closest("form"):!0,[W,C]=j.useState(new Set),ae=Array.from(W).map(V=>V.props.value).join(";");return _.jsx(Nk,{...g,children:_.jsxs(Hk,{required:x,scope:r,trigger:w,onTriggerChange:k,valueNode:A,onValueNodeChange:N,valueNodeHasChildren:R,onValueNodeHasChildrenChange:U,contentId:Qd(),value:K,onValueChange:se,open:H,onOpenChange:I,dir:Y,triggerPointerDownPosRef:ge,disabled:E,children:[_.jsx(js.Provider,{scope:r,children:_.jsx(Zk,{scope:n.__scopeSelect,onNativeOptionAdd:j.useCallback(V=>{C(q=>new Set(q).add(V))},[]),onNativeOptionRemove:j.useCallback(V=>{C(q=>{const Q=new Set(q);return Q.delete(V),Q})},[]),children:o})}),B?_.jsxs(Rb,{"aria-hidden":!0,required:x,tabIndex:-1,name:v,autoComplete:b,value:K,onChange:V=>se(V.target.value),disabled:E,form:z,children:[K===void 0?_.jsx("option",{value:""}):null,Array.from(W)]},ae):null]})})};db.displayName=Sr;var fb="SelectTrigger",hb=j.forwardRef((n,r)=>{const{__scopeSelect:o,disabled:l=!1,...s}=n,c=Ms(o),f=Jn(fb,o),h=f.disabled||l,p=Tt(r,f.onTriggerChange),m=Rs(o),v=j.useRef("touch"),[b,E,x]=Db(g=>{const w=m().filter(N=>!N.disabled),k=w.find(N=>N.value===f.value),A=Bb(w,g,k);A!==void 0&&f.onValueChange(A.value)}),z=g=>{h||(f.onOpenChange(!0),x()),g&&(f.triggerPointerDownPosRef.current={x:Math.round(g.pageX),y:Math.round(g.pageY)})};return _.jsx(Ok,{asChild:!0,...c,children:_.jsx(gt.button,{type:"button",role:"combobox","aria-controls":f.contentId,"aria-expanded":f.open,"aria-required":f.required,"aria-autocomplete":"none",dir:f.dir,"data-state":f.open?"open":"closed",disabled:h,"data-disabled":h?"":void 0,"data-placeholder":Mb(f.value)?"":void 0,...s,ref:p,onClick:_t(s.onClick,g=>{g.currentTarget.focus(),v.current!=="mouse"&&z(g)}),onPointerDown:_t(s.onPointerDown,g=>{v.current=g.pointerType;const w=g.target;w.hasPointerCapture(g.pointerId)&&w.releasePointerCapture(g.pointerId),g.button===0&&g.ctrlKey===!1&&g.pointerType==="mouse"&&(z(g),g.preventDefault())}),onKeyDown:_t(s.onKeyDown,g=>{const w=b.current!=="";!(g.ctrlKey||g.altKey||g.metaKey)&&g.key.length===1&&E(g.key),!(w&&g.key===" ")&&Bk.includes(g.key)&&(z(),g.preventDefault())})})})});hb.displayName=fb;var pb="SelectValue",mb=j.forwardRef((n,r)=>{const{__scopeSelect:o,className:l,style:s,children:c,placeholder:f="",...h}=n,p=Jn(pb,o),{onValueNodeHasChildrenChange:m}=p,v=c!==void 0,b=Tt(r,p.onValueNodeChange);return Gt(()=>{m(v)},[m,v]),_.jsx(gt.span,{...h,ref:b,style:{pointerEvents:"none"},children:Mb(p.value)?_.jsx(_.Fragment,{children:f}):c})});mb.displayName=pb;var qk="SelectIcon",gb=j.forwardRef((n,r)=>{const{__scopeSelect:o,children:l,...s}=n;return _.jsx(gt.span,{"aria-hidden":!0,...s,ref:r,children:l||"▼"})});gb.displayName=qk;var Gk="SelectPortal",vb=n=>_.jsx(_0,{asChild:!0,...n});vb.displayName=Gk;var kr="SelectContent",bb=j.forwardRef((n,r)=>{const o=Jn(kr,n.__scopeSelect),[l,s]=j.useState();if(Gt(()=>{s(new DocumentFragment)},[]),!o.open){const c=l;return c?No.createPortal(_.jsx(yb,{scope:n.__scopeSelect,children:_.jsx(js.Slot,{scope:n.__scopeSelect,children:_.jsx("div",{children:n.children})})}),c):null}return _.jsx(xb,{...n,ref:r})});bb.displayName=kr;var Oa=10,[yb,Wn]=Ci(kr),Yk="SelectContentImpl",Ik=ms("SelectContent.RemoveScroll"),xb=j.forwardRef((n,r)=>{const{__scopeSelect:o,position:l="item-aligned",onCloseAutoFocus:s,onEscapeKeyDown:c,onPointerDownOutside:f,side:h,sideOffset:p,align:m,alignOffset:v,arrowPadding:b,collisionBoundary:E,collisionPadding:x,sticky:z,hideWhenDetached:g,avoidCollisions:w,...k}=n,A=Jn(kr,o),[N,R]=j.useState(null),[U,Y]=j.useState(null),H=Tt(r,he=>R(he)),[I,K]=j.useState(null),[se,ge]=j.useState(null),B=Rs(o),[W,C]=j.useState(!1),ae=j.useRef(!1);j.useEffect(()=>{if(N)return oS(N)},[N]),x5();const V=j.useCallback(he=>{const[Se,...ke]=B().map(Le=>Le.ref.current),[Me]=ke.slice(-1),Re=document.activeElement;for(const Le of he)if(Le===Re||(Le==null||Le.scrollIntoView({block:"nearest"}),Le===Se&&U&&(U.scrollTop=0),Le===Me&&U&&(U.scrollTop=U.scrollHeight),Le==null||Le.focus(),document.activeElement!==Re))return},[B,U]),q=j.useCallback(()=>V([I,N]),[V,I,N]);j.useEffect(()=>{W&&q()},[W,q]);const{onOpenChange:Q,triggerPointerDownPosRef:ne}=A;j.useEffect(()=>{if(N){let he={x:0,y:0};const Se=Me=>{var Re,Le;he={x:Math.abs(Math.round(Me.pageX)-(((Re=ne.current)==null?void 0:Re.x)??0)),y:Math.abs(Math.round(Me.pageY)-(((Le=ne.current)==null?void 0:Le.y)??0))}},ke=Me=>{he.x<=10&&he.y<=10?Me.preventDefault():N.contains(Me.target)||Q(!1),document.removeEventListener("pointermove",Se),ne.current=null};return ne.current!==null&&(document.addEventListener("pointermove",Se),document.addEventListener("pointerup",ke,{capture:!0,once:!0})),()=>{document.removeEventListener("pointermove",Se),document.removeEventListener("pointerup",ke,{capture:!0})}}},[N,Q,ne]),j.useEffect(()=>{const he=()=>Q(!1);return window.addEventListener("blur",he),window.addEventListener("resize",he),()=>{window.removeEventListener("blur",he),window.removeEventListener("resize",he)}},[Q]);const[ve,O]=Db(he=>{const Se=B().filter(Re=>!Re.disabled),ke=Se.find(Re=>Re.ref.current===document.activeElement),Me=Bb(Se,he,ke);Me&&setTimeout(()=>Me.ref.current.focus())}),D=j.useCallback((he,Se,ke)=>{const Me=!ae.current&&!ke;(A.value!==void 0&&A.value===Se||Me)&&(K(he),Me&&(ae.current=!0))},[A.value]),re=j.useCallback(()=>N==null?void 0:N.focus(),[N]),ee=j.useCallback((he,Se,ke)=>{const Me=!ae.current&&!ke;(A.value!==void 0&&A.value===Se||Me)&&ge(he)},[A.value]),le=l==="popper"?Ad:wb,Ee=le===Ad?{side:h,sideOffset:p,align:m,alignOffset:v,arrowPadding:b,collisionBoundary:E,collisionPadding:x,sticky:z,hideWhenDetached:g,avoidCollisions:w}:{};return _.jsx(yb,{scope:o,content:N,viewport:U,onViewportChange:Y,itemRefCallback:D,selectedItem:I,onItemLeave:re,itemTextRefCallback:ee,focusSelectedItem:q,selectedItemText:se,position:l,isPositioned:W,searchRef:ve,children:_.jsx(N0,{as:Ik,allowPinchZoom:!0,children:_.jsx(x0,{asChild:!0,trapped:A.open,onMountAutoFocus:he=>{he.preventDefault()},onUnmountAutoFocus:_t(s,he=>{var Se;(Se=A.trigger)==null||Se.focus({preventScroll:!0}),he.preventDefault()}),children:_.jsx(b0,{asChild:!0,disableOutsidePointerEvents:!0,onEscapeKeyDown:c,onPointerDownOutside:f,onFocusOutside:he=>he.preventDefault(),onDismiss:()=>A.onOpenChange(!1),children:_.jsx(le,{role:"listbox",id:A.contentId,"data-state":A.open?"open":"closed",dir:A.dir,onContextMenu:he=>he.preventDefault(),...k,...Ee,onPlaced:()=>C(!0),ref:H,style:{display:"flex",flexDirection:"column",outline:"none",...k.style},onKeyDown:_t(k.onKeyDown,he=>{const Se=he.ctrlKey||he.altKey||he.metaKey;if(he.key==="Tab"&&he.preventDefault(),!Se&&he.key.length===1&&O(he.key),["ArrowUp","ArrowDown","Home","End"].includes(he.key)){let Me=B().filter(Re=>!Re.disabled).map(Re=>Re.ref.current);if(["ArrowUp","End"].includes(he.key)&&(Me=Me.slice().reverse()),["ArrowUp","ArrowDown"].includes(he.key)){const Re=he.target,Le=Me.indexOf(Re);Me=Me.slice(Le+1)}setTimeout(()=>V(Me)),he.preventDefault()}})})})})})})});xb.displayName=Yk;var Xk="SelectItemAlignedPosition",wb=j.forwardRef((n,r)=>{const{__scopeSelect:o,onPlaced:l,...s}=n,c=Jn(kr,o),f=Wn(kr,o),[h,p]=j.useState(null),[m,v]=j.useState(null),b=Tt(r,H=>v(H)),E=Rs(o),x=j.useRef(!1),z=j.useRef(!0),{viewport:g,selectedItem:w,selectedItemText:k,focusSelectedItem:A}=f,N=j.useCallback(()=>{if(c.trigger&&c.valueNode&&h&&m&&g&&w&&k){const H=c.trigger.getBoundingClientRect(),I=m.getBoundingClientRect(),K=c.valueNode.getBoundingClientRect(),se=k.getBoundingClientRect();if(c.dir!=="rtl"){const Re=se.left-I.left,Le=K.left-Re,st=H.left-Le,S=H.width+st,ue=Math.max(S,I.width),ie=window.innerWidth-Oa,L=mv(Le,[Oa,Math.max(Oa,ie-ue)]);h.style.minWidth=S+"px",h.style.left=L+"px"}else{const Re=I.right-se.right,Le=window.innerWidth-K.right-Re,st=window.innerWidth-H.right-Le,S=H.width+st,ue=Math.max(S,I.width),ie=window.innerWidth-Oa,L=mv(Le,[Oa,Math.max(Oa,ie-ue)]);h.style.minWidth=S+"px",h.style.right=L+"px"}const ge=E(),B=window.innerHeight-Oa*2,W=g.scrollHeight,C=window.getComputedStyle(m),ae=parseInt(C.borderTopWidth,10),V=parseInt(C.paddingTop,10),q=parseInt(C.borderBottomWidth,10),Q=parseInt(C.paddingBottom,10),ne=ae+V+W+Q+q,ve=Math.min(w.offsetHeight*5,ne),O=window.getComputedStyle(g),D=parseInt(O.paddingTop,10),re=parseInt(O.paddingBottom,10),ee=H.top+H.height/2-Oa,le=B-ee,Ee=w.offsetHeight/2,he=w.offsetTop+Ee,Se=ae+V+he,ke=ne-Se;if(Se<=ee){const Re=ge.length>0&&w===ge[ge.length-1].ref.current;h.style.bottom="0px";const Le=m.clientHeight-g.offsetTop-g.offsetHeight,st=Math.max(le,Ee+(Re?re:0)+Le+q),S=Se+st;h.style.height=S+"px"}else{const Re=ge.length>0&&w===ge[0].ref.current;h.style.top="0px";const st=Math.max(ee,ae+g.offsetTop+(Re?D:0)+Ee)+ke;h.style.height=st+"px",g.scrollTop=Se-ee+g.offsetTop}h.style.margin=`${Oa}px 0`,h.style.minHeight=ve+"px",h.style.maxHeight=B+"px",l==null||l(),requestAnimationFrame(()=>x.current=!0)}},[E,c.trigger,c.valueNode,h,m,g,w,k,c.dir,l]);Gt(()=>N(),[N]);const[R,U]=j.useState();Gt(()=>{m&&U(window.getComputedStyle(m).zIndex)},[m]);const Y=j.useCallback(H=>{H&&z.current===!0&&(N(),A==null||A(),z.current=!1)},[N,A]);return _.jsx(Fk,{scope:o,contentWrapper:h,shouldExpandOnScrollRef:x,onScrollButtonChange:Y,children:_.jsx("div",{ref:p,style:{display:"flex",flexDirection:"column",position:"fixed",zIndex:R},children:_.jsx(gt.div,{...s,ref:b,style:{boxSizing:"border-box",maxHeight:"100%",...s.style}})})})});wb.displayName=Xk;var Qk="SelectPopperPosition",Ad=j.forwardRef((n,r)=>{const{__scopeSelect:o,align:l="start",collisionPadding:s=Oa,...c}=n,f=Ms(o);return _.jsx(jk,{...f,...c,ref:r,align:l,collisionPadding:s,style:{boxSizing:"border-box",...c.style,"--radix-select-content-transform-origin":"var(--radix-popper-transform-origin)","--radix-select-content-available-width":"var(--radix-popper-available-width)","--radix-select-content-available-height":"var(--radix-popper-available-height)","--radix-select-trigger-width":"var(--radix-popper-anchor-width)","--radix-select-trigger-height":"var(--radix-popper-anchor-height)"}})});Ad.displayName=Qk;var[Fk,nf]=Ci(kr,{}),Td="SelectViewport",_b=j.forwardRef((n,r)=>{const{__scopeSelect:o,nonce:l,...s}=n,c=Wn(Td,o),f=nf(Td,o),h=Tt(r,c.onViewportChange),p=j.useRef(0);return _.jsxs(_.Fragment,{children:[_.jsx("style",{dangerouslySetInnerHTML:{__html:"[data-radix-select-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-select-viewport]::-webkit-scrollbar{display:none}"},nonce:l}),_.jsx(js.Slot,{scope:o,children:_.jsx(gt.div,{"data-radix-select-viewport":"",role:"presentation",...s,ref:h,style:{position:"relative",flex:1,overflow:"hidden auto",...s.style},onScroll:_t(s.onScroll,m=>{const v=m.currentTarget,{contentWrapper:b,shouldExpandOnScrollRef:E}=f;if(E!=null&&E.current&&b){const x=Math.abs(p.current-v.scrollTop);if(x>0){const z=window.innerHeight-Oa*2,g=parseFloat(b.style.minHeight),w=parseFloat(b.style.height),k=Math.max(g,w);if(k<z){const A=k+x,N=Math.min(z,A),R=A-N;b.style.height=N+"px",b.style.bottom==="0px"&&(v.scrollTop=R>0?R:0,b.style.justifyContent="flex-end")}}}p.current=v.scrollTop})})})]})});_b.displayName=Td;var Sb="SelectGroup",[Kk,Pk]=Ci(Sb),Jk=j.forwardRef((n,r)=>{const{__scopeSelect:o,...l}=n,s=Qd();return _.jsx(Kk,{scope:o,id:s,children:_.jsx(gt.div,{role:"group","aria-labelledby":s,...l,ref:r})})});Jk.displayName=Sb;var kb="SelectLabel",Wk=j.forwardRef((n,r)=>{const{__scopeSelect:o,...l}=n,s=Pk(kb,o);return _.jsx(gt.div,{id:s.id,...l,ref:r})});Wk.displayName=kb;var xs="SelectItem",[$k,Eb]=Ci(xs),zb=j.forwardRef((n,r)=>{const{__scopeSelect:o,value:l,disabled:s=!1,textValue:c,...f}=n,h=Jn(xs,o),p=Wn(xs,o),m=h.value===l,[v,b]=j.useState(c??""),[E,x]=j.useState(!1),z=Tt(r,A=>{var N;return(N=p.itemRefCallback)==null?void 0:N.call(p,A,l,s)}),g=Qd(),w=j.useRef("touch"),k=()=>{s||(h.onValueChange(l),h.onOpenChange(!1))};if(l==="")throw new Error("A <Select.Item /> must have a value prop that is not an empty string. This is because the Select value can be set to an empty string to clear the selection and show the placeholder.");return _.jsx($k,{scope:o,value:l,disabled:s,textId:g,isSelected:m,onItemTextChange:j.useCallback(A=>{b(N=>N||((A==null?void 0:A.textContent)??"").trim())},[]),children:_.jsx(js.ItemSlot,{scope:o,value:l,disabled:s,textValue:v,children:_.jsx(gt.div,{role:"option","aria-labelledby":g,"data-highlighted":E?"":void 0,"aria-selected":m&&E,"data-state":m?"checked":"unchecked","aria-disabled":s||void 0,"data-disabled":s?"":void 0,tabIndex:s?void 0:-1,...f,ref:z,onFocus:_t(f.onFocus,()=>x(!0)),onBlur:_t(f.onBlur,()=>x(!1)),onClick:_t(f.onClick,()=>{w.current!=="mouse"&&k()}),onPointerUp:_t(f.onPointerUp,()=>{w.current==="mouse"&&k()}),onPointerDown:_t(f.onPointerDown,A=>{w.current=A.pointerType}),onPointerMove:_t(f.onPointerMove,A=>{var N;w.current=A.pointerType,s?(N=p.onItemLeave)==null||N.call(p):w.current==="mouse"&&A.currentTarget.focus({preventScroll:!0})}),onPointerLeave:_t(f.onPointerLeave,A=>{var N;A.currentTarget===document.activeElement&&((N=p.onItemLeave)==null||N.call(p))}),onKeyDown:_t(f.onKeyDown,A=>{var R;((R=p.searchRef)==null?void 0:R.current)!==""&&A.key===" "||(Uk.includes(A.key)&&k(),A.key===" "&&A.preventDefault())})})})})});zb.displayName=xs;var Eo="SelectItemText",Cb=j.forwardRef((n,r)=>{const{__scopeSelect:o,className:l,style:s,...c}=n,f=Jn(Eo,o),h=Wn(Eo,o),p=Eb(Eo,o),m=Vk(Eo,o),[v,b]=j.useState(null),E=Tt(r,k=>b(k),p.onItemTextChange,k=>{var A;return(A=h.itemTextRefCallback)==null?void 0:A.call(h,k,p.value,p.disabled)}),x=v==null?void 0:v.textContent,z=j.useMemo(()=>_.jsx("option",{value:p.value,disabled:p.disabled,children:x},p.value),[p.disabled,p.value,x]),{onNativeOptionAdd:g,onNativeOptionRemove:w}=m;return Gt(()=>(g(z),()=>w(z)),[g,w,z]),_.jsxs(_.Fragment,{children:[_.jsx(gt.span,{id:p.textId,...c,ref:E}),p.isSelected&&f.valueNode&&!f.valueNodeHasChildren?No.createPortal(c.children,f.valueNode):null]})});Cb.displayName=Eo;var Ab="SelectItemIndicator",Tb=j.forwardRef((n,r)=>{const{__scopeSelect:o,...l}=n;return Eb(Ab,o).isSelected?_.jsx(gt.span,{"aria-hidden":!0,...l,ref:r}):null});Tb.displayName=Ab;var Nd="SelectScrollUpButton",Nb=j.forwardRef((n,r)=>{const o=Wn(Nd,n.__scopeSelect),l=nf(Nd,n.__scopeSelect),[s,c]=j.useState(!1),f=Tt(r,l.onScrollButtonChange);return Gt(()=>{if(o.viewport&&o.isPositioned){let h=function(){const m=p.scrollTop>0;c(m)};const p=o.viewport;return h(),p.addEventListener("scroll",h),()=>p.removeEventListener("scroll",h)}},[o.viewport,o.isPositioned]),s?_.jsx(jb,{...n,ref:f,onAutoScroll:()=>{const{viewport:h,selectedItem:p}=o;h&&p&&(h.scrollTop=h.scrollTop-p.offsetHeight)}}):null});Nb.displayName=Nd;var Od="SelectScrollDownButton",Ob=j.forwardRef((n,r)=>{const o=Wn(Od,n.__scopeSelect),l=nf(Od,n.__scopeSelect),[s,c]=j.useState(!1),f=Tt(r,l.onScrollButtonChange);return Gt(()=>{if(o.viewport&&o.isPositioned){let h=function(){const m=p.scrollHeight-p.clientHeight,v=Math.ceil(p.scrollTop)<m;c(v)};const p=o.viewport;return h(),p.addEventListener("scroll",h),()=>p.removeEventListener("scroll",h)}},[o.viewport,o.isPositioned]),s?_.jsx(jb,{...n,ref:f,onAutoScroll:()=>{const{viewport:h,selectedItem:p}=o;h&&p&&(h.scrollTop=h.scrollTop+p.offsetHeight)}}):null});Ob.displayName=Od;var jb=j.forwardRef((n,r)=>{const{__scopeSelect:o,onAutoScroll:l,...s}=n,c=Wn("SelectScrollButton",o),f=j.useRef(null),h=Rs(o),p=j.useCallback(()=>{f.current!==null&&(window.clearInterval(f.current),f.current=null)},[]);return j.useEffect(()=>()=>p(),[p]),Gt(()=>{var v;const m=h().find(b=>b.ref.current===document.activeElement);(v=m==null?void 0:m.ref.current)==null||v.scrollIntoView({block:"nearest"})},[h]),_.jsx(gt.div,{"aria-hidden":!0,...s,ref:r,style:{flexShrink:0,...s.style},onPointerDown:_t(s.onPointerDown,()=>{f.current===null&&(f.current=window.setInterval(l,50))}),onPointerMove:_t(s.onPointerMove,()=>{var m;(m=c.onItemLeave)==null||m.call(c),f.current===null&&(f.current=window.setInterval(l,50))}),onPointerLeave:_t(s.onPointerLeave,()=>{p()})})}),e3="SelectSeparator",t3=j.forwardRef((n,r)=>{const{__scopeSelect:o,...l}=n;return _.jsx(gt.div,{"aria-hidden":!0,...l,ref:r})});t3.displayName=e3;var jd="SelectArrow",a3=j.forwardRef((n,r)=>{const{__scopeSelect:o,...l}=n,s=Ms(o),c=Jn(jd,o),f=Wn(jd,o);return c.open&&f.position==="popper"?_.jsx(Rk,{...s,...l,ref:r}):null});a3.displayName=jd;var n3="SelectBubbleInput",Rb=j.forwardRef(({__scopeSelect:n,value:r,...o},l)=>{const s=j.useRef(null),c=Tt(l,s),f=j0(r);return j.useEffect(()=>{const h=s.current;if(!h)return;const p=window.HTMLSelectElement.prototype,v=Object.getOwnPropertyDescriptor(p,"value").set;if(f!==r&&v){const b=new Event("change",{bubbles:!0});v.call(h,r),h.dispatchEvent(b)}},[f,r]),_.jsx(gt.select,{...o,style:{...m0,...o.style},ref:c,defaultValue:r})});Rb.displayName=n3;function Mb(n){return n===""||n===void 0}function Db(n){const r=wr(n),o=j.useRef(""),l=j.useRef(0),s=j.useCallback(f=>{const h=o.current+f;r(h),(function p(m){o.current=m,window.clearTimeout(l.current),m!==""&&(l.current=window.setTimeout(()=>p(""),1e3))})(h)},[r]),c=j.useCallback(()=>{o.current="",window.clearTimeout(l.current)},[]);return j.useEffect(()=>()=>window.clearTimeout(l.current),[]),[o,s,c]}function Bb(n,r,o){const s=r.length>1&&Array.from(r).every(m=>m===r[0])?r[0]:r,c=o?n.indexOf(o):-1;let f=r3(n,Math.max(c,0));s.length===1&&(f=f.filter(m=>m!==o));const p=f.find(m=>m.textValue.toLowerCase().startsWith(s.toLowerCase()));return p!==o?p:void 0}function r3(n,r){return n.map((o,l)=>n[(r+l)%n.length])}var i3=db,o3=hb,l3=mb,s3=gb,c3=vb,u3=bb,d3=_b,f3=zb,h3=Cb,p3=Tb,m3=Nb,g3=Ob;function v3({className:n,...r}){return _.jsx(B0,{"data-slot":"checkbox",className:nt("border-input dark:bg-input/30 data-checked:bg-primary data-checked:text-primary-foreground dark:data-checked:bg-primary data-checked:border-primary aria-invalid:aria-checked:border-primary aria-invalid:border-destructive dark:aria-invalid:border-destructive/50 focus-visible:border-ring focus-visible:ring-ring/50 aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 flex size-4 items-center justify-center rounded-[4px] border transition-colors group-has-disabled/field:opacity-50 focus-visible:ring-3 aria-invalid:ring-3 peer relative shrink-0 outline-none after:absolute after:-inset-x-3 after:-inset-y-2 disabled:cursor-not-allowed disabled:opacity-50",n),...r,children:_.jsx(L0,{"data-slot":"checkbox-indicator",className:"[&>svg]:size-3.5 grid place-content-center text-current transition-none",children:_.jsx($v,{})})})}function So({className:n,...r}){return _.jsx(Dk,{"data-slot":"label",className:nt("gap-2 text-sm leading-none font-medium group-data-[disabled=true]:opacity-50 peer-disabled:opacity-50 flex items-center select-none group-data-[disabled=true]:pointer-events-none peer-disabled:cursor-not-allowed",n),...r})}function gv({...n}){return _.jsx(i3,{"data-slot":"select",...n})}function vv({...n}){return _.jsx(l3,{"data-slot":"select-value",...n})}function bv({className:n,size:r="default",children:o,...l}){return _.jsxs(o3,{"data-slot":"select-trigger","data-size":r,className:nt("border-input data-placeholder:text-muted-foreground dark:bg-input/30 dark:hover:bg-input/50 focus-visible:border-ring focus-visible:ring-ring/50 aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive dark:aria-invalid:border-destructive/50 gap-1.5 rounded-lg border bg-transparent py-2 pr-2 pl-2.5 text-sm transition-colors select-none focus-visible:ring-3 aria-invalid:ring-3 data-[size=default]:h-8 data-[size=sm]:h-7 data-[size=sm]:rounded-[min(var(--radius-md),10px)] *:data-[slot=select-value]:gap-1.5 [&_svg:not([class*='size-'])]:size-4 flex w-full items-center justify-between whitespace-nowrap outline-none disabled:cursor-not-allowed disabled:opacity-50 *:data-[slot=select-value]:line-clamp-1 *:data-[slot=select-value]:flex *:data-[slot=select-value]:items-center [&_svg]:pointer-events-none [&_svg]:shrink-0",n),...l,children:[o,_.jsx(s3,{asChild:!0,children:_.jsx(Vd,{className:"text-muted-foreground size-4 pointer-events-none"})})]})}function yv({className:n,children:r,position:o="popper",align:l="center",...s}){return _.jsx(c3,{children:_.jsxs(u3,{"data-slot":"select-content","data-align-trigger":o==="item-aligned",className:nt("bg-popover text-popover-foreground data-open:animate-in data-closed:animate-out data-closed:fade-out-0 data-open:fade-in-0 data-closed:zoom-out-95 data-open:zoom-in-95 data-[side=bottom]:slide-in-from-top-2 data-[side=left]:slide-in-from-right-2 data-[side=right]:slide-in-from-left-2 data-[side=top]:slide-in-from-bottom-2 ring-foreground/10 min-w-36 rounded-lg shadow-md ring-1 duration-100 relative z-[110] max-h-(--radix-select-content-available-height) origin-(--radix-select-content-transform-origin) overflow-x-hidden overflow-y-auto data-[align-trigger=true]:animate-none",o==="popper"&&"data-[side=bottom]:translate-y-1 data-[side=left]:-translate-x-1 data-[side=right]:translate-x-1 data-[side=top]:-translate-y-1",n),position:o,align:l,...s,children:[_.jsx(b3,{}),_.jsx(d3,{"data-position":o,className:nt("p-1",o==="popper"&&"h-(--radix-select-trigger-height) w-full min-w-(--radix-select-trigger-width)"),children:r}),_.jsx(y3,{})]})})}function xv({className:n,children:r,...o}){return _.jsxs(f3,{"data-slot":"select-item",className:nt("focus:bg-accent focus:text-accent-foreground not-data-[variant=destructive]:focus:**:text-accent-foreground gap-1.5 rounded-md py-1 pr-8 pl-1.5 text-sm [&_svg:not([class*='size-'])]:size-4 *:[span]:last:flex *:[span]:last:items-center *:[span]:last:gap-2 relative flex w-full cursor-default items-center outline-hidden select-none data-disabled:pointer-events-none data-disabled:opacity-50 [&_svg]:pointer-events-none [&_svg]:shrink-0",n),...o,children:[_.jsx("span",{className:"pointer-events-none absolute right-2 flex size-4 items-center justify-center",children:_.jsx(p3,{children:_.jsx($v,{className:"pointer-events-none"})})}),_.jsx(h3,{children:r})]})}function b3({className:n,...r}){return _.jsx(m3,{"data-slot":"select-scroll-up-button",className:nt("bg-popover z-10 flex cursor-default items-center justify-center py-1 [&_svg:not([class*='size-'])]:size-4",n),...r,children:_.jsx(t0,{})})}function y3({className:n,...r}){return _.jsx(g3,{"data-slot":"select-scroll-down-button",className:nt("bg-popover z-10 flex cursor-default items-center justify-center py-1 [&_svg:not([class*='size-'])]:size-4",n),...r,children:_.jsx(Vd,{})})}const wv={"ui:text":({label:n,value:r,onChange:o})=>_.jsxs("div",{className:"grid w-full items-center gap-1.5 mb-4",children:[_.jsx(So,{className:"text-[9px] uppercase font-black tracking-widest text-zinc-500",children:n}),_.jsx(D_,{type:"text",className:"h-7 text-[11px] bg-zinc-900/50 border-zinc-800 focus-visible:ring-blue-600",value:r||"",onChange:l=>o(l.target.value)})]}),"ui:textarea":({label:n,value:r,onChange:o})=>_.jsxs("div",{className:"grid w-full gap-1.5 mb-4",children:[_.jsx(So,{className:"text-[9px] uppercase font-black tracking-widest text-zinc-500",children:n}),_.jsx(B_,{className:"min-h-[80px] text-[11px] bg-zinc-900/50 border-zinc-800 focus-visible:ring-blue-600 resize-none",value:r||"",onChange:l=>o(l.target.value)})]}),"ui:select":({label:n,value:r,onChange:o,options:l=[]})=>_.jsxs("div",{className:"grid w-full gap-1.5 mb-4",children:[_.jsx(So,{className:"text-[9px] uppercase font-black tracking-widest text-zinc-500",children:n}),_.jsxs(gv,{value:r||"",onValueChange:o,children:[_.jsx(bv,{className:"w-full h-7 text-[11px] bg-zinc-900/50 border-zinc-800 focus:ring-blue-600",children:_.jsx(vv,{placeholder:"Select..."})}),_.jsx(yv,{className:"dark",children:l.map(s=>_.jsx(xv,{value:s,className:"text-[11px]",children:s},s))})]})]}),"ui:checkbox":({label:n,value:r,onChange:o})=>_.jsxs("div",{className:"flex items-center space-x-2 mb-4 p-2 rounded border border-zinc-800/50 bg-zinc-900/20",children:[_.jsx(v3,{id:n,checked:!!r,onCheckedChange:l=>o(l===!0)}),_.jsx(So,{htmlFor:n,className:"text-[11px] font-medium cursor-pointer select-none text-zinc-300",children:n})]}),"ui:icon-picker":({label:n,value:r,onChange:o})=>{const l=[{name:"layers",icon:qd},{name:"github",icon:a0},{name:"arrow-right",icon:Jv},{name:"box",icon:Wv},{name:"terminal",icon:i0},{name:"chevron-right",icon:e0},{name:"menu",icon:n0},{name:"x",icon:o0}];return _.jsxs("div",{className:"grid w-full gap-1.5 mb-4",children:[_.jsx(So,{className:"text-[9px] uppercase font-black tracking-widest text-zinc-500",children:n}),_.jsxs(gv,{value:r||"",onValueChange:o,children:[_.jsx(bv,{className:"w-full h-7 text-[11px] bg-zinc-900/50 border-zinc-800 focus:ring-blue-600",children:_.jsx(vv,{placeholder:"Icon..."})}),_.jsx(yv,{className:"dark",children:l.map(s=>_.jsx(xv,{value:s.name,className:"text-[11px]",children:_.jsxs("div",{className:"flex items-center gap-2",children:[_.jsx(s.icon,{size:12,className:"text-zinc-500"}),_.jsx("span",{className:"capitalize",children:s.name})]})},s.name))})]})]})}},Rd=n=>{if(n instanceof Va||n instanceof Ao)return Rd(n._def.innerType);if(n instanceof yt){const r={};for(const o in n.shape)r[o]=Rd(n.shape[o]);return r}return n instanceof za?[]:n instanceof dn?"":n instanceof yi?0:n instanceof us?!1:n instanceof Fn?n._def.values[0]:null},Md=n=>n instanceof Va||n instanceof Ao?Md(n._def.innerType):n,Dd=({schema:n,data:r,onChange:o})=>{const l=n.shape;return _.jsx("div",{className:"space-y-4",children:Object.keys(l).map(s=>{const c=l[s];if(!c)return null;const f=Md(c),h=c.description||"ui:text",p=r[s];if(f instanceof yt){const b=p||{};return _.jsxs("div",{className:"group/obj mb-6 p-4 border border-zinc-800 rounded-lg bg-zinc-900/20 hover:border-zinc-700 transition-colors",children:[_.jsxs("div",{className:"flex items-center gap-2 mb-4",children:[_.jsx("div",{className:"w-1 h-3 bg-blue-500 rounded-full"}),_.jsx("h4",{className:"text-[10px] font-black uppercase text-zinc-400 tracking-widest",children:s})]}),_.jsx(Dd,{schema:f,data:b,onChange:E=>o({...r,[s]:E})})]},s)}if(f instanceof za){const b=Array.isArray(p)?p:[],E=Md(f.element),x=(z,g)=>{if(g<0||g>=b.length)return;const w=[...b],[k]=w.splice(z,1);w.splice(g,0,k),o({...r,[s]:w})};return _.jsxs("div",{className:"mb-8",children:[_.jsxs("div",{className:"flex items-center justify-between mb-3",children:[_.jsxs("label",{className:"text-[10px] font-black uppercase text-zinc-500 tracking-widest",children:[s," (",b.length,")"]}),_.jsxs("button",{type:"button",onClick:()=>{const z=Rd(E);o({...r,[s]:[...b,z]})},className:"flex items-center gap-1 px-2 py-1 bg-blue-600/10 hover:bg-blue-600/20 text-blue-500 rounded text-[10px] font-bold transition-colors",children:[_.jsx(g2,{size:12})," Add Item"]})]}),_.jsx("div",{className:"space-y-2",children:b.map((z,g)=>{const w=z,k=(typeof w.title=="string"?w.title:null)||(typeof w.label=="string"?w.label:null)||(typeof w.name=="string"?w.name:null)||(typeof w.content=="string"?w.content:null)||(typeof w.text=="string"?w.text:null)||`${s} #${g+1}`;return _.jsx(x3,{index:g,isFirst:g===0,isLast:g===b.length-1,label:k,onRemove:()=>{const A=b.filter((N,R)=>R!==g);o({...r,[s]:A})},onMoveUp:()=>x(g,g-1),onMoveDown:()=>x(g,g+1),children:E instanceof yt?_.jsx(Dd,{schema:E,data:w||{},onChange:A=>{const N=[...b];N[g]=A,o({...r,[s]:N})}}):_.jsx("div",{className:"text-[10px] text-red-400",children:"Primitive arrays not supported."})},g)})})]},s)}const m=wv[h]||wv["ui:text"],v=f instanceof Fn?f._def.values:void 0;return _.jsx(m,{label:s,value:p,options:v,onChange:b=>o({...r,[s]:b})},s)})})},x3=({label:n,onRemove:r,onMoveUp:o,onMoveDown:l,isFirst:s,isLast:c,children:f})=>{const[h,p]=Sa.useState(!1);return _.jsxs("div",{className:"border border-zinc-800 rounded-md bg-zinc-900/40 overflow-hidden",children:[_.jsxs("div",{className:"flex items-center justify-between px-3 py-2 bg-zinc-900/60",children:[_.jsx("div",{className:"flex items-center gap-2 flex-1 min-w-0",children:_.jsxs("button",{type:"button",onClick:()=>p(!h),className:"flex items-center gap-2 text-[10px] font-bold text-zinc-300 uppercase tracking-tight truncate",children:[h?_.jsx(t0,{size:12,className:"shrink-0"}):_.jsx(Vd,{size:12,className:"shrink-0"}),_.jsx("span",{className:"truncate",children:n})]})}),_.jsxs("div",{className:"flex items-center gap-1 shrink-0 ml-2",children:[_.jsx("button",{type:"button",disabled:s,onClick:o,className:"text-zinc-500 hover:text-blue-400 disabled:opacity-20 p-1 transition-colors",children:_.jsx(e2,{size:12})}),_.jsx("button",{type:"button",disabled:c,onClick:l,className:"text-zinc-500 hover:text-blue-400 disabled:opacity-20 p-1 transition-colors",children:_.jsx(J1,{size:12})}),_.jsx("div",{className:"w-px h-3 bg-zinc-800 mx-1"}),_.jsx("button",{type:"button",onClick:r,className:"text-zinc-600 hover:text-red-500 transition-colors p-1",children:_.jsx(_2,{size:12})})]})]}),h&&_.jsx("div",{className:"p-4 border-t border-zinc-800 bg-black/20",children:f})]})},w3=()=>_.jsxs("div",{className:"flex flex-col h-full",children:[_.jsxs("div",{className:"flex-1 flex flex-col items-center justify-center p-8 text-center space-y-6",children:[_.jsxs("div",{className:"relative",children:[_.jsx("div",{className:"absolute inset-0 bg-blue-500/20 blur-xl rounded-full"}),_.jsx("div",{className:"relative w-20 h-20 rounded-2xl bg-zinc-900 border border-zinc-800 flex items-center justify-center shadow-2xl",children:_.jsx(qd,{className:"text-zinc-400",size:40,strokeWidth:1.5})})]}),_.jsxs("div",{className:"space-y-2 max-w-[200px]",children:[_.jsx("h3",{className:"text-sm font-semibold text-zinc-100",children:"Welcome to Studio"}),_.jsx("p",{className:"text-xs text-zinc-500 leading-relaxed",children:"The canvas is ready. Select an element to begin editing."})]})]}),_.jsxs("div",{className:"p-6 border-t border-zinc-800/50 bg-zinc-900/20",children:[_.jsx("h4",{className:"text-[10px] font-bold uppercase tracking-widest text-zinc-600 mb-4",children:"How it works"}),_.jsxs("ul",{className:"space-y-4",children:[_.jsxs("li",{className:"flex items-start gap-3 group",children:[_.jsx("div",{className:"mt-0.5 p-1.5 rounded-md bg-zinc-900 border border-zinc-800 text-zinc-500 group-hover:text-blue-400 group-hover:border-blue-500/30 transition-colors",children:_.jsx(p2,{size:14})}),_.jsxs("div",{children:[_.jsx("p",{className:"text-xs font-medium text-zinc-300",children:"Select"}),_.jsx("p",{className:"text-[10px] text-zinc-500",children:"Click any section on the stage."})]})]}),_.jsxs("li",{className:"flex items-start gap-3 group",children:[_.jsx("div",{className:"mt-0.5 p-1.5 rounded-md bg-zinc-900 border border-zinc-800 text-zinc-500 group-hover:text-blue-400 group-hover:border-blue-500/30 transition-colors",children:_.jsx(y2,{size:14})}),_.jsxs("div",{children:[_.jsx("p",{className:"text-xs font-medium text-zinc-300",children:"Edit"}),_.jsx("p",{className:"text-[10px] text-zinc-500",children:"Tweak content and settings."})]})]}),_.jsxs("li",{className:"flex items-start gap-3 group",children:[_.jsx("div",{className:"mt-0.5 p-1.5 rounded-md bg-zinc-900 border border-zinc-800 text-zinc-500 group-hover:text-blue-400 group-hover:border-blue-500/30 transition-colors",children:_.jsx(r0,{size:14})}),_.jsxs("div",{children:[_.jsx("p",{className:"text-xs font-medium text-zinc-300",children:"Save"}),_.jsx("p",{className:"text-[10px] text-zinc-500",children:"Persist changes to JSON."})]})]})]})]})]}),_3=({selectedSection:n,pageData:r,onUpdate:o,onClose:l})=>{if(!n)return _.jsxs("aside",{className:"relative w-80 h-screen bg-zinc-950 border-l border-zinc-800 flex flex-col shadow-2xl shrink-0",children:[_.jsx("div",{className:"p-4 border-b border-zinc-800 flex justify-between items-center bg-zinc-900/50",children:_.jsxs("div",{children:[_.jsx("h3",{className:"text-sm font-bold text-white",children:"Inspector"}),_.jsx("p",{className:"text-[10px] font-mono text-zinc-500 uppercase tracking-wider",children:"Waiting for Selection..."})]})}),_.jsx(w3,{})]});const s=r.sections.find(h=>h.id===n.id),c=n.type,f=M_[c];return _.jsxs("aside",{className:"relative w-80 h-screen bg-zinc-950 border-l border-zinc-800 flex flex-col shadow-2xl shrink-0 animate-in slide-in-from-right duration-300",children:[_.jsxs("div",{className:"p-4 border-b border-zinc-800 flex justify-between items-center bg-zinc-900/50",children:[_.jsxs("div",{children:[_.jsx("h3",{className:"text-sm font-bold text-white",children:"Inspector"}),_.jsxs("p",{className:"text-[10px] font-mono text-blue-400 uppercase tracking-wider",children:[n.type," ",_.jsx("span",{className:"text-zinc-600",children:"|"})," ",n.scope]})]}),_.jsx("button",{onClick:l,className:"text-zinc-500 hover:text-white transition-colors p-1 hover:bg-zinc-800 rounded",children:"✕"})]}),_.jsx("div",{className:"flex-1 overflow-y-auto p-6 custom-scrollbar",children:f?_.jsx(Dd,{schema:f,data:(s==null?void 0:s.data)||{},onChange:h=>o(h)}):_.jsxs("div",{className:"text-xs text-red-400 p-4 border border-dashed border-red-900/30 rounded bg-red-900/10",children:["No schema found for ",n.type]})}),_.jsx("div",{className:"p-4 border-t border-zinc-800 bg-zinc-900/50",children:_.jsxs("button",{className:"w-full bg-blue-600 hover:bg-blue-500 text-white text-xs font-bold py-2.5 rounded shadow-lg shadow-blue-900/20 transition-all active:scale-[0.98] flex items-center justify-center gap-2",children:[_.jsx(r0,{size:14}),"Save Changes"]})})]})},S3=({hasChanges:n,onExportJSON:r,onExportHTML:o})=>_.jsxs("div",{className:"h-14 border-b border-zinc-800 bg-zinc-950 flex items-center justify-between px-6 shrink-0 z-50 relative",children:[_.jsx("div",{className:"flex items-center gap-3",children:_.jsxs("div",{className:"flex items-center gap-2",children:[_.jsx("div",{className:nt("w-2 h-2 rounded-full transition-colors duration-300",n?"bg-amber-500 shadow-[0_0_8px_rgba(245,158,11,0.5)]":"bg-emerald-500")}),_.jsx("span",{className:nt("text-xs font-medium transition-colors duration-300",n?"text-amber-500":"text-zinc-500"),children:n?"Unsaved Changes":"All Changes Saved"})]})}),_.jsx("div",{className:"absolute left-1/2 -translate-x-1/2 opacity-20 pointer-events-none",children:_.jsx("span",{className:"text-xs font-black tracking-[0.2em] text-zinc-100",children:"JSONPAGES STUDIO"})}),_.jsxs("div",{className:"flex items-center gap-2",children:[_.jsxs("button",{onClick:o,disabled:!n,className:nt("flex items-center gap-2 px-3 py-1.5 rounded-md text-xs font-medium transition-all border",n?"bg-zinc-900 border-zinc-700 text-zinc-200 hover:bg-zinc-800 hover:border-zinc-600":"bg-transparent border-transparent text-zinc-600 cursor-not-allowed"),children:[_.jsx(l2,{size:14}),_.jsx("span",{children:"Bake HTML"})]}),_.jsxs("button",{onClick:r,disabled:!n,className:nt("flex items-center gap-2 px-4 py-1.5 rounded-md text-xs font-bold transition-all shadow-lg",n?"bg-blue-600 text-white hover:bg-blue-500 shadow-blue-900/20":"bg-zinc-900 text-zinc-600 cursor-not-allowed"),children:[_.jsx(c2,{size:14}),_.jsx("span",{children:"Export JSON"})]})]})]}),k3="JsonPages Landing",E3={colors:{primary:"#3b82f6",secondary:"#22d3ee",accent:"#60a5fa",background:"#060d1b",surface:"#0b1529",surfaceAlt:"#101e38",text:"#e2e8f0",textMuted:"#94a3b8",border:"#162a4d"},typography:{fontFamily:{primary:"'Instrument Sans', system-ui, sans-serif",mono:"'JetBrains Mono', monospace",display:"'Playfair Display', Georgia, serif"}},borderRadius:{sm:"5px",md:"7px",lg:"8px"}},Ub={name:k3,tokens:E3},z3=({draft:n,globalDraft:r,slug:o,selectedId:l})=>{const s=j.useRef(null),c=j.useCallback(()=>{var f;(f=s.current)!=null&&f.contentWindow&&s.current.contentWindow.postMessage({type:ka.UPDATE_DRAFTS,draft:n,globalDraft:r,themeConfig:Ub},"*")},[n,r]);return j.useEffect(()=>{c()},[c]),j.useEffect(()=>{const f=h=>{h.data.type===ka.STAGE_READY&&c()};return window.addEventListener("message",f),()=>window.removeEventListener("message",f)},[c]),j.useEffect(()=>{var f;(f=s.current)!=null&&f.contentWindow&&s.current.contentWindow.postMessage({type:ka.SYNC_SELECTION,selectedId:l},"*")},[l]),_.jsx("div",{className:"w-full h-full bg-background overflow-hidden",children:_.jsx("iframe",{ref:s,src:`/admin/preview/${o}`,className:"w-full h-full border-none",title:"JsonPages Stage"})})},C3=()=>{const[n,r]=j.useState(null),[o,l]=j.useState(null),[s,c]=j.useState(null),[f,h]=j.useState(!1);if(j.useEffect(()=>{const m=v=>{v.data.type===ka.UPDATE_DRAFTS&&(r(v.data.draft),l(v.data.globalDraft),v.data.themeConfig&&Id.setTheme(v.data.themeConfig)),v.data.type===ka.SYNC_SELECTION&&c(v.data.selectedId),v.data.type===ka.REQUEST_CLEAN_HTML&&(h(!0),setTimeout(()=>{const b=document.documentElement.outerHTML;window.parent.postMessage({type:ka.SEND_CLEAN_HTML,html:b},"*"),h(!1)},50))};return window.addEventListener("message",m),window.parent.postMessage({type:ka.STAGE_READY},"*"),()=>window.removeEventListener("message",m)},[]),!n||!o)return _.jsx("div",{className:"flex items-center justify-center h-screen w-full bg-zinc-950 text-zinc-500 font-mono text-xs uppercase tracking-widest animate-pulse",children:"Waiting for Studio Signal..."});const p={main:o.header.data.links||[]};return _.jsx(Yd,{mode:f?"visitor":"studio",children:_.jsx("div",{className:f?"":"jp-ice-active",children:_.jsx(s0,{pageConfig:n,siteConfig:o,menuConfig:p,selectedId:f?null:s})})})},A3=`/*! tailwindcss v4.1.18 | MIT License | https://tailwindcss.com */@layer properties{@supports (((-webkit-hyphens:none)) and (not (margin-trim:inline))) or ((-moz-orient:inline) and (not (color:rgb(from red r g b)))){*,:before,:after,::backdrop{--tw-translate-x:0;--tw-translate-y:0;--tw-translate-z:0;--tw-space-y-reverse:0;--tw-space-x-reverse:0;--tw-border-style:solid;--tw-gradient-position:initial;--tw-gradient-from:#0000;--tw-gradient-via:#0000;--tw-gradient-to:#0000;--tw-gradient-stops:initial;--tw-gradient-via-stops:initial;--tw-gradient-from-position:0%;--tw-gradient-via-position:50%;--tw-gradient-to-position:100%;--tw-leading:initial;--tw-font-weight:initial;--tw-tracking:initial;--tw-shadow:0 0 #0000;--tw-shadow-color:initial;--tw-shadow-alpha:100%;--tw-inset-shadow:0 0 #0000;--tw-inset-shadow-color:initial;--tw-inset-shadow-alpha:100%;--tw-ring-color:initial;--tw-ring-shadow:0 0 #0000;--tw-inset-ring-color:initial;--tw-inset-ring-shadow:0 0 #0000;--tw-ring-inset:initial;--tw-ring-offset-width:0px;--tw-ring-offset-color:#fff;--tw-ring-offset-shadow:0 0 #0000;--tw-blur:initial;--tw-brightness:initial;--tw-contrast:initial;--tw-grayscale:initial;--tw-hue-rotate:initial;--tw-invert:initial;--tw-opacity:initial;--tw-saturate:initial;--tw-sepia:initial;--tw-drop-shadow:initial;--tw-drop-shadow-color:initial;--tw-drop-shadow-alpha:100%;--tw-drop-shadow-size:initial;--tw-backdrop-blur:initial;--tw-backdrop-brightness:initial;--tw-backdrop-contrast:initial;--tw-backdrop-grayscale:initial;--tw-backdrop-hue-rotate:initial;--tw-backdrop-invert:initial;--tw-backdrop-opacity:initial;--tw-backdrop-saturate:initial;--tw-backdrop-sepia:initial;--tw-duration:initial;--tw-content:""}}}@layer theme{:root,:host{--font-sans:ui-sans-serif,system-ui,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";--font-mono:var(--theme-font-mono);--color-red-400:oklch(70.4% .191 22.216);--color-red-500:oklch(63.7% .237 25.331);--color-red-900:oklch(39.6% .141 25.723);--color-amber-500:oklch(76.9% .188 70.08);--color-emerald-500:oklch(69.6% .17 162.48);--color-blue-400:oklch(70.7% .165 254.624);--color-blue-500:oklch(62.3% .214 259.815);--color-blue-600:oklch(54.6% .245 262.881);--color-blue-900:oklch(37.9% .146 265.522);--color-zinc-100:oklch(96.7% .001 286.375);--color-zinc-200:oklch(92% .004 286.32);--color-zinc-300:oklch(87.1% .006 286.286);--color-zinc-400:oklch(70.5% .015 286.067);--color-zinc-500:oklch(55.2% .016 285.938);--color-zinc-600:oklch(44.2% .017 285.786);--color-zinc-700:oklch(37% .013 285.805);--color-zinc-800:oklch(27.4% .006 286.033);--color-zinc-900:oklch(21% .006 285.885);--color-zinc-950:oklch(14.1% .005 285.823);--color-black:#000;--color-white:#fff;--spacing:.25rem;--container-4xl:56rem;--text-xs:.75rem;--text-xs--line-height:calc(1/.75);--text-sm:.875rem;--text-sm--line-height:calc(1.25/.875);--text-base:1rem;--text-base--line-height: 1.5 ;--text-lg:1.125rem;--text-lg--line-height:calc(1.75/1.125);--text-xl:1.25rem;--text-xl--line-height:calc(1.75/1.25);--text-2xl:1.5rem;--text-2xl--line-height:calc(2/1.5);--text-3xl:1.875rem;--text-3xl--line-height: 1.2 ;--text-4xl:2.25rem;--text-4xl--line-height:calc(2.5/2.25);--text-6xl:3.75rem;--text-6xl--line-height:1;--font-weight-normal:400;--font-weight-medium:500;--font-weight-semibold:600;--font-weight-bold:700;--font-weight-extrabold:800;--font-weight-black:900;--tracking-tight:-.025em;--tracking-wide:.025em;--tracking-wider:.05em;--tracking-widest:.1em;--leading-relaxed:1.625;--radius-md:calc(var(--radius) - 2px);--radius-lg:var(--radius);--radius-xl:.75rem;--radius-2xl:1rem;--animate-pulse:pulse 2s cubic-bezier(.4,0,.6,1)infinite;--blur-xl:24px;--default-transition-duration:.15s;--default-transition-timing-function:cubic-bezier(.4,0,.2,1);--default-font-family:var(--font-sans);--default-mono-font-family:var(--font-mono);--color-background:var(--background);--color-foreground:var(--foreground);--color-primary:var(--primary);--color-primary-foreground:var(--primary-foreground);--color-secondary:var(--secondary);--color-muted-foreground:var(--muted-foreground);--color-accent:var(--accent);--color-border:var(--border);--font-primary:var(--theme-font-primary);--font-display:var(--theme-font-display,"Playfair Display",Georgia,serif)}}@layer base{*,:after,:before,::backdrop{box-sizing:border-box;border:0 solid;margin:0;padding:0}::file-selector-button{box-sizing:border-box;border:0 solid;margin:0;padding:0}html,:host{-webkit-text-size-adjust:100%;-moz-tab-size:4;tab-size:4;line-height:1.5;font-family:var(--default-font-family,ui-sans-serif,system-ui,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji");font-feature-settings:var(--default-font-feature-settings,normal);font-variation-settings:var(--default-font-variation-settings,normal);-webkit-tap-highlight-color:transparent}hr{height:0;color:inherit;border-top-width:1px}abbr:where([title]){-webkit-text-decoration:underline dotted;text-decoration:underline dotted}h1,h2,h3,h4,h5,h6{font-size:inherit;font-weight:inherit}a{color:inherit;-webkit-text-decoration:inherit;text-decoration:inherit}b,strong{font-weight:bolder}code,kbd,samp,pre{font-family:var(--default-mono-font-family,ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,"Liberation Mono","Courier New",monospace);font-feature-settings:var(--default-mono-font-feature-settings,normal);font-variation-settings:var(--default-mono-font-variation-settings,normal);font-size:1em}small{font-size:80%}sub,sup{vertical-align:baseline;font-size:75%;line-height:0;position:relative}sub{bottom:-.25em}sup{top:-.5em}table{text-indent:0;border-color:inherit;border-collapse:collapse}:-moz-focusring{outline:auto}progress{vertical-align:baseline}summary{display:list-item}ol,ul,menu{list-style:none}img,svg,video,canvas,audio,iframe,embed,object{vertical-align:middle;display:block}img,video{max-width:100%;height:auto}button,input,select,optgroup,textarea{font:inherit;font-feature-settings:inherit;font-variation-settings:inherit;letter-spacing:inherit;color:inherit;opacity:1;background-color:#0000;border-radius:0}::file-selector-button{font:inherit;font-feature-settings:inherit;font-variation-settings:inherit;letter-spacing:inherit;color:inherit;opacity:1;background-color:#0000;border-radius:0}:where(select:is([multiple],[size])) optgroup{font-weight:bolder}:where(select:is([multiple],[size])) optgroup option{padding-inline-start:20px}::file-selector-button{margin-inline-end:4px}::placeholder{opacity:1}@supports (not ((-webkit-appearance:-apple-pay-button))) or (contain-intrinsic-size:1px){::placeholder{color:currentColor}@supports (color:color-mix(in lab,red,red)){::placeholder{color:color-mix(in oklab,currentcolor 50%,transparent)}}}textarea{resize:vertical}::-webkit-search-decoration{-webkit-appearance:none}::-webkit-date-and-time-value{min-height:1lh;text-align:inherit}::-webkit-datetime-edit{display:inline-flex}::-webkit-datetime-edit-fields-wrapper{padding:0}::-webkit-datetime-edit{padding-block:0}::-webkit-datetime-edit-year-field{padding-block:0}::-webkit-datetime-edit-month-field{padding-block:0}::-webkit-datetime-edit-day-field{padding-block:0}::-webkit-datetime-edit-hour-field{padding-block:0}::-webkit-datetime-edit-minute-field{padding-block:0}::-webkit-datetime-edit-second-field{padding-block:0}::-webkit-datetime-edit-millisecond-field{padding-block:0}::-webkit-datetime-edit-meridiem-field{padding-block:0}::-webkit-calendar-picker-indicator{line-height:1}:-moz-ui-invalid{box-shadow:none}button,input:where([type=button],[type=reset],[type=submit]){-webkit-appearance:button;-moz-appearance:button;appearance:button}::file-selector-button{-webkit-appearance:button;-moz-appearance:button;appearance:button}::-webkit-inner-spin-button{height:auto}::-webkit-outer-spin-button{height:auto}[hidden]:where(:not([hidden=until-found])){display:none!important}*{border-color:var(--border)}body{background-color:var(--background);color:var(--foreground);font-family:var(--font-primary);-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale;line-height:1.7;overflow-x:hidden}}@layer components;@layer utilities{.pointer-events-none{pointer-events:none}.absolute{position:absolute}.relative{position:relative}.static{position:static}.sticky{position:sticky}.inset-0{inset:calc(var(--spacing)*0)}.-top-3{top:calc(var(--spacing)*-3)}.-top-\\[40\\%\\]{top:-40%}.top-0{top:calc(var(--spacing)*0)}.top-1\\/2{top:50%}.-right-\\[20\\%\\]{right:-20%}.right-0{right:calc(var(--spacing)*0)}.right-2{right:calc(var(--spacing)*2)}.-bottom-\\[10\\%\\]{bottom:-10%}.bottom-0{bottom:calc(var(--spacing)*0)}.-left-\\[10\\%\\]{left:-10%}.left-0{left:calc(var(--spacing)*0)}.left-1\\/2{left:50%}.z-0{z-index:0}.z-10{z-index:10}.z-50{z-index:50}.z-\\[2\\]{z-index:2}.z-\\[50\\]{z-index:50}.z-\\[60\\]{z-index:60}.z-\\[70\\]{z-index:70}.z-\\[110\\]{z-index:110}.container{width:100%}@media(min-width:40rem){.container{max-width:40rem}}@media(min-width:48rem){.container{max-width:48rem}}@media(min-width:64rem){.container{max-width:64rem}}@media(min-width:80rem){.container{max-width:80rem}}@media(min-width:96rem){.container{max-width:96rem}}.m-0{margin:calc(var(--spacing)*0)}.m-4{margin:calc(var(--spacing)*4)}.-mx-1{margin-inline:calc(var(--spacing)*-1)}.mx-1{margin-inline:calc(var(--spacing)*1)}.mx-auto{margin-inline:auto}.my-1{margin-block:calc(var(--spacing)*1)}.my-8{margin-block:calc(var(--spacing)*8)}.mt-0\\.5{margin-top:calc(var(--spacing)*.5)}.mt-2{margin-top:calc(var(--spacing)*2)}.mt-4{margin-top:calc(var(--spacing)*4)}.mt-12{margin-top:calc(var(--spacing)*12)}.mt-14{margin-top:calc(var(--spacing)*14)}.mt-16{margin-top:calc(var(--spacing)*16)}.mr-2{margin-right:calc(var(--spacing)*2)}.mb-1{margin-bottom:calc(var(--spacing)*1)}.mb-1\\.5{margin-bottom:calc(var(--spacing)*1.5)}.mb-2{margin-bottom:calc(var(--spacing)*2)}.mb-3{margin-bottom:calc(var(--spacing)*3)}.mb-4{margin-bottom:calc(var(--spacing)*4)}.mb-5{margin-bottom:calc(var(--spacing)*5)}.mb-6{margin-bottom:calc(var(--spacing)*6)}.mb-8{margin-bottom:calc(var(--spacing)*8)}.mb-10{margin-bottom:calc(var(--spacing)*10)}.mb-16{margin-bottom:calc(var(--spacing)*16)}.ml-2{margin-left:calc(var(--spacing)*2)}.ml-3{margin-left:calc(var(--spacing)*3)}.block{display:block}.flex{display:flex}.grid{display:grid}.hidden{display:none}.inline-block{display:inline-block}.inline-flex{display:inline-flex}.field-sizing-content{field-sizing:content}.size-4{width:calc(var(--spacing)*4);height:calc(var(--spacing)*4)}.h-\\(--radix-select-trigger-height\\){height:var(--radix-select-trigger-height)}.h-1\\.5{height:calc(var(--spacing)*1.5)}.h-2{height:calc(var(--spacing)*2)}.h-2\\.5{height:calc(var(--spacing)*2.5)}.h-3{height:calc(var(--spacing)*3)}.h-7{height:calc(var(--spacing)*7)}.h-8{height:calc(var(--spacing)*8)}.h-9{height:calc(var(--spacing)*9)}.h-10{height:calc(var(--spacing)*10)}.h-12{height:calc(var(--spacing)*12)}.h-14{height:calc(var(--spacing)*14)}.h-20{height:calc(var(--spacing)*20)}.h-\\[3px\\]{height:3px}.h-\\[50vw\\]{height:50vw}.h-\\[60vw\\]{height:60vw}.h-\\[70vw\\]{height:70vw}.h-\\[360px\\]{height:360px}.h-full{height:100%}.h-px{height:1px}.h-screen{height:100vh}.max-h-\\(--radix-select-content-available-height\\){max-height:var(--radix-select-content-available-height)}.min-h-16{min-height:calc(var(--spacing)*16)}.min-h-\\[80px\\]{min-height:80px}.min-h-screen{min-height:100vh}.w-1{width:calc(var(--spacing)*1)}.w-1\\.5{width:calc(var(--spacing)*1.5)}.w-2{width:calc(var(--spacing)*2)}.w-2\\.5{width:calc(var(--spacing)*2.5)}.w-5{width:calc(var(--spacing)*5)}.w-6{width:calc(var(--spacing)*6)}.w-8{width:calc(var(--spacing)*8)}.w-9{width:calc(var(--spacing)*9)}.w-10{width:calc(var(--spacing)*10)}.w-12{width:calc(var(--spacing)*12)}.w-20{width:calc(var(--spacing)*20)}.w-80{width:calc(var(--spacing)*80)}.w-\\[50vw\\]{width:50vw}.w-\\[60vw\\]{width:60vw}.w-\\[70vw\\]{width:70vw}.w-\\[80\\%\\]{width:80%}.w-full{width:100%}.w-px{width:1px}.w-screen{width:100vw}.max-w-4xl{max-width:var(--container-4xl)}.max-w-\\[200px\\]{max-width:200px}.max-w-\\[560px\\]{max-width:560px}.max-w-\\[600px\\]{max-width:600px}.max-w-\\[740px\\]{max-width:740px}.max-w-\\[760px\\]{max-width:760px}.max-w-\\[820px\\]{max-width:820px}.max-w-\\[1200px\\]{max-width:1200px}.min-w-\\(--radix-select-trigger-width\\){min-width:var(--radix-select-trigger-width)}.min-w-0{min-width:calc(var(--spacing)*0)}.min-w-36{min-width:calc(var(--spacing)*36)}.flex-1{flex:1}.shrink-0{flex-shrink:0}.origin-\\(--radix-select-content-transform-origin\\){transform-origin:var(--radix-select-content-transform-origin)}.-translate-x-1\\/2{--tw-translate-x: -50% ;translate:var(--tw-translate-x)var(--tw-translate-y)}.-translate-y-1\\/2{--tw-translate-y: -50% ;translate:var(--tw-translate-x)var(--tw-translate-y)}.animate-pulse{animation:var(--animate-pulse)}.cursor-default{cursor:default}.cursor-not-allowed{cursor:not-allowed}.cursor-pointer{cursor:pointer}.resize-none{resize:none}.scroll-my-1{scroll-margin-block:calc(var(--spacing)*1)}.grid-cols-1{grid-template-columns:repeat(1,minmax(0,1fr))}.flex-col{flex-direction:column}.flex-wrap{flex-wrap:wrap}.place-content-center{place-content:center}.items-center{align-items:center}.items-start{align-items:flex-start}.justify-between{justify-content:space-between}.justify-center{justify-content:center}.gap-1{gap:calc(var(--spacing)*1)}.gap-1\\.5{gap:calc(var(--spacing)*1.5)}.gap-2{gap:calc(var(--spacing)*2)}.gap-2\\.5{gap:calc(var(--spacing)*2.5)}.gap-3{gap:calc(var(--spacing)*3)}.gap-4{gap:calc(var(--spacing)*4)}.gap-6{gap:calc(var(--spacing)*6)}.gap-10{gap:calc(var(--spacing)*10)}.gap-12{gap:calc(var(--spacing)*12)}.gap-16{gap:calc(var(--spacing)*16)}:where(.space-y-0>:not(:last-child)){--tw-space-y-reverse:0;margin-block-start:calc(calc(var(--spacing)*0)*var(--tw-space-y-reverse));margin-block-end:calc(calc(var(--spacing)*0)*calc(1 - var(--tw-space-y-reverse)))}:where(.space-y-2>:not(:last-child)){--tw-space-y-reverse:0;margin-block-start:calc(calc(var(--spacing)*2)*var(--tw-space-y-reverse));margin-block-end:calc(calc(var(--spacing)*2)*calc(1 - var(--tw-space-y-reverse)))}:where(.space-y-4>:not(:last-child)){--tw-space-y-reverse:0;margin-block-start:calc(calc(var(--spacing)*4)*var(--tw-space-y-reverse));margin-block-end:calc(calc(var(--spacing)*4)*calc(1 - var(--tw-space-y-reverse)))}:where(.space-y-6>:not(:last-child)){--tw-space-y-reverse:0;margin-block-start:calc(calc(var(--spacing)*6)*var(--tw-space-y-reverse));margin-block-end:calc(calc(var(--spacing)*6)*calc(1 - var(--tw-space-y-reverse)))}:where(.space-x-2>:not(:last-child)){--tw-space-x-reverse:0;margin-inline-start:calc(calc(var(--spacing)*2)*var(--tw-space-x-reverse));margin-inline-end:calc(calc(var(--spacing)*2)*calc(1 - var(--tw-space-x-reverse)))}.truncate{text-overflow:ellipsis;white-space:nowrap;overflow:hidden}.overflow-auto{overflow:auto}.overflow-hidden{overflow:hidden}.overflow-x-auto{overflow-x:auto}.overflow-x-hidden{overflow-x:hidden}.overflow-y-auto{overflow-y:auto}.rounded{border-radius:.25rem}.rounded-2xl{border-radius:var(--radius-2xl)}.rounded-\\[4px\\]{border-radius:4px}.rounded-\\[5px\\]{border-radius:5px}.rounded-\\[7px\\]{border-radius:7px}.rounded-\\[var\\(--local-radius-lg\\)\\]{border-radius:var(--local-radius-lg)}.rounded-\\[var\\(--local-radius-md\\)\\]{border-radius:var(--local-radius-md)}.rounded-full{border-radius:3.40282e38px}.rounded-lg{border-radius:var(--radius-lg)}.rounded-md{border-radius:var(--radius-md)}.rounded-xl{border-radius:var(--radius-xl)}.border{border-style:var(--tw-border-style);border-width:1px}.border-2{border-style:var(--tw-border-style);border-width:2px}.border-t{border-top-style:var(--tw-border-style);border-top-width:1px}.border-b{border-bottom-style:var(--tw-border-style);border-bottom-width:1px}.border-l{border-left-style:var(--tw-border-style);border-left-width:1px}.border-dashed{--tw-border-style:dashed;border-style:dashed}.border-none{--tw-border-style:none;border-style:none}.border-solid{--tw-border-style:solid;border-style:solid}.border-\\[rgba\\(34\\,197\\,94\\,0\\.2\\)\\]{border-color:#22c55e33}.border-\\[rgba\\(34\\,197\\,94\\,0\\.3\\)\\]{border-color:#22c55e4d}.border-\\[rgba\\(59\\,130\\,246\\,0\\.2\\)\\]{border-color:#3b82f633}.border-\\[rgba\\(59\\,130\\,246\\,0\\.3\\)\\]{border-color:#3b82f64d}.border-\\[rgba\\(239\\,68\\,68\\,0\\.3\\)\\]{border-color:#ef44444d}.border-\\[rgba\\(245\\,158\\,11\\,0\\.3\\)\\]{border-color:#f59e0b4d}.border-\\[rgba\\(255\\,255\\,255\\,0\\.1\\)\\]{border-color:#ffffff1a}.border-\\[rgba\\(255\\,255\\,255\\,0\\.04\\)\\]{border-color:#ffffff0a}.border-\\[rgba\\(255\\,255\\,255\\,0\\.06\\)\\]{border-color:#ffffff0f}.border-\\[rgba\\(255\\,255\\,255\\,0\\.08\\)\\]{border-color:#ffffff14}.border-\\[rgba\\(255\\,255\\,255\\,0\\.12\\)\\]{border-color:#ffffff1f}.border-\\[var\\(--local-border\\)\\]{border-color:var(--local-border)}.border-blue-600{border-color:var(--color-blue-600)}.border-red-500\\/20{border-color:#fb2c3633}@supports (color:color-mix(in lab,red,red)){.border-red-500\\/20{border-color:color-mix(in oklab,var(--color-red-500)20%,transparent)}}.border-red-900\\/30{border-color:#82181a4d}@supports (color:color-mix(in lab,red,red)){.border-red-900\\/30{border-color:color-mix(in oklab,var(--color-red-900)30%,transparent)}}.border-transparent{border-color:#0000}.border-zinc-700{border-color:var(--color-zinc-700)}.border-zinc-800{border-color:var(--color-zinc-800)}.border-zinc-800\\/50{border-color:#27272a80}@supports (color:color-mix(in lab,red,red)){.border-zinc-800\\/50{border-color:color-mix(in oklab,var(--color-zinc-800)50%,transparent)}}.bg-\\[\\#3b82f6\\]{background-color:#3b82f6}.bg-\\[\\#22c55e\\]{background-color:#22c55e}.bg-\\[\\#ef4444\\]{background-color:#ef4444}.bg-\\[\\#f59e0b\\]{background-color:#f59e0b}.bg-\\[rgba\\(34\\,197\\,94\\,0\\.08\\)\\]{background-color:#22c55e14}.bg-\\[rgba\\(34\\,211\\,238\\,0\\.1\\)\\]{background-color:#22d3ee1a}.bg-\\[rgba\\(59\\,130\\,246\\,0\\.1\\)\\]{background-color:#3b82f61a}.bg-\\[rgba\\(59\\,130\\,246\\,0\\.6\\)\\]{background-color:#3b82f699}.bg-\\[rgba\\(59\\,130\\,246\\,0\\.08\\)\\]{background-color:#3b82f614}.bg-\\[rgba\\(59\\,130\\,246\\,0\\.35\\)\\]{background-color:#3b82f659}.bg-\\[rgba\\(168\\,85\\,247\\,0\\.1\\)\\]{background-color:#a855f71a}.bg-\\[rgba\\(239\\,68\\,68\\,0\\.08\\)\\]{background-color:#ef444414}.bg-\\[rgba\\(245\\,158\\,11\\,0\\.08\\)\\]{background-color:#f59e0b14}.bg-\\[rgba\\(255\\,255\\,255\\,0\\.02\\)\\]{background-color:#ffffff05}.bg-\\[rgba\\(255\\,255\\,255\\,0\\.03\\)\\]{background-color:#ffffff08}.bg-\\[rgba\\(255\\,255\\,255\\,0\\.05\\)\\]{background-color:#ffffff0d}.bg-\\[rgba\\(255\\,255\\,255\\,0\\.015\\)\\]{background-color:#ffffff04}.bg-\\[var\\(--background\\)\\]{background-color:var(--background)}.bg-\\[var\\(--color-background\\)\\]{background-color:var(--color-background)}.bg-\\[var\\(--local-accent\\)\\]{background-color:var(--local-accent)}.bg-\\[var\\(--local-bg\\)\\]{background-color:var(--local-bg)}.bg-\\[var\\(--local-deep\\)\\]{background-color:var(--local-deep)}.bg-\\[var\\(--local-primary\\)\\]{background-color:var(--local-primary)}.bg-\\[var\\(--local-surface\\)\\]{background-color:var(--local-surface)}.bg-\\[var\\(--local-surface-alt\\)\\]{background-color:var(--local-surface-alt)}.bg-amber-500{background-color:var(--color-amber-500)}.bg-background{background-color:var(--color-background)}.bg-black\\/20{background-color:#0003}@supports (color:color-mix(in lab,red,red)){.bg-black\\/20{background-color:color-mix(in oklab,var(--color-black)20%,transparent)}}.bg-blue-500{background-color:var(--color-blue-500)}.bg-blue-500\\/5{background-color:#3080ff0d}@supports (color:color-mix(in lab,red,red)){.bg-blue-500\\/5{background-color:color-mix(in oklab,var(--color-blue-500)5%,transparent)}}.bg-blue-500\\/20{background-color:#3080ff33}@supports (color:color-mix(in lab,red,red)){.bg-blue-500\\/20{background-color:color-mix(in oklab,var(--color-blue-500)20%,transparent)}}.bg-blue-600{background-color:var(--color-blue-600)}.bg-blue-600\\/10{background-color:#155dfc1a}@supports (color:color-mix(in lab,red,red)){.bg-blue-600\\/10{background-color:color-mix(in oklab,var(--color-blue-600)10%,transparent)}}.bg-border{background-color:var(--color-border)}.bg-emerald-500{background-color:var(--color-emerald-500)}.bg-red-500\\/10{background-color:#fb2c361a}@supports (color:color-mix(in lab,red,red)){.bg-red-500\\/10{background-color:color-mix(in oklab,var(--color-red-500)10%,transparent)}}.bg-red-900\\/10{background-color:#82181a1a}@supports (color:color-mix(in lab,red,red)){.bg-red-900\\/10{background-color:color-mix(in oklab,var(--color-red-900)10%,transparent)}}.bg-transparent{background-color:#0000}.bg-zinc-800{background-color:var(--color-zinc-800)}.bg-zinc-900{background-color:var(--color-zinc-900)}.bg-zinc-900\\/20{background-color:#18181b33}@supports (color:color-mix(in lab,red,red)){.bg-zinc-900\\/20{background-color:color-mix(in oklab,var(--color-zinc-900)20%,transparent)}}.bg-zinc-900\\/40{background-color:#18181b66}@supports (color:color-mix(in lab,red,red)){.bg-zinc-900\\/40{background-color:color-mix(in oklab,var(--color-zinc-900)40%,transparent)}}.bg-zinc-900\\/50{background-color:#18181b80}@supports (color:color-mix(in lab,red,red)){.bg-zinc-900\\/50{background-color:color-mix(in oklab,var(--color-zinc-900)50%,transparent)}}.bg-zinc-900\\/60{background-color:#18181b99}@supports (color:color-mix(in lab,red,red)){.bg-zinc-900\\/60{background-color:color-mix(in oklab,var(--color-zinc-900)60%,transparent)}}.bg-zinc-950{background-color:var(--color-zinc-950)}.bg-gradient-to-b{--tw-gradient-position:to bottom in oklab;background-image:linear-gradient(var(--tw-gradient-stops))}.bg-gradient-to-br{--tw-gradient-position:to bottom right in oklab;background-image:linear-gradient(var(--tw-gradient-stops))}.bg-gradient-to-r{--tw-gradient-position:to right in oklab;background-image:linear-gradient(var(--tw-gradient-stops))}.bg-\\[radial-gradient\\(circle\\,rgba\\(34\\,211\\,238\\,0\\.03\\)_0\\%\\,transparent_60\\%\\)\\]{background-image:radial-gradient(circle,#22d3ee08,#0000 60%)}.bg-\\[radial-gradient\\(circle\\,rgba\\(59\\,130\\,246\\,0\\.06\\)_0\\%\\,transparent_70\\%\\)\\]{background-image:radial-gradient(circle,#3b82f60f,#0000 70%)}.bg-\\[radial-gradient\\(circle\\,rgba\\(59\\,130\\,246\\,0\\.08\\)_0\\%\\,transparent_60\\%\\)\\]{background-image:radial-gradient(circle,#3b82f614,#0000 60%)}.from-\\[rgba\\(59\\,130\\,246\\,0\\.06\\)\\]{--tw-gradient-from:#3b82f60f;--tw-gradient-stops:var(--tw-gradient-via-stops,var(--tw-gradient-position),var(--tw-gradient-from)var(--tw-gradient-from-position),var(--tw-gradient-to)var(--tw-gradient-to-position))}.from-\\[var\\(--local-accent\\)\\]{--tw-gradient-from:var(--local-accent);--tw-gradient-stops:var(--tw-gradient-via-stops,var(--tw-gradient-position),var(--tw-gradient-from)var(--tw-gradient-from-position),var(--tw-gradient-to)var(--tw-gradient-to-position))}.from-\\[var\\(--local-bg\\)\\]{--tw-gradient-from:var(--local-bg);--tw-gradient-stops:var(--tw-gradient-via-stops,var(--tw-gradient-position),var(--tw-gradient-from)var(--tw-gradient-from-position),var(--tw-gradient-to)var(--tw-gradient-to-position))}.from-\\[var\\(--local-primary\\)\\]{--tw-gradient-from:var(--local-primary);--tw-gradient-stops:var(--tw-gradient-via-stops,var(--tw-gradient-position),var(--tw-gradient-from)var(--tw-gradient-from-position),var(--tw-gradient-to)var(--tw-gradient-to-position))}.from-transparent{--tw-gradient-from:transparent;--tw-gradient-stops:var(--tw-gradient-via-stops,var(--tw-gradient-position),var(--tw-gradient-from)var(--tw-gradient-from-position),var(--tw-gradient-to)var(--tw-gradient-to-position))}.via-\\[rgba\\(59\\,130\\,246\\,0\\.1\\)\\]{--tw-gradient-via:#3b82f61a;--tw-gradient-via-stops:var(--tw-gradient-position),var(--tw-gradient-from)var(--tw-gradient-from-position),var(--tw-gradient-via)var(--tw-gradient-via-position),var(--tw-gradient-to)var(--tw-gradient-to-position);--tw-gradient-stops:var(--tw-gradient-via-stops)}.via-\\[rgba\\(59\\,130\\,246\\,0\\.15\\)\\]{--tw-gradient-via:#3b82f626;--tw-gradient-via-stops:var(--tw-gradient-position),var(--tw-gradient-from)var(--tw-gradient-from-position),var(--tw-gradient-via)var(--tw-gradient-via-position),var(--tw-gradient-to)var(--tw-gradient-to-position);--tw-gradient-stops:var(--tw-gradient-via-stops)}.to-\\[\\#22d3ee\\]{--tw-gradient-to:#22d3ee;--tw-gradient-stops:var(--tw-gradient-via-stops,var(--tw-gradient-position),var(--tw-gradient-from)var(--tw-gradient-from-position),var(--tw-gradient-to)var(--tw-gradient-to-position))}.to-\\[rgba\\(59\\,130\\,246\\,0\\.01\\)\\]{--tw-gradient-to:#3b82f603;--tw-gradient-stops:var(--tw-gradient-via-stops,var(--tw-gradient-position),var(--tw-gradient-from)var(--tw-gradient-from-position),var(--tw-gradient-to)var(--tw-gradient-to-position))}.to-\\[var\\(--local-accent\\)\\]{--tw-gradient-to:var(--local-accent);--tw-gradient-stops:var(--tw-gradient-via-stops,var(--tw-gradient-position),var(--tw-gradient-from)var(--tw-gradient-from-position),var(--tw-gradient-to)var(--tw-gradient-to-position))}.to-\\[var\\(--local-cyan\\)\\]{--tw-gradient-to:var(--local-cyan);--tw-gradient-stops:var(--tw-gradient-via-stops,var(--tw-gradient-position),var(--tw-gradient-from)var(--tw-gradient-from-position),var(--tw-gradient-to)var(--tw-gradient-to-position))}.to-\\[var\\(--local-surface\\)\\]{--tw-gradient-to:var(--local-surface);--tw-gradient-stops:var(--tw-gradient-via-stops,var(--tw-gradient-position),var(--tw-gradient-from)var(--tw-gradient-from-position),var(--tw-gradient-to)var(--tw-gradient-to-position))}.to-transparent{--tw-gradient-to:transparent;--tw-gradient-stops:var(--tw-gradient-via-stops,var(--tw-gradient-position),var(--tw-gradient-from)var(--tw-gradient-from-position),var(--tw-gradient-to)var(--tw-gradient-to-position))}.bg-clip-text{-webkit-background-clip:text;background-clip:text}.p-1{padding:calc(var(--spacing)*1)}.p-1\\.5{padding:calc(var(--spacing)*1.5)}.p-2{padding:calc(var(--spacing)*2)}.p-4{padding:calc(var(--spacing)*4)}.p-6{padding:calc(var(--spacing)*6)}.p-8{padding:calc(var(--spacing)*8)}.p-10{padding:calc(var(--spacing)*10)}.p-12{padding:calc(var(--spacing)*12)}.px-1\\.5{padding-inline:calc(var(--spacing)*1.5)}.px-2{padding-inline:calc(var(--spacing)*2)}.px-2\\.5{padding-inline:calc(var(--spacing)*2.5)}.px-3{padding-inline:calc(var(--spacing)*3)}.px-4{padding-inline:calc(var(--spacing)*4)}.px-5{padding-inline:calc(var(--spacing)*5)}.px-6{padding-inline:calc(var(--spacing)*6)}.px-8{padding-inline:calc(var(--spacing)*8)}.py-1{padding-block:calc(var(--spacing)*1)}.py-1\\.5{padding-block:calc(var(--spacing)*1.5)}.py-2{padding-block:calc(var(--spacing)*2)}.py-2\\.5{padding-block:calc(var(--spacing)*2.5)}.py-3{padding-block:calc(var(--spacing)*3)}.py-3\\.5{padding-block:calc(var(--spacing)*3.5)}.py-4{padding-block:calc(var(--spacing)*4)}.py-12{padding-block:calc(var(--spacing)*12)}.py-16{padding-block:calc(var(--spacing)*16)}.py-20{padding-block:calc(var(--spacing)*20)}.py-28{padding-block:calc(var(--spacing)*28)}.pt-12{padding-top:calc(var(--spacing)*12)}.pt-24{padding-top:calc(var(--spacing)*24)}.pr-2{padding-right:calc(var(--spacing)*2)}.pr-8{padding-right:calc(var(--spacing)*8)}.pb-6{padding-bottom:calc(var(--spacing)*6)}.pl-1\\.5{padding-left:calc(var(--spacing)*1.5)}.pl-2\\.5{padding-left:calc(var(--spacing)*2.5)}.pl-6{padding-left:calc(var(--spacing)*6)}.text-center{text-align:center}.text-left{text-align:left}.text-right{text-align:right}.font-display{font-family:var(--font-display)}.font-mono{font-family:var(--font-mono)}.text-2xl{font-size:var(--text-2xl);line-height:var(--tw-leading,var(--text-2xl--line-height))}.text-3xl{font-size:var(--text-3xl);line-height:var(--tw-leading,var(--text-3xl--line-height))}.text-6xl{font-size:var(--text-6xl);line-height:var(--tw-leading,var(--text-6xl--line-height))}.text-base{font-size:var(--text-base);line-height:var(--tw-leading,var(--text-base--line-height))}.text-lg{font-size:var(--text-lg);line-height:var(--tw-leading,var(--text-lg--line-height))}.text-sm{font-size:var(--text-sm);line-height:var(--tw-leading,var(--text-sm--line-height))}.text-xl{font-size:var(--text-xl);line-height:var(--tw-leading,var(--text-xl--line-height))}.text-xs{font-size:var(--text-xs);line-height:var(--tw-leading,var(--text-xs--line-height))}.text-\\[0\\.7rem\\]{font-size:.7rem}.text-\\[0\\.8rem\\]{font-size:.8rem}.text-\\[0\\.9rem\\]{font-size:.9rem}.text-\\[0\\.72rem\\]{font-size:.72rem}.text-\\[0\\.75rem\\]{font-size:.75rem}.text-\\[0\\.78rem\\]{font-size:.78rem}.text-\\[0\\.82rem\\]{font-size:.82rem}.text-\\[0\\.85rem\\]{font-size:.85rem}.text-\\[0\\.92rem\\]{font-size:.92rem}.text-\\[0\\.95rem\\]{font-size:.95rem}.text-\\[1\\.05rem\\]{font-size:1.05rem}.text-\\[2\\.2rem\\]{font-size:2.2rem}.text-\\[2rem\\]{font-size:2rem}.text-\\[9px\\]{font-size:9px}.text-\\[10px\\]{font-size:10px}.text-\\[11px\\]{font-size:11px}.text-\\[clamp\\(1\\.6rem\\,3vw\\,2\\.4rem\\)\\]{font-size:clamp(1.6rem,3vw,2.4rem)}.text-\\[clamp\\(2\\.8rem\\,6vw\\,4\\.8rem\\)\\]{font-size:clamp(2.8rem,6vw,4.8rem)}.text-\\[clamp\\(2rem\\,4vw\\,3\\.2rem\\)\\]{font-size:clamp(2rem,4vw,3.2rem)}.leading-\\[1\\.7\\]{--tw-leading:1.7;line-height:1.7}.leading-\\[1\\.08\\]{--tw-leading:1.08;line-height:1.08}.leading-\\[1\\.15\\]{--tw-leading:1.15;line-height:1.15}.leading-\\[1\\.35\\]{--tw-leading:1.35;line-height:1.35}.leading-none{--tw-leading:1;line-height:1}.leading-relaxed{--tw-leading:var(--leading-relaxed);line-height:var(--leading-relaxed)}.font-black{--tw-font-weight:var(--font-weight-black);font-weight:var(--font-weight-black)}.font-bold{--tw-font-weight:var(--font-weight-bold);font-weight:var(--font-weight-bold)}.font-extrabold{--tw-font-weight:var(--font-weight-extrabold);font-weight:var(--font-weight-extrabold)}.font-medium{--tw-font-weight:var(--font-weight-medium);font-weight:var(--font-weight-medium)}.font-normal{--tw-font-weight:var(--font-weight-normal);font-weight:var(--font-weight-normal)}.font-semibold{--tw-font-weight:var(--font-weight-semibold);font-weight:var(--font-weight-semibold)}.tracking-\\[0\\.1em\\]{--tw-tracking:.1em;letter-spacing:.1em}.tracking-\\[0\\.2em\\]{--tw-tracking:.2em;letter-spacing:.2em}.tracking-\\[0\\.12em\\]{--tw-tracking:.12em;letter-spacing:.12em}.tracking-tight{--tw-tracking:var(--tracking-tight);letter-spacing:var(--tracking-tight)}.tracking-wide{--tw-tracking:var(--tracking-wide);letter-spacing:var(--tracking-wide)}.tracking-wider{--tw-tracking:var(--tracking-wider);letter-spacing:var(--tracking-wider)}.tracking-widest{--tw-tracking:var(--tracking-widest);letter-spacing:var(--tracking-widest)}.whitespace-nowrap{white-space:nowrap}.whitespace-pre-wrap{white-space:pre-wrap}.text-\\[\\#4ade80\\]{color:#4ade80}.text-\\[\\#22d3ee\\]{color:#22d3ee}.text-\\[\\#60a5fa\\]{color:#60a5fa}.text-\\[\\#64748b\\]{color:#64748b}.text-\\[\\#c084fc\\]{color:#c084fc}.text-\\[\\#cbd5e1\\]{color:#cbd5e1}.text-\\[\\#e2e8f0\\]{color:#e2e8f0}.text-\\[\\#f472b6\\]{color:#f472b6}.text-\\[\\#f87171\\]{color:#f87171}.text-\\[\\#fbbf24\\]{color:#fbbf24}.text-\\[var\\(--background\\)\\]{color:var(--background)}.text-\\[var\\(--foreground\\)\\]{color:var(--foreground)}.text-\\[var\\(--local-accent\\)\\]{color:var(--local-accent)}.text-\\[var\\(--local-bg\\)\\]{color:var(--local-bg)}.text-\\[var\\(--local-text\\)\\]{color:var(--local-text)}.text-\\[var\\(--local-text-muted\\)\\],.text-\\[var\\(--local-text-muted\\)\\]\\/50{color:var(--local-text-muted)}@supports (color:color-mix(in lab,red,red)){.text-\\[var\\(--local-text-muted\\)\\]\\/50{color:color-mix(in oklab,var(--local-text-muted)50%,transparent)}}.text-\\[var\\(--local-text-muted\\)\\]\\/60{color:var(--local-text-muted)}@supports (color:color-mix(in lab,red,red)){.text-\\[var\\(--local-text-muted\\)\\]\\/60{color:color-mix(in oklab,var(--local-text-muted)60%,transparent)}}.text-\\[var\\(--muted-foreground\\)\\]{color:var(--muted-foreground)}.text-amber-500{color:var(--color-amber-500)}.text-blue-400{color:var(--color-blue-400)}.text-blue-500{color:var(--color-blue-500)}.text-current{color:currentColor}.text-foreground{color:var(--color-foreground)}.text-muted-foreground{color:var(--color-muted-foreground)}.text-red-400{color:var(--color-red-400)}.text-transparent{color:#0000}.text-white{color:var(--color-white)}.text-zinc-100{color:var(--color-zinc-100)}.text-zinc-200{color:var(--color-zinc-200)}.text-zinc-300{color:var(--color-zinc-300)}.text-zinc-400{color:var(--color-zinc-400)}.text-zinc-500{color:var(--color-zinc-500)}.text-zinc-600{color:var(--color-zinc-600)}.capitalize{text-transform:capitalize}.uppercase{text-transform:uppercase}.italic{font-style:italic}.not-italic{font-style:normal}.no-underline{text-decoration-line:none}.opacity-0{opacity:0}.opacity-20{opacity:.2}.opacity-50{opacity:.5}.opacity-60{opacity:.6}.opacity-70{opacity:.7}.shadow-2xl{--tw-shadow:0 25px 50px -12px var(--tw-shadow-color,#00000040);box-shadow:var(--tw-inset-shadow),var(--tw-inset-ring-shadow),var(--tw-ring-offset-shadow),var(--tw-ring-shadow),var(--tw-shadow)}.shadow-\\[0_0_8px_rgba\\(245\\,158\\,11\\,0\\.5\\)\\]{--tw-shadow:0 0 8px var(--tw-shadow-color,#f59e0b80);box-shadow:var(--tw-inset-shadow),var(--tw-inset-ring-shadow),var(--tw-ring-offset-shadow),var(--tw-ring-shadow),var(--tw-shadow)}.shadow-lg{--tw-shadow:0 10px 15px -3px var(--tw-shadow-color,#0000001a),0 4px 6px -4px var(--tw-shadow-color,#0000001a);box-shadow:var(--tw-inset-shadow),var(--tw-inset-ring-shadow),var(--tw-ring-offset-shadow),var(--tw-ring-shadow),var(--tw-shadow)}.shadow-md{--tw-shadow:0 4px 6px -1px var(--tw-shadow-color,#0000001a),0 2px 4px -2px var(--tw-shadow-color,#0000001a);box-shadow:var(--tw-inset-shadow),var(--tw-inset-ring-shadow),var(--tw-ring-offset-shadow),var(--tw-ring-shadow),var(--tw-shadow)}.ring-1{--tw-ring-shadow:var(--tw-ring-inset,)0 0 0 calc(1px + var(--tw-ring-offset-width))var(--tw-ring-color,currentcolor);box-shadow:var(--tw-inset-shadow),var(--tw-inset-ring-shadow),var(--tw-ring-offset-shadow),var(--tw-ring-shadow),var(--tw-shadow)}.shadow-blue-900\\/20{--tw-shadow-color:#1c398e33}@supports (color:color-mix(in lab,red,red)){.shadow-blue-900\\/20{--tw-shadow-color:color-mix(in oklab,color-mix(in oklab,var(--color-blue-900)20%,transparent)var(--tw-shadow-alpha),transparent)}}.ring-foreground\\/10{--tw-ring-color:var(--color-foreground)}@supports (color:color-mix(in lab,red,red)){.ring-foreground\\/10{--tw-ring-color:color-mix(in oklab,var(--color-foreground)10%,transparent)}}.outline-hidden{--tw-outline-style:none;outline-style:none}@media(forced-colors:active){.outline-hidden{outline-offset:2px;outline:2px solid #0000}}.blur-xl{--tw-blur:blur(var(--blur-xl));filter:var(--tw-blur,)var(--tw-brightness,)var(--tw-contrast,)var(--tw-grayscale,)var(--tw-hue-rotate,)var(--tw-invert,)var(--tw-saturate,)var(--tw-sepia,)var(--tw-drop-shadow,)}.backdrop-blur-\\[20px\\]{--tw-backdrop-blur:blur(20px);-webkit-backdrop-filter:var(--tw-backdrop-blur,)var(--tw-backdrop-brightness,)var(--tw-backdrop-contrast,)var(--tw-backdrop-grayscale,)var(--tw-backdrop-hue-rotate,)var(--tw-backdrop-invert,)var(--tw-backdrop-opacity,)var(--tw-backdrop-saturate,)var(--tw-backdrop-sepia,);backdrop-filter:var(--tw-backdrop-blur,)var(--tw-backdrop-brightness,)var(--tw-backdrop-contrast,)var(--tw-backdrop-grayscale,)var(--tw-backdrop-hue-rotate,)var(--tw-backdrop-invert,)var(--tw-backdrop-opacity,)var(--tw-backdrop-saturate,)var(--tw-backdrop-sepia,)}.transition-all{transition-property:all;transition-timing-function:var(--tw-ease,var(--default-transition-timing-function));transition-duration:var(--tw-duration,var(--default-transition-duration))}.transition-colors{transition-property:color,background-color,border-color,outline-color,text-decoration-color,fill,stroke,--tw-gradient-from,--tw-gradient-via,--tw-gradient-to;transition-timing-function:var(--tw-ease,var(--default-transition-timing-function));transition-duration:var(--tw-duration,var(--default-transition-duration))}.transition-opacity{transition-property:opacity;transition-timing-function:var(--tw-ease,var(--default-transition-timing-function));transition-duration:var(--tw-duration,var(--default-transition-duration))}.transition-none{transition-property:none}.duration-100{--tw-duration:.1s;transition-duration:.1s}.duration-200{--tw-duration:.2s;transition-duration:.2s}.duration-300{--tw-duration:.3s;transition-duration:.3s}.outline-none{--tw-outline-style:none;outline-style:none}.select-none{-webkit-user-select:none;user-select:none}@media(hover:hover){.group-hover\\:border-dashed:is(:where(.group):hover *){--tw-border-style:dashed;border-style:dashed}.group-hover\\:border-blue-400\\/50:is(:where(.group):hover *){border-color:#54a2ff80}@supports (color:color-mix(in lab,red,red)){.group-hover\\:border-blue-400\\/50:is(:where(.group):hover *){border-color:color-mix(in oklab,var(--color-blue-400)50%,transparent)}}.group-hover\\:border-blue-500\\/30:is(:where(.group):hover *){border-color:#3080ff4d}@supports (color:color-mix(in lab,red,red)){.group-hover\\:border-blue-500\\/30:is(:where(.group):hover *){border-color:color-mix(in oklab,var(--color-blue-500)30%,transparent)}}.group-hover\\:text-blue-400:is(:where(.group):hover *){color:var(--color-blue-400)}.group-hover\\:opacity-100:is(:where(.group):hover *){opacity:1}}.group-has-disabled\\/field\\:opacity-50:is(:where(.group\\/field):has(:disabled) *){opacity:.5}.group-data-\\[disabled\\=true\\]\\:pointer-events-none:is(:where(.group)[data-disabled=true] *){pointer-events:none}.group-data-\\[disabled\\=true\\]\\:opacity-50:is(:where(.group)[data-disabled=true] *){opacity:.5}.peer-disabled\\:cursor-not-allowed:is(:where(.peer):disabled~*){cursor:not-allowed}.peer-disabled\\:opacity-50:is(:where(.peer):disabled~*){opacity:.5}.file\\:inline-flex::file-selector-button{display:inline-flex}.file\\:h-6::file-selector-button{height:calc(var(--spacing)*6)}.file\\:border-0::file-selector-button{border-style:var(--tw-border-style);border-width:0}.file\\:bg-transparent::file-selector-button{background-color:#0000}.file\\:text-sm::file-selector-button{font-size:var(--text-sm);line-height:var(--tw-leading,var(--text-sm--line-height))}.file\\:font-medium::file-selector-button{--tw-font-weight:var(--font-weight-medium);font-weight:var(--font-weight-medium)}.file\\:text-foreground::file-selector-button{color:var(--color-foreground)}.placeholder\\:text-muted-foreground::placeholder{color:var(--color-muted-foreground)}.before\\:absolute:before{content:var(--tw-content);position:absolute}.before\\:left-0:before{content:var(--tw-content);left:calc(var(--spacing)*0)}.before\\:text-\\[0\\.8rem\\]:before{content:var(--tw-content);font-size:.8rem}.before\\:font-bold:before{content:var(--tw-content);--tw-font-weight:var(--font-weight-bold);font-weight:var(--font-weight-bold)}.before\\:text-\\[var\\(--local-accent\\)\\]:before{content:var(--tw-content);color:var(--local-accent)}.before\\:content-\\[\\'✓\\'\\]:before{--tw-content:"✓";content:var(--tw-content)}.after\\:absolute:after{content:var(--tw-content);position:absolute}.after\\:-inset-x-3:after{content:var(--tw-content);inset-inline:calc(var(--spacing)*-3)}.after\\:-inset-y-2:after{content:var(--tw-content);inset-block:calc(var(--spacing)*-2)}@media(hover:hover){.hover\\:translate-x-1\\.5:hover{--tw-translate-x:calc(var(--spacing)*1.5);translate:var(--tw-translate-x)var(--tw-translate-y)}.hover\\:-translate-y-0\\.5:hover{--tw-translate-y:calc(var(--spacing)*-.5);translate:var(--tw-translate-x)var(--tw-translate-y)}.hover\\:-translate-y-1:hover{--tw-translate-y:calc(var(--spacing)*-1);translate:var(--tw-translate-x)var(--tw-translate-y)}.hover\\:-translate-y-px:hover{--tw-translate-y:-1px;translate:var(--tw-translate-x)var(--tw-translate-y)}.hover\\:border-\\[rgba\\(59\\,130\\,246\\,0\\.2\\)\\]:hover{border-color:#3b82f633}.hover\\:border-\\[rgba\\(59\\,130\\,246\\,0\\.4\\)\\]:hover{border-color:#3b82f666}.hover\\:border-\\[rgba\\(255\\,255\\,255\\,0\\.2\\)\\]:hover{border-color:#fff3}.hover\\:border-\\[rgba\\(255\\,255\\,255\\,0\\.3\\)\\]:hover{border-color:#ffffff4d}.hover\\:border-zinc-600:hover{border-color:var(--color-zinc-600)}.hover\\:border-zinc-700:hover{border-color:var(--color-zinc-700)}.hover\\:bg-\\[rgba\\(59\\,130\\,246\\,0\\.03\\)\\]:hover{background-color:#3b82f608}.hover\\:bg-\\[rgba\\(255\\,255\\,255\\,0\\.04\\)\\]:hover{background-color:#ffffff0a}.hover\\:bg-\\[rgba\\(255\\,255\\,255\\,0\\.08\\)\\]:hover{background-color:#ffffff14}.hover\\:bg-blue-500:hover{background-color:var(--color-blue-500)}.hover\\:bg-blue-600\\/20:hover{background-color:#155dfc33}@supports (color:color-mix(in lab,red,red)){.hover\\:bg-blue-600\\/20:hover{background-color:color-mix(in oklab,var(--color-blue-600)20%,transparent)}}.hover\\:bg-zinc-800:hover{background-color:var(--color-zinc-800)}.hover\\:text-\\[var\\(--local-accent\\)\\]:hover{color:var(--local-accent)}.hover\\:text-\\[var\\(--local-text\\)\\]:hover{color:var(--local-text)}.hover\\:text-blue-400:hover{color:var(--color-blue-400)}.hover\\:text-red-500:hover{color:var(--color-red-500)}.hover\\:text-white:hover{color:var(--color-white)}.hover\\:opacity-90:hover{opacity:.9}.hover\\:shadow-\\[0_8px_30px_rgba\\(59\\,130\\,246\\,0\\.3\\)\\]:hover{--tw-shadow:0 8px 30px var(--tw-shadow-color,#3b82f64d);box-shadow:var(--tw-inset-shadow),var(--tw-inset-ring-shadow),var(--tw-ring-offset-shadow),var(--tw-ring-shadow),var(--tw-shadow)}.hover\\:brightness-110:hover{--tw-brightness:brightness(110%);filter:var(--tw-blur,)var(--tw-brightness,)var(--tw-contrast,)var(--tw-grayscale,)var(--tw-hue-rotate,)var(--tw-invert,)var(--tw-saturate,)var(--tw-sepia,)var(--tw-drop-shadow,)}}.focus\\:bg-accent:focus{background-color:var(--color-accent)}.focus\\:ring-blue-600:focus{--tw-ring-color:var(--color-blue-600)}.focus-visible\\:ring-3:focus-visible{--tw-ring-shadow:var(--tw-ring-inset,)0 0 0 calc(3px + var(--tw-ring-offset-width))var(--tw-ring-color,currentcolor);box-shadow:var(--tw-inset-shadow),var(--tw-inset-ring-shadow),var(--tw-ring-offset-shadow),var(--tw-ring-shadow),var(--tw-shadow)}.focus-visible\\:ring-blue-600:focus-visible{--tw-ring-color:var(--color-blue-600)}.active\\:scale-\\[0\\.98\\]:active{scale:.98}.disabled\\:pointer-events-none:disabled{pointer-events:none}.disabled\\:cursor-not-allowed:disabled{cursor:not-allowed}.disabled\\:opacity-20:disabled{opacity:.2}.disabled\\:opacity-50:disabled{opacity:.5}.aria-invalid\\:ring-3[aria-invalid=true]{--tw-ring-shadow:var(--tw-ring-inset,)0 0 0 calc(3px + var(--tw-ring-offset-width))var(--tw-ring-color,currentcolor);box-shadow:var(--tw-inset-shadow),var(--tw-inset-ring-shadow),var(--tw-ring-offset-shadow),var(--tw-ring-shadow),var(--tw-shadow)}.aria-invalid\\:aria-checked\\:border-primary[aria-invalid=true][aria-checked=true],.data-checked\\:border-primary[data-checked]{border-color:var(--color-primary)}.data-checked\\:bg-primary[data-checked]{background-color:var(--color-primary)}.data-checked\\:text-primary-foreground[data-checked]{color:var(--color-primary-foreground)}.data-disabled\\:pointer-events-none[data-disabled]{pointer-events:none}.data-disabled\\:opacity-50[data-disabled]{opacity:.5}.data-horizontal\\:h-px[data-horizontal]{height:1px}.data-horizontal\\:w-full[data-horizontal]{width:100%}.data-placeholder\\:text-muted-foreground[data-placeholder]{color:var(--color-muted-foreground)}.data-vertical\\:w-px[data-vertical]{width:1px}.data-vertical\\:self-stretch[data-vertical]{align-self:stretch}.data-\\[align-trigger\\=true\\]\\:animate-none[data-align-trigger=true]{animation:none}.data-\\[side\\=bottom\\]\\:translate-y-1[data-side=bottom]{--tw-translate-y:calc(var(--spacing)*1);translate:var(--tw-translate-x)var(--tw-translate-y)}.data-\\[side\\=left\\]\\:-translate-x-1[data-side=left]{--tw-translate-x:calc(var(--spacing)*-1);translate:var(--tw-translate-x)var(--tw-translate-y)}.data-\\[side\\=right\\]\\:translate-x-1[data-side=right]{--tw-translate-x:calc(var(--spacing)*1);translate:var(--tw-translate-x)var(--tw-translate-y)}.data-\\[side\\=top\\]\\:-translate-y-1[data-side=top]{--tw-translate-y:calc(var(--spacing)*-1);translate:var(--tw-translate-x)var(--tw-translate-y)}.data-\\[size\\=default\\]\\:h-8[data-size=default]{height:calc(var(--spacing)*8)}.data-\\[size\\=sm\\]\\:h-7[data-size=sm]{height:calc(var(--spacing)*7)}.data-\\[size\\=sm\\]\\:rounded-\\[min\\(var\\(--radius-md\\)\\,10px\\)\\][data-size=sm]{border-radius:min(var(--radius-md),10px)}:is(.\\*\\:data-\\[slot\\=select-value\\]\\:line-clamp-1>*)[data-slot=select-value]{-webkit-line-clamp:1;-webkit-box-orient:vertical;display:-webkit-box;overflow:hidden}:is(.\\*\\:data-\\[slot\\=select-value\\]\\:flex>*)[data-slot=select-value]{display:flex}:is(.\\*\\:data-\\[slot\\=select-value\\]\\:items-center>*)[data-slot=select-value]{align-items:center}:is(.\\*\\:data-\\[slot\\=select-value\\]\\:gap-1\\.5>*)[data-slot=select-value]{gap:calc(var(--spacing)*1.5)}@media(min-width:48rem){.md\\:flex{display:flex}.md\\:hidden{display:none}.md\\:grid-cols-2{grid-template-columns:repeat(2,minmax(0,1fr))}.md\\:grid-cols-3{grid-template-columns:repeat(3,minmax(0,1fr))}.md\\:grid-cols-4{grid-template-columns:repeat(4,minmax(0,1fr))}.md\\:flex-row{flex-direction:row}.md\\:text-4xl{font-size:var(--text-4xl);line-height:var(--tw-leading,var(--text-4xl--line-height))}.md\\:text-sm{font-size:var(--text-sm);line-height:var(--tw-leading,var(--text-sm--line-height))}}@media(min-width:64rem){.lg\\:grid-cols-2{grid-template-columns:repeat(2,minmax(0,1fr))}.lg\\:grid-cols-3{grid-template-columns:repeat(3,minmax(0,1fr))}}@media(prefers-color-scheme:dark){.dark\\:data-checked\\:bg-primary[data-checked]{background-color:var(--color-primary)}}.\\[\\&_svg\\]\\:pointer-events-none svg{pointer-events:none}.\\[\\&_svg\\]\\:shrink-0 svg{flex-shrink:0}.\\[\\&_svg\\:not\\(\\[class\\*\\=\\'size-\\'\\]\\)\\]\\:size-4 svg:not([class*=size-]){width:calc(var(--spacing)*4);height:calc(var(--spacing)*4)}:is(.\\*\\:\\[span\\]\\:last\\:flex>*):is(span):last-child{display:flex}:is(.\\*\\:\\[span\\]\\:last\\:items-center>*):is(span):last-child{align-items:center}:is(.\\*\\:\\[span\\]\\:last\\:gap-2>*):is(span):last-child{gap:calc(var(--spacing)*2)}.\\[\\&\\>svg\\]\\:size-3\\.5>svg{width:calc(var(--spacing)*3.5);height:calc(var(--spacing)*3.5)}}:root{--background:var(--theme-background);--foreground:var(--theme-text);--card:var(--theme-surface);--card-foreground:var(--theme-text);--primary:var(--theme-primary);--primary-foreground:oklch(98% 0 0);--secondary:var(--theme-secondary);--secondary-foreground:var(--theme-text);--muted:var(--theme-surface-alt);--muted-foreground:var(--theme-text-muted);--border:var(--theme-border);--radius:.45rem;--accent:var(--theme-accent,var(--theme-primary))}.font-display{font-family:var(--font-display,var(--font-primary))}@keyframes jp-fadeUp{0%{opacity:0;transform:translateY(30px)}to{opacity:1;transform:translateY(0)}}@keyframes jp-pulseDot{0%,to{opacity:1}50%{opacity:.3}}.jp-animate-in{opacity:0;animation:.7s forwards jp-fadeUp}.jp-d1{animation-delay:.1s}.jp-d2{animation-delay:.2s}.jp-d3{animation-delay:.3s}.jp-d4{animation-delay:.4s}.jp-d5{animation-delay:.5s}.jp-pulse-dot{animation:2s infinite jp-pulseDot}html{scroll-behavior:smooth}@property --tw-translate-x{syntax:"*";inherits:false;initial-value:0}@property --tw-translate-y{syntax:"*";inherits:false;initial-value:0}@property --tw-translate-z{syntax:"*";inherits:false;initial-value:0}@property --tw-space-y-reverse{syntax:"*";inherits:false;initial-value:0}@property --tw-space-x-reverse{syntax:"*";inherits:false;initial-value:0}@property --tw-border-style{syntax:"*";inherits:false;initial-value:solid}@property --tw-gradient-position{syntax:"*";inherits:false}@property --tw-gradient-from{syntax:"<color>";inherits:false;initial-value:#0000}@property --tw-gradient-via{syntax:"<color>";inherits:false;initial-value:#0000}@property --tw-gradient-to{syntax:"<color>";inherits:false;initial-value:#0000}@property --tw-gradient-stops{syntax:"*";inherits:false}@property --tw-gradient-via-stops{syntax:"*";inherits:false}@property --tw-gradient-from-position{syntax:"<length-percentage>";inherits:false;initial-value:0%}@property --tw-gradient-via-position{syntax:"<length-percentage>";inherits:false;initial-value:50%}@property --tw-gradient-to-position{syntax:"<length-percentage>";inherits:false;initial-value:100%}@property --tw-leading{syntax:"*";inherits:false}@property --tw-font-weight{syntax:"*";inherits:false}@property --tw-tracking{syntax:"*";inherits:false}@property --tw-shadow{syntax:"*";inherits:false;initial-value:0 0 #0000}@property --tw-shadow-color{syntax:"*";inherits:false}@property --tw-shadow-alpha{syntax:"<percentage>";inherits:false;initial-value:100%}@property --tw-inset-shadow{syntax:"*";inherits:false;initial-value:0 0 #0000}@property --tw-inset-shadow-color{syntax:"*";inherits:false}@property --tw-inset-shadow-alpha{syntax:"<percentage>";inherits:false;initial-value:100%}@property --tw-ring-color{syntax:"*";inherits:false}@property --tw-ring-shadow{syntax:"*";inherits:false;initial-value:0 0 #0000}@property --tw-inset-ring-color{syntax:"*";inherits:false}@property --tw-inset-ring-shadow{syntax:"*";inherits:false;initial-value:0 0 #0000}@property --tw-ring-inset{syntax:"*";inherits:false}@property --tw-ring-offset-width{syntax:"<length>";inherits:false;initial-value:0}@property --tw-ring-offset-color{syntax:"*";inherits:false;initial-value:#fff}@property --tw-ring-offset-shadow{syntax:"*";inherits:false;initial-value:0 0 #0000}@property --tw-blur{syntax:"*";inherits:false}@property --tw-brightness{syntax:"*";inherits:false}@property --tw-contrast{syntax:"*";inherits:false}@property --tw-grayscale{syntax:"*";inherits:false}@property --tw-hue-rotate{syntax:"*";inherits:false}@property --tw-invert{syntax:"*";inherits:false}@property --tw-opacity{syntax:"*";inherits:false}@property --tw-saturate{syntax:"*";inherits:false}@property --tw-sepia{syntax:"*";inherits:false}@property --tw-drop-shadow{syntax:"*";inherits:false}@property --tw-drop-shadow-color{syntax:"*";inherits:false}@property --tw-drop-shadow-alpha{syntax:"<percentage>";inherits:false;initial-value:100%}@property --tw-drop-shadow-size{syntax:"*";inherits:false}@property --tw-backdrop-blur{syntax:"*";inherits:false}@property --tw-backdrop-brightness{syntax:"*";inherits:false}@property --tw-backdrop-contrast{syntax:"*";inherits:false}@property --tw-backdrop-grayscale{syntax:"*";inherits:false}@property --tw-backdrop-hue-rotate{syntax:"*";inherits:false}@property --tw-backdrop-invert{syntax:"*";inherits:false}@property --tw-backdrop-opacity{syntax:"*";inherits:false}@property --tw-backdrop-saturate{syntax:"*";inherits:false}@property --tw-backdrop-sepia{syntax:"*";inherits:false}@property --tw-duration{syntax:"*";inherits:false}@property --tw-content{syntax:"*";inherits:false;initial-value:""}@keyframes pulse{50%{opacity:.5}}`,T3=`/*! tailwindcss v4.1.18 | MIT License | https://tailwindcss.com */@layer properties{@supports (((-webkit-hyphens:none)) and (not (margin-trim:inline))) or ((-moz-orient:inline) and (not (color:rgb(from red r g b)))){*,:before,:after,::backdrop{--tw-translate-x:0;--tw-translate-y:0;--tw-translate-z:0;--tw-space-y-reverse:0;--tw-space-x-reverse:0;--tw-border-style:solid;--tw-gradient-position:initial;--tw-gradient-from:#0000;--tw-gradient-via:#0000;--tw-gradient-to:#0000;--tw-gradient-stops:initial;--tw-gradient-via-stops:initial;--tw-gradient-from-position:0%;--tw-gradient-via-position:50%;--tw-gradient-to-position:100%;--tw-leading:initial;--tw-font-weight:initial;--tw-tracking:initial;--tw-shadow:0 0 #0000;--tw-shadow-color:initial;--tw-shadow-alpha:100%;--tw-inset-shadow:0 0 #0000;--tw-inset-shadow-color:initial;--tw-inset-shadow-alpha:100%;--tw-ring-color:initial;--tw-ring-shadow:0 0 #0000;--tw-inset-ring-color:initial;--tw-inset-ring-shadow:0 0 #0000;--tw-ring-inset:initial;--tw-ring-offset-width:0px;--tw-ring-offset-color:#fff;--tw-ring-offset-shadow:0 0 #0000;--tw-blur:initial;--tw-brightness:initial;--tw-contrast:initial;--tw-grayscale:initial;--tw-hue-rotate:initial;--tw-invert:initial;--tw-opacity:initial;--tw-saturate:initial;--tw-sepia:initial;--tw-drop-shadow:initial;--tw-drop-shadow-color:initial;--tw-drop-shadow-alpha:100%;--tw-drop-shadow-size:initial;--tw-backdrop-blur:initial;--tw-backdrop-brightness:initial;--tw-backdrop-contrast:initial;--tw-backdrop-grayscale:initial;--tw-backdrop-hue-rotate:initial;--tw-backdrop-invert:initial;--tw-backdrop-opacity:initial;--tw-backdrop-saturate:initial;--tw-backdrop-sepia:initial;--tw-duration:initial;--tw-content:""}}}@layer theme{:root,:host{--font-sans:ui-sans-serif,system-ui,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";--font-mono:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,"Liberation Mono","Courier New",monospace;--color-red-400:oklch(70.4% .191 22.216);--color-red-500:oklch(63.7% .237 25.331);--color-red-900:oklch(39.6% .141 25.723);--color-amber-500:oklch(76.9% .188 70.08);--color-emerald-500:oklch(69.6% .17 162.48);--color-blue-400:oklch(70.7% .165 254.624);--color-blue-500:oklch(62.3% .214 259.815);--color-blue-600:oklch(54.6% .245 262.881);--color-blue-900:oklch(37.9% .146 265.522);--color-zinc-100:oklch(96.7% .001 286.375);--color-zinc-200:oklch(92% .004 286.32);--color-zinc-300:oklch(87.1% .006 286.286);--color-zinc-400:oklch(70.5% .015 286.067);--color-zinc-500:oklch(55.2% .016 285.938);--color-zinc-600:oklch(44.2% .017 285.786);--color-zinc-700:oklch(37% .013 285.805);--color-zinc-800:oklch(27.4% .006 286.033);--color-zinc-900:oklch(21% .006 285.885);--color-zinc-950:oklch(14.1% .005 285.823);--color-black:#000;--color-white:#fff;--spacing:.25rem;--container-4xl:56rem;--text-xs:.75rem;--text-xs--line-height:calc(1/.75);--text-sm:.875rem;--text-sm--line-height:calc(1.25/.875);--text-base:1rem;--text-base--line-height: 1.5 ;--text-lg:1.125rem;--text-lg--line-height:calc(1.75/1.125);--text-xl:1.25rem;--text-xl--line-height:calc(1.75/1.25);--text-2xl:1.5rem;--text-2xl--line-height:calc(2/1.5);--text-3xl:1.875rem;--text-3xl--line-height: 1.2 ;--text-4xl:2.25rem;--text-4xl--line-height:calc(2.5/2.25);--text-6xl:3.75rem;--text-6xl--line-height:1;--font-weight-normal:400;--font-weight-medium:500;--font-weight-semibold:600;--font-weight-bold:700;--font-weight-extrabold:800;--font-weight-black:900;--tracking-tight:-.025em;--tracking-wide:.025em;--tracking-wider:.05em;--tracking-widest:.1em;--leading-relaxed:1.625;--radius-md:.375rem;--radius-lg:.5rem;--radius-xl:.75rem;--radius-2xl:1rem;--animate-pulse:pulse 2s cubic-bezier(.4,0,.6,1)infinite;--blur-xl:24px;--default-transition-duration:.15s;--default-transition-timing-function:cubic-bezier(.4,0,.2,1);--default-font-family:var(--font-sans);--default-mono-font-family:var(--font-mono);--color-background:var(--background);--color-foreground:var(--foreground);--color-popover:var(--popover);--color-popover-foreground:var(--popover-foreground);--color-primary:var(--primary);--color-primary-foreground:var(--primary-foreground);--color-secondary:var(--secondary);--color-muted-foreground:var(--muted-foreground);--color-accent:var(--accent);--color-accent-foreground:var(--accent-foreground);--color-destructive:var(--destructive);--color-border:var(--border);--color-input:var(--input);--color-ring:var(--ring)}}@layer base{*,:after,:before,::backdrop{box-sizing:border-box;border:0 solid;margin:0;padding:0}::file-selector-button{box-sizing:border-box;border:0 solid;margin:0;padding:0}html,:host{-webkit-text-size-adjust:100%;-moz-tab-size:4;tab-size:4;line-height:1.5;font-family:var(--default-font-family,ui-sans-serif,system-ui,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji");font-feature-settings:var(--default-font-feature-settings,normal);font-variation-settings:var(--default-font-variation-settings,normal);-webkit-tap-highlight-color:transparent}hr{height:0;color:inherit;border-top-width:1px}abbr:where([title]){-webkit-text-decoration:underline dotted;text-decoration:underline dotted}h1,h2,h3,h4,h5,h6{font-size:inherit;font-weight:inherit}a{color:inherit;-webkit-text-decoration:inherit;text-decoration:inherit}b,strong{font-weight:bolder}code,kbd,samp,pre{font-family:var(--default-mono-font-family,ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,"Liberation Mono","Courier New",monospace);font-feature-settings:var(--default-mono-font-feature-settings,normal);font-variation-settings:var(--default-mono-font-variation-settings,normal);font-size:1em}small{font-size:80%}sub,sup{vertical-align:baseline;font-size:75%;line-height:0;position:relative}sub{bottom:-.25em}sup{top:-.5em}table{text-indent:0;border-color:inherit;border-collapse:collapse}:-moz-focusring{outline:auto}progress{vertical-align:baseline}summary{display:list-item}ol,ul,menu{list-style:none}img,svg,video,canvas,audio,iframe,embed,object{vertical-align:middle;display:block}img,video{max-width:100%;height:auto}button,input,select,optgroup,textarea{font:inherit;font-feature-settings:inherit;font-variation-settings:inherit;letter-spacing:inherit;color:inherit;opacity:1;background-color:#0000;border-radius:0}::file-selector-button{font:inherit;font-feature-settings:inherit;font-variation-settings:inherit;letter-spacing:inherit;color:inherit;opacity:1;background-color:#0000;border-radius:0}:where(select:is([multiple],[size])) optgroup{font-weight:bolder}:where(select:is([multiple],[size])) optgroup option{padding-inline-start:20px}::file-selector-button{margin-inline-end:4px}::placeholder{opacity:1}@supports (not ((-webkit-appearance:-apple-pay-button))) or (contain-intrinsic-size:1px){::placeholder{color:currentColor}@supports (color:color-mix(in lab,red,red)){::placeholder{color:color-mix(in oklab,currentcolor 50%,transparent)}}}textarea{resize:vertical}::-webkit-search-decoration{-webkit-appearance:none}::-webkit-date-and-time-value{min-height:1lh;text-align:inherit}::-webkit-datetime-edit{display:inline-flex}::-webkit-datetime-edit-fields-wrapper{padding:0}::-webkit-datetime-edit{padding-block:0}::-webkit-datetime-edit-year-field{padding-block:0}::-webkit-datetime-edit-month-field{padding-block:0}::-webkit-datetime-edit-day-field{padding-block:0}::-webkit-datetime-edit-hour-field{padding-block:0}::-webkit-datetime-edit-minute-field{padding-block:0}::-webkit-datetime-edit-second-field{padding-block:0}::-webkit-datetime-edit-millisecond-field{padding-block:0}::-webkit-datetime-edit-meridiem-field{padding-block:0}::-webkit-calendar-picker-indicator{line-height:1}:-moz-ui-invalid{box-shadow:none}button,input:where([type=button],[type=reset],[type=submit]){-webkit-appearance:button;-moz-appearance:button;appearance:button}::file-selector-button{-webkit-appearance:button;-moz-appearance:button;appearance:button}::-webkit-inner-spin-button{height:auto}::-webkit-outer-spin-button{height:auto}[hidden]:where(:not([hidden=until-found])){display:none!important}*{border-color:var(--border)}body{background-color:var(--background);color:var(--foreground);-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale}}@layer components;@layer utilities{.pointer-events-none{pointer-events:none}.absolute{position:absolute}.relative{position:relative}.static{position:static}.sticky{position:sticky}.inset-0{inset:calc(var(--spacing)*0)}.-top-3{top:calc(var(--spacing)*-3)}.-top-\\[40\\%\\]{top:-40%}.top-0{top:calc(var(--spacing)*0)}.top-1\\/2{top:50%}.-right-\\[20\\%\\]{right:-20%}.right-0{right:calc(var(--spacing)*0)}.right-2{right:calc(var(--spacing)*2)}.-bottom-\\[10\\%\\]{bottom:-10%}.bottom-0{bottom:calc(var(--spacing)*0)}.-left-\\[10\\%\\]{left:-10%}.left-0{left:calc(var(--spacing)*0)}.left-1\\/2{left:50%}.z-0{z-index:0}.z-10{z-index:10}.z-50{z-index:50}.z-\\[2\\]{z-index:2}.z-\\[50\\]{z-index:50}.z-\\[60\\]{z-index:60}.z-\\[70\\]{z-index:70}.z-\\[110\\]{z-index:110}.container{width:100%}@media(min-width:40rem){.container{max-width:40rem}}@media(min-width:48rem){.container{max-width:48rem}}@media(min-width:64rem){.container{max-width:64rem}}@media(min-width:80rem){.container{max-width:80rem}}@media(min-width:96rem){.container{max-width:96rem}}.m-0{margin:calc(var(--spacing)*0)}.m-4{margin:calc(var(--spacing)*4)}.-mx-1{margin-inline:calc(var(--spacing)*-1)}.mx-1{margin-inline:calc(var(--spacing)*1)}.mx-auto{margin-inline:auto}.my-1{margin-block:calc(var(--spacing)*1)}.my-8{margin-block:calc(var(--spacing)*8)}.mt-0\\.5{margin-top:calc(var(--spacing)*.5)}.mt-2{margin-top:calc(var(--spacing)*2)}.mt-4{margin-top:calc(var(--spacing)*4)}.mt-12{margin-top:calc(var(--spacing)*12)}.mt-14{margin-top:calc(var(--spacing)*14)}.mt-16{margin-top:calc(var(--spacing)*16)}.mr-2{margin-right:calc(var(--spacing)*2)}.mb-1{margin-bottom:calc(var(--spacing)*1)}.mb-1\\.5{margin-bottom:calc(var(--spacing)*1.5)}.mb-2{margin-bottom:calc(var(--spacing)*2)}.mb-3{margin-bottom:calc(var(--spacing)*3)}.mb-4{margin-bottom:calc(var(--spacing)*4)}.mb-5{margin-bottom:calc(var(--spacing)*5)}.mb-6{margin-bottom:calc(var(--spacing)*6)}.mb-8{margin-bottom:calc(var(--spacing)*8)}.mb-10{margin-bottom:calc(var(--spacing)*10)}.mb-16{margin-bottom:calc(var(--spacing)*16)}.ml-2{margin-left:calc(var(--spacing)*2)}.ml-3{margin-left:calc(var(--spacing)*3)}.block{display:block}.flex{display:flex}.grid{display:grid}.hidden{display:none}.inline-block{display:inline-block}.inline-flex{display:inline-flex}.field-sizing-content{field-sizing:content}.size-4{width:calc(var(--spacing)*4);height:calc(var(--spacing)*4)}.h-\\(--radix-select-trigger-height\\){height:var(--radix-select-trigger-height)}.h-1\\.5{height:calc(var(--spacing)*1.5)}.h-2{height:calc(var(--spacing)*2)}.h-2\\.5{height:calc(var(--spacing)*2.5)}.h-3{height:calc(var(--spacing)*3)}.h-7{height:calc(var(--spacing)*7)}.h-8{height:calc(var(--spacing)*8)}.h-9{height:calc(var(--spacing)*9)}.h-10{height:calc(var(--spacing)*10)}.h-12{height:calc(var(--spacing)*12)}.h-14{height:calc(var(--spacing)*14)}.h-20{height:calc(var(--spacing)*20)}.h-\\[3px\\]{height:3px}.h-\\[50vw\\]{height:50vw}.h-\\[60vw\\]{height:60vw}.h-\\[70vw\\]{height:70vw}.h-\\[360px\\]{height:360px}.h-full{height:100%}.h-px{height:1px}.h-screen{height:100vh}.max-h-\\(--radix-select-content-available-height\\){max-height:var(--radix-select-content-available-height)}.min-h-16{min-height:calc(var(--spacing)*16)}.min-h-\\[80px\\]{min-height:80px}.min-h-screen{min-height:100vh}.w-1{width:calc(var(--spacing)*1)}.w-1\\.5{width:calc(var(--spacing)*1.5)}.w-2{width:calc(var(--spacing)*2)}.w-2\\.5{width:calc(var(--spacing)*2.5)}.w-5{width:calc(var(--spacing)*5)}.w-6{width:calc(var(--spacing)*6)}.w-8{width:calc(var(--spacing)*8)}.w-9{width:calc(var(--spacing)*9)}.w-10{width:calc(var(--spacing)*10)}.w-12{width:calc(var(--spacing)*12)}.w-20{width:calc(var(--spacing)*20)}.w-80{width:calc(var(--spacing)*80)}.w-\\[50vw\\]{width:50vw}.w-\\[60vw\\]{width:60vw}.w-\\[70vw\\]{width:70vw}.w-\\[80\\%\\]{width:80%}.w-full{width:100%}.w-px{width:1px}.w-screen{width:100vw}.max-w-4xl{max-width:var(--container-4xl)}.max-w-\\[200px\\]{max-width:200px}.max-w-\\[560px\\]{max-width:560px}.max-w-\\[600px\\]{max-width:600px}.max-w-\\[740px\\]{max-width:740px}.max-w-\\[760px\\]{max-width:760px}.max-w-\\[820px\\]{max-width:820px}.max-w-\\[1200px\\]{max-width:1200px}.min-w-\\(--radix-select-trigger-width\\){min-width:var(--radix-select-trigger-width)}.min-w-0{min-width:calc(var(--spacing)*0)}.min-w-36{min-width:calc(var(--spacing)*36)}.flex-1{flex:1}.shrink-0{flex-shrink:0}.origin-\\(--radix-select-content-transform-origin\\){transform-origin:var(--radix-select-content-transform-origin)}.-translate-x-1\\/2{--tw-translate-x: -50% ;translate:var(--tw-translate-x)var(--tw-translate-y)}.-translate-y-1\\/2{--tw-translate-y: -50% ;translate:var(--tw-translate-x)var(--tw-translate-y)}.animate-pulse{animation:var(--animate-pulse)}.cursor-default{cursor:default}.cursor-not-allowed{cursor:not-allowed}.cursor-pointer{cursor:pointer}.resize-none{resize:none}.scroll-my-1{scroll-margin-block:calc(var(--spacing)*1)}.grid-cols-1{grid-template-columns:repeat(1,minmax(0,1fr))}.flex-col{flex-direction:column}.flex-wrap{flex-wrap:wrap}.place-content-center{place-content:center}.items-center{align-items:center}.items-start{align-items:flex-start}.justify-between{justify-content:space-between}.justify-center{justify-content:center}.gap-1{gap:calc(var(--spacing)*1)}.gap-1\\.5{gap:calc(var(--spacing)*1.5)}.gap-2{gap:calc(var(--spacing)*2)}.gap-2\\.5{gap:calc(var(--spacing)*2.5)}.gap-3{gap:calc(var(--spacing)*3)}.gap-4{gap:calc(var(--spacing)*4)}.gap-6{gap:calc(var(--spacing)*6)}.gap-10{gap:calc(var(--spacing)*10)}.gap-12{gap:calc(var(--spacing)*12)}.gap-16{gap:calc(var(--spacing)*16)}:where(.space-y-0>:not(:last-child)){--tw-space-y-reverse:0;margin-block-start:calc(calc(var(--spacing)*0)*var(--tw-space-y-reverse));margin-block-end:calc(calc(var(--spacing)*0)*calc(1 - var(--tw-space-y-reverse)))}:where(.space-y-2>:not(:last-child)){--tw-space-y-reverse:0;margin-block-start:calc(calc(var(--spacing)*2)*var(--tw-space-y-reverse));margin-block-end:calc(calc(var(--spacing)*2)*calc(1 - var(--tw-space-y-reverse)))}:where(.space-y-4>:not(:last-child)){--tw-space-y-reverse:0;margin-block-start:calc(calc(var(--spacing)*4)*var(--tw-space-y-reverse));margin-block-end:calc(calc(var(--spacing)*4)*calc(1 - var(--tw-space-y-reverse)))}:where(.space-y-6>:not(:last-child)){--tw-space-y-reverse:0;margin-block-start:calc(calc(var(--spacing)*6)*var(--tw-space-y-reverse));margin-block-end:calc(calc(var(--spacing)*6)*calc(1 - var(--tw-space-y-reverse)))}:where(.space-x-2>:not(:last-child)){--tw-space-x-reverse:0;margin-inline-start:calc(calc(var(--spacing)*2)*var(--tw-space-x-reverse));margin-inline-end:calc(calc(var(--spacing)*2)*calc(1 - var(--tw-space-x-reverse)))}.truncate{text-overflow:ellipsis;white-space:nowrap;overflow:hidden}.overflow-auto{overflow:auto}.overflow-hidden{overflow:hidden}.overflow-x-auto{overflow-x:auto}.overflow-x-hidden{overflow-x:hidden}.overflow-y-auto{overflow-y:auto}.rounded{border-radius:.25rem}.rounded-2xl{border-radius:var(--radius-2xl)}.rounded-\\[4px\\]{border-radius:4px}.rounded-\\[5px\\]{border-radius:5px}.rounded-\\[7px\\]{border-radius:7px}.rounded-\\[var\\(--local-radius-lg\\)\\]{border-radius:var(--local-radius-lg)}.rounded-\\[var\\(--local-radius-md\\)\\]{border-radius:var(--local-radius-md)}.rounded-full{border-radius:3.40282e38px}.rounded-lg{border-radius:var(--radius-lg)}.rounded-md{border-radius:var(--radius-md)}.rounded-xl{border-radius:var(--radius-xl)}.border{border-style:var(--tw-border-style);border-width:1px}.border-2{border-style:var(--tw-border-style);border-width:2px}.border-t{border-top-style:var(--tw-border-style);border-top-width:1px}.border-b{border-bottom-style:var(--tw-border-style);border-bottom-width:1px}.border-l{border-left-style:var(--tw-border-style);border-left-width:1px}.border-dashed{--tw-border-style:dashed;border-style:dashed}.border-none{--tw-border-style:none;border-style:none}.border-solid{--tw-border-style:solid;border-style:solid}.border-\\[rgba\\(34\\,197\\,94\\,0\\.2\\)\\]{border-color:#22c55e33}.border-\\[rgba\\(34\\,197\\,94\\,0\\.3\\)\\]{border-color:#22c55e4d}.border-\\[rgba\\(59\\,130\\,246\\,0\\.2\\)\\]{border-color:#3b82f633}.border-\\[rgba\\(59\\,130\\,246\\,0\\.3\\)\\]{border-color:#3b82f64d}.border-\\[rgba\\(239\\,68\\,68\\,0\\.3\\)\\]{border-color:#ef44444d}.border-\\[rgba\\(245\\,158\\,11\\,0\\.3\\)\\]{border-color:#f59e0b4d}.border-\\[rgba\\(255\\,255\\,255\\,0\\.1\\)\\]{border-color:#ffffff1a}.border-\\[rgba\\(255\\,255\\,255\\,0\\.04\\)\\]{border-color:#ffffff0a}.border-\\[rgba\\(255\\,255\\,255\\,0\\.06\\)\\]{border-color:#ffffff0f}.border-\\[rgba\\(255\\,255\\,255\\,0\\.08\\)\\]{border-color:#ffffff14}.border-\\[rgba\\(255\\,255\\,255\\,0\\.12\\)\\]{border-color:#ffffff1f}.border-\\[var\\(--local-border\\)\\]{border-color:var(--local-border)}.border-blue-600{border-color:var(--color-blue-600)}.border-input{border-color:var(--color-input)}.border-red-500\\/20{border-color:#fb2c3633}@supports (color:color-mix(in lab,red,red)){.border-red-500\\/20{border-color:color-mix(in oklab,var(--color-red-500)20%,transparent)}}.border-red-900\\/30{border-color:#82181a4d}@supports (color:color-mix(in lab,red,red)){.border-red-900\\/30{border-color:color-mix(in oklab,var(--color-red-900)30%,transparent)}}.border-transparent{border-color:#0000}.border-zinc-700{border-color:var(--color-zinc-700)}.border-zinc-800{border-color:var(--color-zinc-800)}.border-zinc-800\\/50{border-color:#27272a80}@supports (color:color-mix(in lab,red,red)){.border-zinc-800\\/50{border-color:color-mix(in oklab,var(--color-zinc-800)50%,transparent)}}.bg-\\[\\#3b82f6\\]{background-color:#3b82f6}.bg-\\[\\#22c55e\\]{background-color:#22c55e}.bg-\\[\\#ef4444\\]{background-color:#ef4444}.bg-\\[\\#f59e0b\\]{background-color:#f59e0b}.bg-\\[rgba\\(34\\,197\\,94\\,0\\.08\\)\\]{background-color:#22c55e14}.bg-\\[rgba\\(34\\,211\\,238\\,0\\.1\\)\\]{background-color:#22d3ee1a}.bg-\\[rgba\\(59\\,130\\,246\\,0\\.1\\)\\]{background-color:#3b82f61a}.bg-\\[rgba\\(59\\,130\\,246\\,0\\.6\\)\\]{background-color:#3b82f699}.bg-\\[rgba\\(59\\,130\\,246\\,0\\.08\\)\\]{background-color:#3b82f614}.bg-\\[rgba\\(59\\,130\\,246\\,0\\.35\\)\\]{background-color:#3b82f659}.bg-\\[rgba\\(168\\,85\\,247\\,0\\.1\\)\\]{background-color:#a855f71a}.bg-\\[rgba\\(239\\,68\\,68\\,0\\.08\\)\\]{background-color:#ef444414}.bg-\\[rgba\\(245\\,158\\,11\\,0\\.08\\)\\]{background-color:#f59e0b14}.bg-\\[rgba\\(255\\,255\\,255\\,0\\.02\\)\\]{background-color:#ffffff05}.bg-\\[rgba\\(255\\,255\\,255\\,0\\.03\\)\\]{background-color:#ffffff08}.bg-\\[rgba\\(255\\,255\\,255\\,0\\.05\\)\\]{background-color:#ffffff0d}.bg-\\[rgba\\(255\\,255\\,255\\,0\\.015\\)\\]{background-color:#ffffff04}.bg-\\[var\\(--background\\)\\]{background-color:var(--background)}.bg-\\[var\\(--color-background\\)\\]{background-color:var(--color-background)}.bg-\\[var\\(--local-accent\\)\\]{background-color:var(--local-accent)}.bg-\\[var\\(--local-bg\\)\\]{background-color:var(--local-bg)}.bg-\\[var\\(--local-deep\\)\\]{background-color:var(--local-deep)}.bg-\\[var\\(--local-primary\\)\\]{background-color:var(--local-primary)}.bg-\\[var\\(--local-surface\\)\\]{background-color:var(--local-surface)}.bg-\\[var\\(--local-surface-alt\\)\\]{background-color:var(--local-surface-alt)}.bg-amber-500{background-color:var(--color-amber-500)}.bg-background{background-color:var(--color-background)}.bg-black\\/20{background-color:#0003}@supports (color:color-mix(in lab,red,red)){.bg-black\\/20{background-color:color-mix(in oklab,var(--color-black)20%,transparent)}}.bg-blue-500{background-color:var(--color-blue-500)}.bg-blue-500\\/5{background-color:#3080ff0d}@supports (color:color-mix(in lab,red,red)){.bg-blue-500\\/5{background-color:color-mix(in oklab,var(--color-blue-500)5%,transparent)}}.bg-blue-500\\/20{background-color:#3080ff33}@supports (color:color-mix(in lab,red,red)){.bg-blue-500\\/20{background-color:color-mix(in oklab,var(--color-blue-500)20%,transparent)}}.bg-blue-600{background-color:var(--color-blue-600)}.bg-blue-600\\/10{background-color:#155dfc1a}@supports (color:color-mix(in lab,red,red)){.bg-blue-600\\/10{background-color:color-mix(in oklab,var(--color-blue-600)10%,transparent)}}.bg-border{background-color:var(--color-border)}.bg-emerald-500{background-color:var(--color-emerald-500)}.bg-popover{background-color:var(--color-popover)}.bg-red-500\\/10{background-color:#fb2c361a}@supports (color:color-mix(in lab,red,red)){.bg-red-500\\/10{background-color:color-mix(in oklab,var(--color-red-500)10%,transparent)}}.bg-red-900\\/10{background-color:#82181a1a}@supports (color:color-mix(in lab,red,red)){.bg-red-900\\/10{background-color:color-mix(in oklab,var(--color-red-900)10%,transparent)}}.bg-transparent{background-color:#0000}.bg-zinc-800{background-color:var(--color-zinc-800)}.bg-zinc-900{background-color:var(--color-zinc-900)}.bg-zinc-900\\/20{background-color:#18181b33}@supports (color:color-mix(in lab,red,red)){.bg-zinc-900\\/20{background-color:color-mix(in oklab,var(--color-zinc-900)20%,transparent)}}.bg-zinc-900\\/40{background-color:#18181b66}@supports (color:color-mix(in lab,red,red)){.bg-zinc-900\\/40{background-color:color-mix(in oklab,var(--color-zinc-900)40%,transparent)}}.bg-zinc-900\\/50{background-color:#18181b80}@supports (color:color-mix(in lab,red,red)){.bg-zinc-900\\/50{background-color:color-mix(in oklab,var(--color-zinc-900)50%,transparent)}}.bg-zinc-900\\/60{background-color:#18181b99}@supports (color:color-mix(in lab,red,red)){.bg-zinc-900\\/60{background-color:color-mix(in oklab,var(--color-zinc-900)60%,transparent)}}.bg-zinc-950{background-color:var(--color-zinc-950)}.bg-gradient-to-b{--tw-gradient-position:to bottom in oklab;background-image:linear-gradient(var(--tw-gradient-stops))}.bg-gradient-to-br{--tw-gradient-position:to bottom right in oklab;background-image:linear-gradient(var(--tw-gradient-stops))}.bg-gradient-to-r{--tw-gradient-position:to right in oklab;background-image:linear-gradient(var(--tw-gradient-stops))}.bg-\\[radial-gradient\\(circle\\,rgba\\(34\\,211\\,238\\,0\\.03\\)_0\\%\\,transparent_60\\%\\)\\]{background-image:radial-gradient(circle,#22d3ee08,#0000 60%)}.bg-\\[radial-gradient\\(circle\\,rgba\\(59\\,130\\,246\\,0\\.06\\)_0\\%\\,transparent_70\\%\\)\\]{background-image:radial-gradient(circle,#3b82f60f,#0000 70%)}.bg-\\[radial-gradient\\(circle\\,rgba\\(59\\,130\\,246\\,0\\.08\\)_0\\%\\,transparent_60\\%\\)\\]{background-image:radial-gradient(circle,#3b82f614,#0000 60%)}.from-\\[rgba\\(59\\,130\\,246\\,0\\.06\\)\\]{--tw-gradient-from:#3b82f60f;--tw-gradient-stops:var(--tw-gradient-via-stops,var(--tw-gradient-position),var(--tw-gradient-from)var(--tw-gradient-from-position),var(--tw-gradient-to)var(--tw-gradient-to-position))}.from-\\[var\\(--local-accent\\)\\]{--tw-gradient-from:var(--local-accent);--tw-gradient-stops:var(--tw-gradient-via-stops,var(--tw-gradient-position),var(--tw-gradient-from)var(--tw-gradient-from-position),var(--tw-gradient-to)var(--tw-gradient-to-position))}.from-\\[var\\(--local-bg\\)\\]{--tw-gradient-from:var(--local-bg);--tw-gradient-stops:var(--tw-gradient-via-stops,var(--tw-gradient-position),var(--tw-gradient-from)var(--tw-gradient-from-position),var(--tw-gradient-to)var(--tw-gradient-to-position))}.from-\\[var\\(--local-primary\\)\\]{--tw-gradient-from:var(--local-primary);--tw-gradient-stops:var(--tw-gradient-via-stops,var(--tw-gradient-position),var(--tw-gradient-from)var(--tw-gradient-from-position),var(--tw-gradient-to)var(--tw-gradient-to-position))}.from-transparent{--tw-gradient-from:transparent;--tw-gradient-stops:var(--tw-gradient-via-stops,var(--tw-gradient-position),var(--tw-gradient-from)var(--tw-gradient-from-position),var(--tw-gradient-to)var(--tw-gradient-to-position))}.via-\\[rgba\\(59\\,130\\,246\\,0\\.1\\)\\]{--tw-gradient-via:#3b82f61a;--tw-gradient-via-stops:var(--tw-gradient-position),var(--tw-gradient-from)var(--tw-gradient-from-position),var(--tw-gradient-via)var(--tw-gradient-via-position),var(--tw-gradient-to)var(--tw-gradient-to-position);--tw-gradient-stops:var(--tw-gradient-via-stops)}.via-\\[rgba\\(59\\,130\\,246\\,0\\.15\\)\\]{--tw-gradient-via:#3b82f626;--tw-gradient-via-stops:var(--tw-gradient-position),var(--tw-gradient-from)var(--tw-gradient-from-position),var(--tw-gradient-via)var(--tw-gradient-via-position),var(--tw-gradient-to)var(--tw-gradient-to-position);--tw-gradient-stops:var(--tw-gradient-via-stops)}.to-\\[\\#22d3ee\\]{--tw-gradient-to:#22d3ee;--tw-gradient-stops:var(--tw-gradient-via-stops,var(--tw-gradient-position),var(--tw-gradient-from)var(--tw-gradient-from-position),var(--tw-gradient-to)var(--tw-gradient-to-position))}.to-\\[rgba\\(59\\,130\\,246\\,0\\.01\\)\\]{--tw-gradient-to:#3b82f603;--tw-gradient-stops:var(--tw-gradient-via-stops,var(--tw-gradient-position),var(--tw-gradient-from)var(--tw-gradient-from-position),var(--tw-gradient-to)var(--tw-gradient-to-position))}.to-\\[var\\(--local-accent\\)\\]{--tw-gradient-to:var(--local-accent);--tw-gradient-stops:var(--tw-gradient-via-stops,var(--tw-gradient-position),var(--tw-gradient-from)var(--tw-gradient-from-position),var(--tw-gradient-to)var(--tw-gradient-to-position))}.to-\\[var\\(--local-cyan\\)\\]{--tw-gradient-to:var(--local-cyan);--tw-gradient-stops:var(--tw-gradient-via-stops,var(--tw-gradient-position),var(--tw-gradient-from)var(--tw-gradient-from-position),var(--tw-gradient-to)var(--tw-gradient-to-position))}.to-\\[var\\(--local-surface\\)\\]{--tw-gradient-to:var(--local-surface);--tw-gradient-stops:var(--tw-gradient-via-stops,var(--tw-gradient-position),var(--tw-gradient-from)var(--tw-gradient-from-position),var(--tw-gradient-to)var(--tw-gradient-to-position))}.to-transparent{--tw-gradient-to:transparent;--tw-gradient-stops:var(--tw-gradient-via-stops,var(--tw-gradient-position),var(--tw-gradient-from)var(--tw-gradient-from-position),var(--tw-gradient-to)var(--tw-gradient-to-position))}.bg-clip-text{-webkit-background-clip:text;background-clip:text}.p-1{padding:calc(var(--spacing)*1)}.p-1\\.5{padding:calc(var(--spacing)*1.5)}.p-2{padding:calc(var(--spacing)*2)}.p-4{padding:calc(var(--spacing)*4)}.p-6{padding:calc(var(--spacing)*6)}.p-8{padding:calc(var(--spacing)*8)}.p-10{padding:calc(var(--spacing)*10)}.p-12{padding:calc(var(--spacing)*12)}.px-1\\.5{padding-inline:calc(var(--spacing)*1.5)}.px-2{padding-inline:calc(var(--spacing)*2)}.px-2\\.5{padding-inline:calc(var(--spacing)*2.5)}.px-3{padding-inline:calc(var(--spacing)*3)}.px-4{padding-inline:calc(var(--spacing)*4)}.px-5{padding-inline:calc(var(--spacing)*5)}.px-6{padding-inline:calc(var(--spacing)*6)}.px-8{padding-inline:calc(var(--spacing)*8)}.py-1{padding-block:calc(var(--spacing)*1)}.py-1\\.5{padding-block:calc(var(--spacing)*1.5)}.py-2{padding-block:calc(var(--spacing)*2)}.py-2\\.5{padding-block:calc(var(--spacing)*2.5)}.py-3{padding-block:calc(var(--spacing)*3)}.py-3\\.5{padding-block:calc(var(--spacing)*3.5)}.py-4{padding-block:calc(var(--spacing)*4)}.py-12{padding-block:calc(var(--spacing)*12)}.py-16{padding-block:calc(var(--spacing)*16)}.py-20{padding-block:calc(var(--spacing)*20)}.py-28{padding-block:calc(var(--spacing)*28)}.pt-12{padding-top:calc(var(--spacing)*12)}.pt-24{padding-top:calc(var(--spacing)*24)}.pr-2{padding-right:calc(var(--spacing)*2)}.pr-8{padding-right:calc(var(--spacing)*8)}.pb-6{padding-bottom:calc(var(--spacing)*6)}.pl-1\\.5{padding-left:calc(var(--spacing)*1.5)}.pl-2\\.5{padding-left:calc(var(--spacing)*2.5)}.pl-6{padding-left:calc(var(--spacing)*6)}.text-center{text-align:center}.text-left{text-align:left}.text-right{text-align:right}.font-mono{font-family:var(--font-mono)}.text-2xl{font-size:var(--text-2xl);line-height:var(--tw-leading,var(--text-2xl--line-height))}.text-3xl{font-size:var(--text-3xl);line-height:var(--tw-leading,var(--text-3xl--line-height))}.text-6xl{font-size:var(--text-6xl);line-height:var(--tw-leading,var(--text-6xl--line-height))}.text-base{font-size:var(--text-base);line-height:var(--tw-leading,var(--text-base--line-height))}.text-lg{font-size:var(--text-lg);line-height:var(--tw-leading,var(--text-lg--line-height))}.text-sm{font-size:var(--text-sm);line-height:var(--tw-leading,var(--text-sm--line-height))}.text-xl{font-size:var(--text-xl);line-height:var(--tw-leading,var(--text-xl--line-height))}.text-xs{font-size:var(--text-xs);line-height:var(--tw-leading,var(--text-xs--line-height))}.text-\\[0\\.7rem\\]{font-size:.7rem}.text-\\[0\\.8rem\\]{font-size:.8rem}.text-\\[0\\.9rem\\]{font-size:.9rem}.text-\\[0\\.72rem\\]{font-size:.72rem}.text-\\[0\\.75rem\\]{font-size:.75rem}.text-\\[0\\.78rem\\]{font-size:.78rem}.text-\\[0\\.82rem\\]{font-size:.82rem}.text-\\[0\\.85rem\\]{font-size:.85rem}.text-\\[0\\.92rem\\]{font-size:.92rem}.text-\\[0\\.95rem\\]{font-size:.95rem}.text-\\[1\\.05rem\\]{font-size:1.05rem}.text-\\[2\\.2rem\\]{font-size:2.2rem}.text-\\[2rem\\]{font-size:2rem}.text-\\[9px\\]{font-size:9px}.text-\\[10px\\]{font-size:10px}.text-\\[11px\\]{font-size:11px}.text-\\[clamp\\(1\\.6rem\\,3vw\\,2\\.4rem\\)\\]{font-size:clamp(1.6rem,3vw,2.4rem)}.text-\\[clamp\\(2\\.8rem\\,6vw\\,4\\.8rem\\)\\]{font-size:clamp(2.8rem,6vw,4.8rem)}.text-\\[clamp\\(2rem\\,4vw\\,3\\.2rem\\)\\]{font-size:clamp(2rem,4vw,3.2rem)}.leading-\\[1\\.7\\]{--tw-leading:1.7;line-height:1.7}.leading-\\[1\\.08\\]{--tw-leading:1.08;line-height:1.08}.leading-\\[1\\.15\\]{--tw-leading:1.15;line-height:1.15}.leading-\\[1\\.35\\]{--tw-leading:1.35;line-height:1.35}.leading-none{--tw-leading:1;line-height:1}.leading-relaxed{--tw-leading:var(--leading-relaxed);line-height:var(--leading-relaxed)}.font-black{--tw-font-weight:var(--font-weight-black);font-weight:var(--font-weight-black)}.font-bold{--tw-font-weight:var(--font-weight-bold);font-weight:var(--font-weight-bold)}.font-extrabold{--tw-font-weight:var(--font-weight-extrabold);font-weight:var(--font-weight-extrabold)}.font-medium{--tw-font-weight:var(--font-weight-medium);font-weight:var(--font-weight-medium)}.font-normal{--tw-font-weight:var(--font-weight-normal);font-weight:var(--font-weight-normal)}.font-semibold{--tw-font-weight:var(--font-weight-semibold);font-weight:var(--font-weight-semibold)}.tracking-\\[0\\.1em\\]{--tw-tracking:.1em;letter-spacing:.1em}.tracking-\\[0\\.2em\\]{--tw-tracking:.2em;letter-spacing:.2em}.tracking-\\[0\\.12em\\]{--tw-tracking:.12em;letter-spacing:.12em}.tracking-tight{--tw-tracking:var(--tracking-tight);letter-spacing:var(--tracking-tight)}.tracking-wide{--tw-tracking:var(--tracking-wide);letter-spacing:var(--tracking-wide)}.tracking-wider{--tw-tracking:var(--tracking-wider);letter-spacing:var(--tracking-wider)}.tracking-widest{--tw-tracking:var(--tracking-widest);letter-spacing:var(--tracking-widest)}.whitespace-nowrap{white-space:nowrap}.whitespace-pre-wrap{white-space:pre-wrap}.text-\\[\\#4ade80\\]{color:#4ade80}.text-\\[\\#22d3ee\\]{color:#22d3ee}.text-\\[\\#60a5fa\\]{color:#60a5fa}.text-\\[\\#64748b\\]{color:#64748b}.text-\\[\\#c084fc\\]{color:#c084fc}.text-\\[\\#cbd5e1\\]{color:#cbd5e1}.text-\\[\\#e2e8f0\\]{color:#e2e8f0}.text-\\[\\#f472b6\\]{color:#f472b6}.text-\\[\\#f87171\\]{color:#f87171}.text-\\[\\#fbbf24\\]{color:#fbbf24}.text-\\[var\\(--background\\)\\]{color:var(--background)}.text-\\[var\\(--foreground\\)\\]{color:var(--foreground)}.text-\\[var\\(--local-accent\\)\\]{color:var(--local-accent)}.text-\\[var\\(--local-bg\\)\\]{color:var(--local-bg)}.text-\\[var\\(--local-text\\)\\]{color:var(--local-text)}.text-\\[var\\(--local-text-muted\\)\\],.text-\\[var\\(--local-text-muted\\)\\]\\/50{color:var(--local-text-muted)}@supports (color:color-mix(in lab,red,red)){.text-\\[var\\(--local-text-muted\\)\\]\\/50{color:color-mix(in oklab,var(--local-text-muted)50%,transparent)}}.text-\\[var\\(--local-text-muted\\)\\]\\/60{color:var(--local-text-muted)}@supports (color:color-mix(in lab,red,red)){.text-\\[var\\(--local-text-muted\\)\\]\\/60{color:color-mix(in oklab,var(--local-text-muted)60%,transparent)}}.text-\\[var\\(--muted-foreground\\)\\]{color:var(--muted-foreground)}.text-amber-500{color:var(--color-amber-500)}.text-blue-400{color:var(--color-blue-400)}.text-blue-500{color:var(--color-blue-500)}.text-current{color:currentColor}.text-foreground{color:var(--color-foreground)}.text-muted-foreground{color:var(--color-muted-foreground)}.text-popover-foreground{color:var(--color-popover-foreground)}.text-red-400{color:var(--color-red-400)}.text-transparent{color:#0000}.text-white{color:var(--color-white)}.text-zinc-100{color:var(--color-zinc-100)}.text-zinc-200{color:var(--color-zinc-200)}.text-zinc-300{color:var(--color-zinc-300)}.text-zinc-400{color:var(--color-zinc-400)}.text-zinc-500{color:var(--color-zinc-500)}.text-zinc-600{color:var(--color-zinc-600)}.capitalize{text-transform:capitalize}.uppercase{text-transform:uppercase}.italic{font-style:italic}.not-italic{font-style:normal}.no-underline{text-decoration-line:none}.opacity-0{opacity:0}.opacity-20{opacity:.2}.opacity-50{opacity:.5}.opacity-60{opacity:.6}.opacity-70{opacity:.7}.shadow-2xl{--tw-shadow:0 25px 50px -12px var(--tw-shadow-color,#00000040);box-shadow:var(--tw-inset-shadow),var(--tw-inset-ring-shadow),var(--tw-ring-offset-shadow),var(--tw-ring-shadow),var(--tw-shadow)}.shadow-\\[0_0_8px_rgba\\(245\\,158\\,11\\,0\\.5\\)\\]{--tw-shadow:0 0 8px var(--tw-shadow-color,#f59e0b80);box-shadow:var(--tw-inset-shadow),var(--tw-inset-ring-shadow),var(--tw-ring-offset-shadow),var(--tw-ring-shadow),var(--tw-shadow)}.shadow-lg{--tw-shadow:0 10px 15px -3px var(--tw-shadow-color,#0000001a),0 4px 6px -4px var(--tw-shadow-color,#0000001a);box-shadow:var(--tw-inset-shadow),var(--tw-inset-ring-shadow),var(--tw-ring-offset-shadow),var(--tw-ring-shadow),var(--tw-shadow)}.shadow-md{--tw-shadow:0 4px 6px -1px var(--tw-shadow-color,#0000001a),0 2px 4px -2px var(--tw-shadow-color,#0000001a);box-shadow:var(--tw-inset-shadow),var(--tw-inset-ring-shadow),var(--tw-ring-offset-shadow),var(--tw-ring-shadow),var(--tw-shadow)}.ring-1{--tw-ring-shadow:var(--tw-ring-inset,)0 0 0 calc(1px + var(--tw-ring-offset-width))var(--tw-ring-color,currentcolor);box-shadow:var(--tw-inset-shadow),var(--tw-inset-ring-shadow),var(--tw-ring-offset-shadow),var(--tw-ring-shadow),var(--tw-shadow)}.shadow-blue-900\\/20{--tw-shadow-color:#1c398e33}@supports (color:color-mix(in lab,red,red)){.shadow-blue-900\\/20{--tw-shadow-color:color-mix(in oklab,color-mix(in oklab,var(--color-blue-900)20%,transparent)var(--tw-shadow-alpha),transparent)}}.ring-foreground\\/10{--tw-ring-color:var(--color-foreground)}@supports (color:color-mix(in lab,red,red)){.ring-foreground\\/10{--tw-ring-color:color-mix(in oklab,var(--color-foreground)10%,transparent)}}.outline-hidden{--tw-outline-style:none;outline-style:none}@media(forced-colors:active){.outline-hidden{outline-offset:2px;outline:2px solid #0000}}.blur-xl{--tw-blur:blur(var(--blur-xl));filter:var(--tw-blur,)var(--tw-brightness,)var(--tw-contrast,)var(--tw-grayscale,)var(--tw-hue-rotate,)var(--tw-invert,)var(--tw-saturate,)var(--tw-sepia,)var(--tw-drop-shadow,)}.backdrop-blur-\\[20px\\]{--tw-backdrop-blur:blur(20px);-webkit-backdrop-filter:var(--tw-backdrop-blur,)var(--tw-backdrop-brightness,)var(--tw-backdrop-contrast,)var(--tw-backdrop-grayscale,)var(--tw-backdrop-hue-rotate,)var(--tw-backdrop-invert,)var(--tw-backdrop-opacity,)var(--tw-backdrop-saturate,)var(--tw-backdrop-sepia,);backdrop-filter:var(--tw-backdrop-blur,)var(--tw-backdrop-brightness,)var(--tw-backdrop-contrast,)var(--tw-backdrop-grayscale,)var(--tw-backdrop-hue-rotate,)var(--tw-backdrop-invert,)var(--tw-backdrop-opacity,)var(--tw-backdrop-saturate,)var(--tw-backdrop-sepia,)}.transition-all{transition-property:all;transition-timing-function:var(--tw-ease,var(--default-transition-timing-function));transition-duration:var(--tw-duration,var(--default-transition-duration))}.transition-colors{transition-property:color,background-color,border-color,outline-color,text-decoration-color,fill,stroke,--tw-gradient-from,--tw-gradient-via,--tw-gradient-to;transition-timing-function:var(--tw-ease,var(--default-transition-timing-function));transition-duration:var(--tw-duration,var(--default-transition-duration))}.transition-opacity{transition-property:opacity;transition-timing-function:var(--tw-ease,var(--default-transition-timing-function));transition-duration:var(--tw-duration,var(--default-transition-duration))}.transition-none{transition-property:none}.duration-100{--tw-duration:.1s;transition-duration:.1s}.duration-200{--tw-duration:.2s;transition-duration:.2s}.duration-300{--tw-duration:.3s;transition-duration:.3s}.outline-none{--tw-outline-style:none;outline-style:none}.select-none{-webkit-user-select:none;user-select:none}@media(hover:hover){.group-hover\\:border-dashed:is(:where(.group):hover *){--tw-border-style:dashed;border-style:dashed}.group-hover\\:border-blue-400\\/50:is(:where(.group):hover *){border-color:#54a2ff80}@supports (color:color-mix(in lab,red,red)){.group-hover\\:border-blue-400\\/50:is(:where(.group):hover *){border-color:color-mix(in oklab,var(--color-blue-400)50%,transparent)}}.group-hover\\:border-blue-500\\/30:is(:where(.group):hover *){border-color:#3080ff4d}@supports (color:color-mix(in lab,red,red)){.group-hover\\:border-blue-500\\/30:is(:where(.group):hover *){border-color:color-mix(in oklab,var(--color-blue-500)30%,transparent)}}.group-hover\\:text-blue-400:is(:where(.group):hover *){color:var(--color-blue-400)}.group-hover\\:opacity-100:is(:where(.group):hover *){opacity:1}}.group-has-disabled\\/field\\:opacity-50:is(:where(.group\\/field):has(:disabled) *){opacity:.5}.group-data-\\[disabled\\=true\\]\\:pointer-events-none:is(:where(.group)[data-disabled=true] *){pointer-events:none}.group-data-\\[disabled\\=true\\]\\:opacity-50:is(:where(.group)[data-disabled=true] *){opacity:.5}.peer-disabled\\:cursor-not-allowed:is(:where(.peer):disabled~*){cursor:not-allowed}.peer-disabled\\:opacity-50:is(:where(.peer):disabled~*){opacity:.5}.file\\:inline-flex::file-selector-button{display:inline-flex}.file\\:h-6::file-selector-button{height:calc(var(--spacing)*6)}.file\\:border-0::file-selector-button{border-style:var(--tw-border-style);border-width:0}.file\\:bg-transparent::file-selector-button{background-color:#0000}.file\\:text-sm::file-selector-button{font-size:var(--text-sm);line-height:var(--tw-leading,var(--text-sm--line-height))}.file\\:font-medium::file-selector-button{--tw-font-weight:var(--font-weight-medium);font-weight:var(--font-weight-medium)}.file\\:text-foreground::file-selector-button{color:var(--color-foreground)}.placeholder\\:text-muted-foreground::placeholder{color:var(--color-muted-foreground)}.before\\:absolute:before{content:var(--tw-content);position:absolute}.before\\:left-0:before{content:var(--tw-content);left:calc(var(--spacing)*0)}.before\\:text-\\[0\\.8rem\\]:before{content:var(--tw-content);font-size:.8rem}.before\\:font-bold:before{content:var(--tw-content);--tw-font-weight:var(--font-weight-bold);font-weight:var(--font-weight-bold)}.before\\:text-\\[var\\(--local-accent\\)\\]:before{content:var(--tw-content);color:var(--local-accent)}.before\\:content-\\[\\'✓\\'\\]:before{--tw-content:"✓";content:var(--tw-content)}.after\\:absolute:after{content:var(--tw-content);position:absolute}.after\\:-inset-x-3:after{content:var(--tw-content);inset-inline:calc(var(--spacing)*-3)}.after\\:-inset-y-2:after{content:var(--tw-content);inset-block:calc(var(--spacing)*-2)}@media(hover:hover){.hover\\:translate-x-1\\.5:hover{--tw-translate-x:calc(var(--spacing)*1.5);translate:var(--tw-translate-x)var(--tw-translate-y)}.hover\\:-translate-y-0\\.5:hover{--tw-translate-y:calc(var(--spacing)*-.5);translate:var(--tw-translate-x)var(--tw-translate-y)}.hover\\:-translate-y-1:hover{--tw-translate-y:calc(var(--spacing)*-1);translate:var(--tw-translate-x)var(--tw-translate-y)}.hover\\:-translate-y-px:hover{--tw-translate-y:-1px;translate:var(--tw-translate-x)var(--tw-translate-y)}.hover\\:border-\\[rgba\\(59\\,130\\,246\\,0\\.2\\)\\]:hover{border-color:#3b82f633}.hover\\:border-\\[rgba\\(59\\,130\\,246\\,0\\.4\\)\\]:hover{border-color:#3b82f666}.hover\\:border-\\[rgba\\(255\\,255\\,255\\,0\\.2\\)\\]:hover{border-color:#fff3}.hover\\:border-\\[rgba\\(255\\,255\\,255\\,0\\.3\\)\\]:hover{border-color:#ffffff4d}.hover\\:border-zinc-600:hover{border-color:var(--color-zinc-600)}.hover\\:border-zinc-700:hover{border-color:var(--color-zinc-700)}.hover\\:bg-\\[rgba\\(59\\,130\\,246\\,0\\.03\\)\\]:hover{background-color:#3b82f608}.hover\\:bg-\\[rgba\\(255\\,255\\,255\\,0\\.04\\)\\]:hover{background-color:#ffffff0a}.hover\\:bg-\\[rgba\\(255\\,255\\,255\\,0\\.08\\)\\]:hover{background-color:#ffffff14}.hover\\:bg-blue-500:hover{background-color:var(--color-blue-500)}.hover\\:bg-blue-600\\/20:hover{background-color:#155dfc33}@supports (color:color-mix(in lab,red,red)){.hover\\:bg-blue-600\\/20:hover{background-color:color-mix(in oklab,var(--color-blue-600)20%,transparent)}}.hover\\:bg-zinc-800:hover{background-color:var(--color-zinc-800)}.hover\\:text-\\[var\\(--local-accent\\)\\]:hover{color:var(--local-accent)}.hover\\:text-\\[var\\(--local-text\\)\\]:hover{color:var(--local-text)}.hover\\:text-blue-400:hover{color:var(--color-blue-400)}.hover\\:text-red-500:hover{color:var(--color-red-500)}.hover\\:text-white:hover{color:var(--color-white)}.hover\\:opacity-90:hover{opacity:.9}.hover\\:shadow-\\[0_8px_30px_rgba\\(59\\,130\\,246\\,0\\.3\\)\\]:hover{--tw-shadow:0 8px 30px var(--tw-shadow-color,#3b82f64d);box-shadow:var(--tw-inset-shadow),var(--tw-inset-ring-shadow),var(--tw-ring-offset-shadow),var(--tw-ring-shadow),var(--tw-shadow)}.hover\\:brightness-110:hover{--tw-brightness:brightness(110%);filter:var(--tw-blur,)var(--tw-brightness,)var(--tw-contrast,)var(--tw-grayscale,)var(--tw-hue-rotate,)var(--tw-invert,)var(--tw-saturate,)var(--tw-sepia,)var(--tw-drop-shadow,)}}.focus\\:bg-accent:focus{background-color:var(--color-accent)}.focus\\:text-accent-foreground:focus{color:var(--color-accent-foreground)}.focus\\:ring-blue-600:focus{--tw-ring-color:var(--color-blue-600)}:is(.not-data-\\[variant\\=destructive\\]\\:focus\\:\\*\\*\\:text-accent-foreground:not([data-variant=destructive]):focus *){color:var(--color-accent-foreground)}.focus-visible\\:border-ring:focus-visible{border-color:var(--color-ring)}.focus-visible\\:ring-3:focus-visible{--tw-ring-shadow:var(--tw-ring-inset,)0 0 0 calc(3px + var(--tw-ring-offset-width))var(--tw-ring-color,currentcolor);box-shadow:var(--tw-inset-shadow),var(--tw-inset-ring-shadow),var(--tw-ring-offset-shadow),var(--tw-ring-shadow),var(--tw-shadow)}.focus-visible\\:ring-blue-600:focus-visible{--tw-ring-color:var(--color-blue-600)}.focus-visible\\:ring-ring\\/50:focus-visible{--tw-ring-color:var(--color-ring)}@supports (color:color-mix(in lab,red,red)){.focus-visible\\:ring-ring\\/50:focus-visible{--tw-ring-color:color-mix(in oklab,var(--color-ring)50%,transparent)}}.active\\:scale-\\[0\\.98\\]:active{scale:.98}.disabled\\:pointer-events-none:disabled{pointer-events:none}.disabled\\:cursor-not-allowed:disabled{cursor:not-allowed}.disabled\\:bg-input\\/50:disabled{background-color:var(--color-input)}@supports (color:color-mix(in lab,red,red)){.disabled\\:bg-input\\/50:disabled{background-color:color-mix(in oklab,var(--color-input)50%,transparent)}}.disabled\\:opacity-20:disabled{opacity:.2}.disabled\\:opacity-50:disabled{opacity:.5}.aria-invalid\\:border-destructive[aria-invalid=true]{border-color:var(--color-destructive)}.aria-invalid\\:ring-3[aria-invalid=true]{--tw-ring-shadow:var(--tw-ring-inset,)0 0 0 calc(3px + var(--tw-ring-offset-width))var(--tw-ring-color,currentcolor);box-shadow:var(--tw-inset-shadow),var(--tw-inset-ring-shadow),var(--tw-ring-offset-shadow),var(--tw-ring-shadow),var(--tw-shadow)}.aria-invalid\\:ring-destructive\\/20[aria-invalid=true]{--tw-ring-color:var(--color-destructive)}@supports (color:color-mix(in lab,red,red)){.aria-invalid\\:ring-destructive\\/20[aria-invalid=true]{--tw-ring-color:color-mix(in oklab,var(--color-destructive)20%,transparent)}}.aria-invalid\\:aria-checked\\:border-primary[aria-invalid=true][aria-checked=true],.data-checked\\:border-primary[data-checked]{border-color:var(--color-primary)}.data-checked\\:bg-primary[data-checked]{background-color:var(--color-primary)}.data-checked\\:text-primary-foreground[data-checked]{color:var(--color-primary-foreground)}.data-disabled\\:pointer-events-none[data-disabled]{pointer-events:none}.data-disabled\\:opacity-50[data-disabled]{opacity:.5}.data-horizontal\\:h-px[data-horizontal]{height:1px}.data-horizontal\\:w-full[data-horizontal]{width:100%}.data-placeholder\\:text-muted-foreground[data-placeholder]{color:var(--color-muted-foreground)}.data-vertical\\:w-px[data-vertical]{width:1px}.data-vertical\\:self-stretch[data-vertical]{align-self:stretch}.data-\\[align-trigger\\=true\\]\\:animate-none[data-align-trigger=true]{animation:none}.data-\\[side\\=bottom\\]\\:translate-y-1[data-side=bottom]{--tw-translate-y:calc(var(--spacing)*1);translate:var(--tw-translate-x)var(--tw-translate-y)}.data-\\[side\\=left\\]\\:-translate-x-1[data-side=left]{--tw-translate-x:calc(var(--spacing)*-1);translate:var(--tw-translate-x)var(--tw-translate-y)}.data-\\[side\\=right\\]\\:translate-x-1[data-side=right]{--tw-translate-x:calc(var(--spacing)*1);translate:var(--tw-translate-x)var(--tw-translate-y)}.data-\\[side\\=top\\]\\:-translate-y-1[data-side=top]{--tw-translate-y:calc(var(--spacing)*-1);translate:var(--tw-translate-x)var(--tw-translate-y)}.data-\\[size\\=default\\]\\:h-8[data-size=default]{height:calc(var(--spacing)*8)}.data-\\[size\\=sm\\]\\:h-7[data-size=sm]{height:calc(var(--spacing)*7)}.data-\\[size\\=sm\\]\\:rounded-\\[min\\(var\\(--radius-md\\)\\,10px\\)\\][data-size=sm]{border-radius:min(var(--radius-md),10px)}:is(.\\*\\:data-\\[slot\\=select-value\\]\\:line-clamp-1>*)[data-slot=select-value]{-webkit-line-clamp:1;-webkit-box-orient:vertical;display:-webkit-box;overflow:hidden}:is(.\\*\\:data-\\[slot\\=select-value\\]\\:flex>*)[data-slot=select-value]{display:flex}:is(.\\*\\:data-\\[slot\\=select-value\\]\\:items-center>*)[data-slot=select-value]{align-items:center}:is(.\\*\\:data-\\[slot\\=select-value\\]\\:gap-1\\.5>*)[data-slot=select-value]{gap:calc(var(--spacing)*1.5)}@media(min-width:48rem){.md\\:flex{display:flex}.md\\:hidden{display:none}.md\\:grid-cols-2{grid-template-columns:repeat(2,minmax(0,1fr))}.md\\:grid-cols-3{grid-template-columns:repeat(3,minmax(0,1fr))}.md\\:grid-cols-4{grid-template-columns:repeat(4,minmax(0,1fr))}.md\\:flex-row{flex-direction:row}.md\\:text-4xl{font-size:var(--text-4xl);line-height:var(--tw-leading,var(--text-4xl--line-height))}.md\\:text-sm{font-size:var(--text-sm);line-height:var(--tw-leading,var(--text-sm--line-height))}}@media(min-width:64rem){.lg\\:grid-cols-2{grid-template-columns:repeat(2,minmax(0,1fr))}.lg\\:grid-cols-3{grid-template-columns:repeat(3,minmax(0,1fr))}}@media(prefers-color-scheme:dark){.dark\\:bg-input\\/30{background-color:var(--color-input)}@supports (color:color-mix(in lab,red,red)){.dark\\:bg-input\\/30{background-color:color-mix(in oklab,var(--color-input)30%,transparent)}}@media(hover:hover){.dark\\:hover\\:bg-input\\/50:hover{background-color:var(--color-input)}@supports (color:color-mix(in lab,red,red)){.dark\\:hover\\:bg-input\\/50:hover{background-color:color-mix(in oklab,var(--color-input)50%,transparent)}}}.dark\\:disabled\\:bg-input\\/80:disabled{background-color:var(--color-input)}@supports (color:color-mix(in lab,red,red)){.dark\\:disabled\\:bg-input\\/80:disabled{background-color:color-mix(in oklab,var(--color-input)80%,transparent)}}.dark\\:aria-invalid\\:border-destructive\\/50[aria-invalid=true]{border-color:var(--color-destructive)}@supports (color:color-mix(in lab,red,red)){.dark\\:aria-invalid\\:border-destructive\\/50[aria-invalid=true]{border-color:color-mix(in oklab,var(--color-destructive)50%,transparent)}}.dark\\:aria-invalid\\:ring-destructive\\/40[aria-invalid=true]{--tw-ring-color:var(--color-destructive)}@supports (color:color-mix(in lab,red,red)){.dark\\:aria-invalid\\:ring-destructive\\/40[aria-invalid=true]{--tw-ring-color:color-mix(in oklab,var(--color-destructive)40%,transparent)}}.dark\\:data-checked\\:bg-primary[data-checked]{background-color:var(--color-primary)}}.\\[\\&_svg\\]\\:pointer-events-none svg{pointer-events:none}.\\[\\&_svg\\]\\:shrink-0 svg{flex-shrink:0}.\\[\\&_svg\\:not\\(\\[class\\*\\=\\'size-\\'\\]\\)\\]\\:size-4 svg:not([class*=size-]){width:calc(var(--spacing)*4);height:calc(var(--spacing)*4)}:is(.\\*\\:\\[span\\]\\:last\\:flex>*):is(span):last-child{display:flex}:is(.\\*\\:\\[span\\]\\:last\\:items-center>*):is(span):last-child{align-items:center}:is(.\\*\\:\\[span\\]\\:last\\:gap-2>*):is(span):last-child{gap:calc(var(--spacing)*2)}.\\[\\&\\>svg\\]\\:size-3\\.5>svg{width:calc(var(--spacing)*3.5);height:calc(var(--spacing)*3.5)}}:root{--background:oklch(14.1% .005 285.823);--foreground:oklch(98.5% 0 0);--card:oklch(21% .006 285.885);--card-foreground:oklch(98.5% 0 0);--popover:oklch(21% .006 285.885);--popover-foreground:oklch(98.5% 0 0);--primary:oklch(42% .18 266);--primary-foreground:oklch(97% .014 254.604);--secondary:oklch(27.4% .006 286.033);--secondary-foreground:oklch(98.5% 0 0);--muted:oklch(27.4% .006 286.033);--muted-foreground:oklch(70.5% .015 286.067);--accent:oklch(42% .18 266);--accent-foreground:oklch(97% .014 254.604);--destructive:oklch(70.4% .191 22.216);--destructive-foreground:oklch(97% .014 254.604);--border:oklch(100% 0 0/.1);--input:oklch(100% 0 0/.15);--ring:oklch(55.2% .016 285.938);--radius:.5rem;font-family:ui-sans-serif,system-ui,sans-serif}[data-radix-portal]{z-index:9999!important}@property --tw-translate-x{syntax:"*";inherits:false;initial-value:0}@property --tw-translate-y{syntax:"*";inherits:false;initial-value:0}@property --tw-translate-z{syntax:"*";inherits:false;initial-value:0}@property --tw-space-y-reverse{syntax:"*";inherits:false;initial-value:0}@property --tw-space-x-reverse{syntax:"*";inherits:false;initial-value:0}@property --tw-border-style{syntax:"*";inherits:false;initial-value:solid}@property --tw-gradient-position{syntax:"*";inherits:false}@property --tw-gradient-from{syntax:"<color>";inherits:false;initial-value:#0000}@property --tw-gradient-via{syntax:"<color>";inherits:false;initial-value:#0000}@property --tw-gradient-to{syntax:"<color>";inherits:false;initial-value:#0000}@property --tw-gradient-stops{syntax:"*";inherits:false}@property --tw-gradient-via-stops{syntax:"*";inherits:false}@property --tw-gradient-from-position{syntax:"<length-percentage>";inherits:false;initial-value:0%}@property --tw-gradient-via-position{syntax:"<length-percentage>";inherits:false;initial-value:50%}@property --tw-gradient-to-position{syntax:"<length-percentage>";inherits:false;initial-value:100%}@property --tw-leading{syntax:"*";inherits:false}@property --tw-font-weight{syntax:"*";inherits:false}@property --tw-tracking{syntax:"*";inherits:false}@property --tw-shadow{syntax:"*";inherits:false;initial-value:0 0 #0000}@property --tw-shadow-color{syntax:"*";inherits:false}@property --tw-shadow-alpha{syntax:"<percentage>";inherits:false;initial-value:100%}@property --tw-inset-shadow{syntax:"*";inherits:false;initial-value:0 0 #0000}@property --tw-inset-shadow-color{syntax:"*";inherits:false}@property --tw-inset-shadow-alpha{syntax:"<percentage>";inherits:false;initial-value:100%}@property --tw-ring-color{syntax:"*";inherits:false}@property --tw-ring-shadow{syntax:"*";inherits:false;initial-value:0 0 #0000}@property --tw-inset-ring-color{syntax:"*";inherits:false}@property --tw-inset-ring-shadow{syntax:"*";inherits:false;initial-value:0 0 #0000}@property --tw-ring-inset{syntax:"*";inherits:false}@property --tw-ring-offset-width{syntax:"<length>";inherits:false;initial-value:0}@property --tw-ring-offset-color{syntax:"*";inherits:false;initial-value:#fff}@property --tw-ring-offset-shadow{syntax:"*";inherits:false;initial-value:0 0 #0000}@property --tw-blur{syntax:"*";inherits:false}@property --tw-brightness{syntax:"*";inherits:false}@property --tw-contrast{syntax:"*";inherits:false}@property --tw-grayscale{syntax:"*";inherits:false}@property --tw-hue-rotate{syntax:"*";inherits:false}@property --tw-invert{syntax:"*";inherits:false}@property --tw-opacity{syntax:"*";inherits:false}@property --tw-saturate{syntax:"*";inherits:false}@property --tw-sepia{syntax:"*";inherits:false}@property --tw-drop-shadow{syntax:"*";inherits:false}@property --tw-drop-shadow-color{syntax:"*";inherits:false}@property --tw-drop-shadow-alpha{syntax:"<percentage>";inherits:false;initial-value:100%}@property --tw-drop-shadow-size{syntax:"*";inherits:false}@property --tw-backdrop-blur{syntax:"*";inherits:false}@property --tw-backdrop-brightness{syntax:"*";inherits:false}@property --tw-backdrop-contrast{syntax:"*";inherits:false}@property --tw-backdrop-grayscale{syntax:"*";inherits:false}@property --tw-backdrop-hue-rotate{syntax:"*";inherits:false}@property --tw-backdrop-invert{syntax:"*";inherits:false}@property --tw-backdrop-opacity{syntax:"*";inherits:false}@property --tw-backdrop-saturate{syntax:"*";inherits:false}@property --tw-backdrop-sepia{syntax:"*";inherits:false}@property --tw-duration{syntax:"*";inherits:false}@property --tw-content{syntax:"*";inherits:false;initial-value:""}@keyframes pulse{50%{opacity:.5}}`,rf=({mode:n,children:r})=>(j.useLayoutEffect(()=>{const o=`jp-theme-${n}`;if(!document.getElementById(o)){const l=document.createElement("style");l.id=o,l.innerHTML=n==="tenant"?A3:T3,document.head.appendChild(l)}return()=>{const l=document.getElementById(o);l&&l.remove()}},[n]),_.jsx(_.Fragment,{children:r}));function ts(n){throw new Error('Could not dynamically require "'+n+'". Please configure the dynamicRequireTargets or/and ignoreDynamicRequires option of @rollup/plugin-commonjs appropriately for this require call to work.')}var pd={exports:{}};/*!

JSZip v3.10.1 - A JavaScript class for generating and reading zip files
<http://stuartk.com/jszip>

(c) 2009-2016 Stuart Knightley <stuart [at] stuartk.com>
Dual licenced under the MIT license or GPLv3. See https://raw.github.com/Stuk/jszip/main/LICENSE.markdown.

JSZip uses the library pako released under the MIT license :
https://github.com/nodeca/pako/blob/main/LICENSE
*/var _v;function N3(){return _v||(_v=1,(function(n,r){(function(o){n.exports=o()})(function(){return(function o(l,s,c){function f(m,v){if(!s[m]){if(!l[m]){var b=typeof ts=="function"&&ts;if(!v&&b)return b(m,!0);if(h)return h(m,!0);var E=new Error("Cannot find module '"+m+"'");throw E.code="MODULE_NOT_FOUND",E}var x=s[m]={exports:{}};l[m][0].call(x.exports,function(z){var g=l[m][1][z];return f(g||z)},x,x.exports,o,l,s,c)}return s[m].exports}for(var h=typeof ts=="function"&&ts,p=0;p<c.length;p++)f(c[p]);return f})({1:[function(o,l,s){var c=o("./utils"),f=o("./support"),h="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";s.encode=function(p){for(var m,v,b,E,x,z,g,w=[],k=0,A=p.length,N=A,R=c.getTypeOf(p)!=="string";k<p.length;)N=A-k,b=R?(m=p[k++],v=k<A?p[k++]:0,k<A?p[k++]:0):(m=p.charCodeAt(k++),v=k<A?p.charCodeAt(k++):0,k<A?p.charCodeAt(k++):0),E=m>>2,x=(3&m)<<4|v>>4,z=1<N?(15&v)<<2|b>>6:64,g=2<N?63&b:64,w.push(h.charAt(E)+h.charAt(x)+h.charAt(z)+h.charAt(g));return w.join("")},s.decode=function(p){var m,v,b,E,x,z,g=0,w=0,k="data:";if(p.substr(0,k.length)===k)throw new Error("Invalid base64 input, it looks like a data url.");var A,N=3*(p=p.replace(/[^A-Za-z0-9+/=]/g,"")).length/4;if(p.charAt(p.length-1)===h.charAt(64)&&N--,p.charAt(p.length-2)===h.charAt(64)&&N--,N%1!=0)throw new Error("Invalid base64 input, bad content length.");for(A=f.uint8array?new Uint8Array(0|N):new Array(0|N);g<p.length;)m=h.indexOf(p.charAt(g++))<<2|(E=h.indexOf(p.charAt(g++)))>>4,v=(15&E)<<4|(x=h.indexOf(p.charAt(g++)))>>2,b=(3&x)<<6|(z=h.indexOf(p.charAt(g++))),A[w++]=m,x!==64&&(A[w++]=v),z!==64&&(A[w++]=b);return A}},{"./support":30,"./utils":32}],2:[function(o,l,s){var c=o("./external"),f=o("./stream/DataWorker"),h=o("./stream/Crc32Probe"),p=o("./stream/DataLengthProbe");function m(v,b,E,x,z){this.compressedSize=v,this.uncompressedSize=b,this.crc32=E,this.compression=x,this.compressedContent=z}m.prototype={getContentWorker:function(){var v=new f(c.Promise.resolve(this.compressedContent)).pipe(this.compression.uncompressWorker()).pipe(new p("data_length")),b=this;return v.on("end",function(){if(this.streamInfo.data_length!==b.uncompressedSize)throw new Error("Bug : uncompressed data size mismatch")}),v},getCompressedWorker:function(){return new f(c.Promise.resolve(this.compressedContent)).withStreamInfo("compressedSize",this.compressedSize).withStreamInfo("uncompressedSize",this.uncompressedSize).withStreamInfo("crc32",this.crc32).withStreamInfo("compression",this.compression)}},m.createWorkerFrom=function(v,b,E){return v.pipe(new h).pipe(new p("uncompressedSize")).pipe(b.compressWorker(E)).pipe(new p("compressedSize")).withStreamInfo("compression",b)},l.exports=m},{"./external":6,"./stream/Crc32Probe":25,"./stream/DataLengthProbe":26,"./stream/DataWorker":27}],3:[function(o,l,s){var c=o("./stream/GenericWorker");s.STORE={magic:"\0\0",compressWorker:function(){return new c("STORE compression")},uncompressWorker:function(){return new c("STORE decompression")}},s.DEFLATE=o("./flate")},{"./flate":7,"./stream/GenericWorker":28}],4:[function(o,l,s){var c=o("./utils"),f=(function(){for(var h,p=[],m=0;m<256;m++){h=m;for(var v=0;v<8;v++)h=1&h?3988292384^h>>>1:h>>>1;p[m]=h}return p})();l.exports=function(h,p){return h!==void 0&&h.length?c.getTypeOf(h)!=="string"?(function(m,v,b,E){var x=f,z=E+b;m^=-1;for(var g=E;g<z;g++)m=m>>>8^x[255&(m^v[g])];return-1^m})(0|p,h,h.length,0):(function(m,v,b,E){var x=f,z=E+b;m^=-1;for(var g=E;g<z;g++)m=m>>>8^x[255&(m^v.charCodeAt(g))];return-1^m})(0|p,h,h.length,0):0}},{"./utils":32}],5:[function(o,l,s){s.base64=!1,s.binary=!1,s.dir=!1,s.createFolders=!0,s.date=null,s.compression=null,s.compressionOptions=null,s.comment=null,s.unixPermissions=null,s.dosPermissions=null},{}],6:[function(o,l,s){var c=null;c=typeof Promise<"u"?Promise:o("lie"),l.exports={Promise:c}},{lie:37}],7:[function(o,l,s){var c=typeof Uint8Array<"u"&&typeof Uint16Array<"u"&&typeof Uint32Array<"u",f=o("pako"),h=o("./utils"),p=o("./stream/GenericWorker"),m=c?"uint8array":"array";function v(b,E){p.call(this,"FlateWorker/"+b),this._pako=null,this._pakoAction=b,this._pakoOptions=E,this.meta={}}s.magic="\b\0",h.inherits(v,p),v.prototype.processChunk=function(b){this.meta=b.meta,this._pako===null&&this._createPako(),this._pako.push(h.transformTo(m,b.data),!1)},v.prototype.flush=function(){p.prototype.flush.call(this),this._pako===null&&this._createPako(),this._pako.push([],!0)},v.prototype.cleanUp=function(){p.prototype.cleanUp.call(this),this._pako=null},v.prototype._createPako=function(){this._pako=new f[this._pakoAction]({raw:!0,level:this._pakoOptions.level||-1});var b=this;this._pako.onData=function(E){b.push({data:E,meta:b.meta})}},s.compressWorker=function(b){return new v("Deflate",b)},s.uncompressWorker=function(){return new v("Inflate",{})}},{"./stream/GenericWorker":28,"./utils":32,pako:38}],8:[function(o,l,s){function c(x,z){var g,w="";for(g=0;g<z;g++)w+=String.fromCharCode(255&x),x>>>=8;return w}function f(x,z,g,w,k,A){var N,R,U=x.file,Y=x.compression,H=A!==m.utf8encode,I=h.transformTo("string",A(U.name)),K=h.transformTo("string",m.utf8encode(U.name)),se=U.comment,ge=h.transformTo("string",A(se)),B=h.transformTo("string",m.utf8encode(se)),W=K.length!==U.name.length,C=B.length!==se.length,ae="",V="",q="",Q=U.dir,ne=U.date,ve={crc32:0,compressedSize:0,uncompressedSize:0};z&&!g||(ve.crc32=x.crc32,ve.compressedSize=x.compressedSize,ve.uncompressedSize=x.uncompressedSize);var O=0;z&&(O|=8),H||!W&&!C||(O|=2048);var D=0,re=0;Q&&(D|=16),k==="UNIX"?(re=798,D|=(function(le,Ee){var he=le;return le||(he=Ee?16893:33204),(65535&he)<<16})(U.unixPermissions,Q)):(re=20,D|=(function(le){return 63&(le||0)})(U.dosPermissions)),N=ne.getUTCHours(),N<<=6,N|=ne.getUTCMinutes(),N<<=5,N|=ne.getUTCSeconds()/2,R=ne.getUTCFullYear()-1980,R<<=4,R|=ne.getUTCMonth()+1,R<<=5,R|=ne.getUTCDate(),W&&(V=c(1,1)+c(v(I),4)+K,ae+="up"+c(V.length,2)+V),C&&(q=c(1,1)+c(v(ge),4)+B,ae+="uc"+c(q.length,2)+q);var ee="";return ee+=`
\0`,ee+=c(O,2),ee+=Y.magic,ee+=c(N,2),ee+=c(R,2),ee+=c(ve.crc32,4),ee+=c(ve.compressedSize,4),ee+=c(ve.uncompressedSize,4),ee+=c(I.length,2),ee+=c(ae.length,2),{fileRecord:b.LOCAL_FILE_HEADER+ee+I+ae,dirRecord:b.CENTRAL_FILE_HEADER+c(re,2)+ee+c(ge.length,2)+"\0\0\0\0"+c(D,4)+c(w,4)+I+ae+ge}}var h=o("../utils"),p=o("../stream/GenericWorker"),m=o("../utf8"),v=o("../crc32"),b=o("../signature");function E(x,z,g,w){p.call(this,"ZipFileWorker"),this.bytesWritten=0,this.zipComment=z,this.zipPlatform=g,this.encodeFileName=w,this.streamFiles=x,this.accumulate=!1,this.contentBuffer=[],this.dirRecords=[],this.currentSourceOffset=0,this.entriesCount=0,this.currentFile=null,this._sources=[]}h.inherits(E,p),E.prototype.push=function(x){var z=x.meta.percent||0,g=this.entriesCount,w=this._sources.length;this.accumulate?this.contentBuffer.push(x):(this.bytesWritten+=x.data.length,p.prototype.push.call(this,{data:x.data,meta:{currentFile:this.currentFile,percent:g?(z+100*(g-w-1))/g:100}}))},E.prototype.openedSource=function(x){this.currentSourceOffset=this.bytesWritten,this.currentFile=x.file.name;var z=this.streamFiles&&!x.file.dir;if(z){var g=f(x,z,!1,this.currentSourceOffset,this.zipPlatform,this.encodeFileName);this.push({data:g.fileRecord,meta:{percent:0}})}else this.accumulate=!0},E.prototype.closedSource=function(x){this.accumulate=!1;var z=this.streamFiles&&!x.file.dir,g=f(x,z,!0,this.currentSourceOffset,this.zipPlatform,this.encodeFileName);if(this.dirRecords.push(g.dirRecord),z)this.push({data:(function(w){return b.DATA_DESCRIPTOR+c(w.crc32,4)+c(w.compressedSize,4)+c(w.uncompressedSize,4)})(x),meta:{percent:100}});else for(this.push({data:g.fileRecord,meta:{percent:0}});this.contentBuffer.length;)this.push(this.contentBuffer.shift());this.currentFile=null},E.prototype.flush=function(){for(var x=this.bytesWritten,z=0;z<this.dirRecords.length;z++)this.push({data:this.dirRecords[z],meta:{percent:100}});var g=this.bytesWritten-x,w=(function(k,A,N,R,U){var Y=h.transformTo("string",U(R));return b.CENTRAL_DIRECTORY_END+"\0\0\0\0"+c(k,2)+c(k,2)+c(A,4)+c(N,4)+c(Y.length,2)+Y})(this.dirRecords.length,g,x,this.zipComment,this.encodeFileName);this.push({data:w,meta:{percent:100}})},E.prototype.prepareNextSource=function(){this.previous=this._sources.shift(),this.openedSource(this.previous.streamInfo),this.isPaused?this.previous.pause():this.previous.resume()},E.prototype.registerPrevious=function(x){this._sources.push(x);var z=this;return x.on("data",function(g){z.processChunk(g)}),x.on("end",function(){z.closedSource(z.previous.streamInfo),z._sources.length?z.prepareNextSource():z.end()}),x.on("error",function(g){z.error(g)}),this},E.prototype.resume=function(){return!!p.prototype.resume.call(this)&&(!this.previous&&this._sources.length?(this.prepareNextSource(),!0):this.previous||this._sources.length||this.generatedError?void 0:(this.end(),!0))},E.prototype.error=function(x){var z=this._sources;if(!p.prototype.error.call(this,x))return!1;for(var g=0;g<z.length;g++)try{z[g].error(x)}catch{}return!0},E.prototype.lock=function(){p.prototype.lock.call(this);for(var x=this._sources,z=0;z<x.length;z++)x[z].lock()},l.exports=E},{"../crc32":4,"../signature":23,"../stream/GenericWorker":28,"../utf8":31,"../utils":32}],9:[function(o,l,s){var c=o("../compressions"),f=o("./ZipFileWorker");s.generateWorker=function(h,p,m){var v=new f(p.streamFiles,m,p.platform,p.encodeFileName),b=0;try{h.forEach(function(E,x){b++;var z=(function(A,N){var R=A||N,U=c[R];if(!U)throw new Error(R+" is not a valid compression method !");return U})(x.options.compression,p.compression),g=x.options.compressionOptions||p.compressionOptions||{},w=x.dir,k=x.date;x._compressWorker(z,g).withStreamInfo("file",{name:E,dir:w,date:k,comment:x.comment||"",unixPermissions:x.unixPermissions,dosPermissions:x.dosPermissions}).pipe(v)}),v.entriesCount=b}catch(E){v.error(E)}return v}},{"../compressions":3,"./ZipFileWorker":8}],10:[function(o,l,s){function c(){if(!(this instanceof c))return new c;if(arguments.length)throw new Error("The constructor with parameters has been removed in JSZip 3.0, please check the upgrade guide.");this.files=Object.create(null),this.comment=null,this.root="",this.clone=function(){var f=new c;for(var h in this)typeof this[h]!="function"&&(f[h]=this[h]);return f}}(c.prototype=o("./object")).loadAsync=o("./load"),c.support=o("./support"),c.defaults=o("./defaults"),c.version="3.10.1",c.loadAsync=function(f,h){return new c().loadAsync(f,h)},c.external=o("./external"),l.exports=c},{"./defaults":5,"./external":6,"./load":11,"./object":15,"./support":30}],11:[function(o,l,s){var c=o("./utils"),f=o("./external"),h=o("./utf8"),p=o("./zipEntries"),m=o("./stream/Crc32Probe"),v=o("./nodejsUtils");function b(E){return new f.Promise(function(x,z){var g=E.decompressed.getContentWorker().pipe(new m);g.on("error",function(w){z(w)}).on("end",function(){g.streamInfo.crc32!==E.decompressed.crc32?z(new Error("Corrupted zip : CRC32 mismatch")):x()}).resume()})}l.exports=function(E,x){var z=this;return x=c.extend(x||{},{base64:!1,checkCRC32:!1,optimizedBinaryString:!1,createFolders:!1,decodeFileName:h.utf8decode}),v.isNode&&v.isStream(E)?f.Promise.reject(new Error("JSZip can't accept a stream when loading a zip file.")):c.prepareContent("the loaded zip file",E,!0,x.optimizedBinaryString,x.base64).then(function(g){var w=new p(x);return w.load(g),w}).then(function(g){var w=[f.Promise.resolve(g)],k=g.files;if(x.checkCRC32)for(var A=0;A<k.length;A++)w.push(b(k[A]));return f.Promise.all(w)}).then(function(g){for(var w=g.shift(),k=w.files,A=0;A<k.length;A++){var N=k[A],R=N.fileNameStr,U=c.resolve(N.fileNameStr);z.file(U,N.decompressed,{binary:!0,optimizedBinaryString:!0,date:N.date,dir:N.dir,comment:N.fileCommentStr.length?N.fileCommentStr:null,unixPermissions:N.unixPermissions,dosPermissions:N.dosPermissions,createFolders:x.createFolders}),N.dir||(z.file(U).unsafeOriginalName=R)}return w.zipComment.length&&(z.comment=w.zipComment),z})}},{"./external":6,"./nodejsUtils":14,"./stream/Crc32Probe":25,"./utf8":31,"./utils":32,"./zipEntries":33}],12:[function(o,l,s){var c=o("../utils"),f=o("../stream/GenericWorker");function h(p,m){f.call(this,"Nodejs stream input adapter for "+p),this._upstreamEnded=!1,this._bindStream(m)}c.inherits(h,f),h.prototype._bindStream=function(p){var m=this;(this._stream=p).pause(),p.on("data",function(v){m.push({data:v,meta:{percent:0}})}).on("error",function(v){m.isPaused?this.generatedError=v:m.error(v)}).on("end",function(){m.isPaused?m._upstreamEnded=!0:m.end()})},h.prototype.pause=function(){return!!f.prototype.pause.call(this)&&(this._stream.pause(),!0)},h.prototype.resume=function(){return!!f.prototype.resume.call(this)&&(this._upstreamEnded?this.end():this._stream.resume(),!0)},l.exports=h},{"../stream/GenericWorker":28,"../utils":32}],13:[function(o,l,s){var c=o("readable-stream").Readable;function f(h,p,m){c.call(this,p),this._helper=h;var v=this;h.on("data",function(b,E){v.push(b)||v._helper.pause(),m&&m(E)}).on("error",function(b){v.emit("error",b)}).on("end",function(){v.push(null)})}o("../utils").inherits(f,c),f.prototype._read=function(){this._helper.resume()},l.exports=f},{"../utils":32,"readable-stream":16}],14:[function(o,l,s){l.exports={isNode:typeof Buffer<"u",newBufferFrom:function(c,f){if(Buffer.from&&Buffer.from!==Uint8Array.from)return Buffer.from(c,f);if(typeof c=="number")throw new Error('The "data" argument must not be a number');return new Buffer(c,f)},allocBuffer:function(c){if(Buffer.alloc)return Buffer.alloc(c);var f=new Buffer(c);return f.fill(0),f},isBuffer:function(c){return Buffer.isBuffer(c)},isStream:function(c){return c&&typeof c.on=="function"&&typeof c.pause=="function"&&typeof c.resume=="function"}}},{}],15:[function(o,l,s){function c(U,Y,H){var I,K=h.getTypeOf(Y),se=h.extend(H||{},v);se.date=se.date||new Date,se.compression!==null&&(se.compression=se.compression.toUpperCase()),typeof se.unixPermissions=="string"&&(se.unixPermissions=parseInt(se.unixPermissions,8)),se.unixPermissions&&16384&se.unixPermissions&&(se.dir=!0),se.dosPermissions&&16&se.dosPermissions&&(se.dir=!0),se.dir&&(U=k(U)),se.createFolders&&(I=w(U))&&A.call(this,I,!0);var ge=K==="string"&&se.binary===!1&&se.base64===!1;H&&H.binary!==void 0||(se.binary=!ge),(Y instanceof b&&Y.uncompressedSize===0||se.dir||!Y||Y.length===0)&&(se.base64=!1,se.binary=!0,Y="",se.compression="STORE",K="string");var B=null;B=Y instanceof b||Y instanceof p?Y:z.isNode&&z.isStream(Y)?new g(U,Y):h.prepareContent(U,Y,se.binary,se.optimizedBinaryString,se.base64);var W=new E(U,B,se);this.files[U]=W}var f=o("./utf8"),h=o("./utils"),p=o("./stream/GenericWorker"),m=o("./stream/StreamHelper"),v=o("./defaults"),b=o("./compressedObject"),E=o("./zipObject"),x=o("./generate"),z=o("./nodejsUtils"),g=o("./nodejs/NodejsStreamInputAdapter"),w=function(U){U.slice(-1)==="/"&&(U=U.substring(0,U.length-1));var Y=U.lastIndexOf("/");return 0<Y?U.substring(0,Y):""},k=function(U){return U.slice(-1)!=="/"&&(U+="/"),U},A=function(U,Y){return Y=Y!==void 0?Y:v.createFolders,U=k(U),this.files[U]||c.call(this,U,null,{dir:!0,createFolders:Y}),this.files[U]};function N(U){return Object.prototype.toString.call(U)==="[object RegExp]"}var R={load:function(){throw new Error("This method has been removed in JSZip 3.0, please check the upgrade guide.")},forEach:function(U){var Y,H,I;for(Y in this.files)I=this.files[Y],(H=Y.slice(this.root.length,Y.length))&&Y.slice(0,this.root.length)===this.root&&U(H,I)},filter:function(U){var Y=[];return this.forEach(function(H,I){U(H,I)&&Y.push(I)}),Y},file:function(U,Y,H){if(arguments.length!==1)return U=this.root+U,c.call(this,U,Y,H),this;if(N(U)){var I=U;return this.filter(function(se,ge){return!ge.dir&&I.test(se)})}var K=this.files[this.root+U];return K&&!K.dir?K:null},folder:function(U){if(!U)return this;if(N(U))return this.filter(function(K,se){return se.dir&&U.test(K)});var Y=this.root+U,H=A.call(this,Y),I=this.clone();return I.root=H.name,I},remove:function(U){U=this.root+U;var Y=this.files[U];if(Y||(U.slice(-1)!=="/"&&(U+="/"),Y=this.files[U]),Y&&!Y.dir)delete this.files[U];else for(var H=this.filter(function(K,se){return se.name.slice(0,U.length)===U}),I=0;I<H.length;I++)delete this.files[H[I].name];return this},generate:function(){throw new Error("This method has been removed in JSZip 3.0, please check the upgrade guide.")},generateInternalStream:function(U){var Y,H={};try{if((H=h.extend(U||{},{streamFiles:!1,compression:"STORE",compressionOptions:null,type:"",platform:"DOS",comment:null,mimeType:"application/zip",encodeFileName:f.utf8encode})).type=H.type.toLowerCase(),H.compression=H.compression.toUpperCase(),H.type==="binarystring"&&(H.type="string"),!H.type)throw new Error("No output type specified.");h.checkSupport(H.type),H.platform!=="darwin"&&H.platform!=="freebsd"&&H.platform!=="linux"&&H.platform!=="sunos"||(H.platform="UNIX"),H.platform==="win32"&&(H.platform="DOS");var I=H.comment||this.comment||"";Y=x.generateWorker(this,H,I)}catch(K){(Y=new p("error")).error(K)}return new m(Y,H.type||"string",H.mimeType)},generateAsync:function(U,Y){return this.generateInternalStream(U).accumulate(Y)},generateNodeStream:function(U,Y){return(U=U||{}).type||(U.type="nodebuffer"),this.generateInternalStream(U).toNodejsStream(Y)}};l.exports=R},{"./compressedObject":2,"./defaults":5,"./generate":9,"./nodejs/NodejsStreamInputAdapter":12,"./nodejsUtils":14,"./stream/GenericWorker":28,"./stream/StreamHelper":29,"./utf8":31,"./utils":32,"./zipObject":35}],16:[function(o,l,s){l.exports=o("stream")},{stream:void 0}],17:[function(o,l,s){var c=o("./DataReader");function f(h){c.call(this,h);for(var p=0;p<this.data.length;p++)h[p]=255&h[p]}o("../utils").inherits(f,c),f.prototype.byteAt=function(h){return this.data[this.zero+h]},f.prototype.lastIndexOfSignature=function(h){for(var p=h.charCodeAt(0),m=h.charCodeAt(1),v=h.charCodeAt(2),b=h.charCodeAt(3),E=this.length-4;0<=E;--E)if(this.data[E]===p&&this.data[E+1]===m&&this.data[E+2]===v&&this.data[E+3]===b)return E-this.zero;return-1},f.prototype.readAndCheckSignature=function(h){var p=h.charCodeAt(0),m=h.charCodeAt(1),v=h.charCodeAt(2),b=h.charCodeAt(3),E=this.readData(4);return p===E[0]&&m===E[1]&&v===E[2]&&b===E[3]},f.prototype.readData=function(h){if(this.checkOffset(h),h===0)return[];var p=this.data.slice(this.zero+this.index,this.zero+this.index+h);return this.index+=h,p},l.exports=f},{"../utils":32,"./DataReader":18}],18:[function(o,l,s){var c=o("../utils");function f(h){this.data=h,this.length=h.length,this.index=0,this.zero=0}f.prototype={checkOffset:function(h){this.checkIndex(this.index+h)},checkIndex:function(h){if(this.length<this.zero+h||h<0)throw new Error("End of data reached (data length = "+this.length+", asked index = "+h+"). Corrupted zip ?")},setIndex:function(h){this.checkIndex(h),this.index=h},skip:function(h){this.setIndex(this.index+h)},byteAt:function(){},readInt:function(h){var p,m=0;for(this.checkOffset(h),p=this.index+h-1;p>=this.index;p--)m=(m<<8)+this.byteAt(p);return this.index+=h,m},readString:function(h){return c.transformTo("string",this.readData(h))},readData:function(){},lastIndexOfSignature:function(){},readAndCheckSignature:function(){},readDate:function(){var h=this.readInt(4);return new Date(Date.UTC(1980+(h>>25&127),(h>>21&15)-1,h>>16&31,h>>11&31,h>>5&63,(31&h)<<1))}},l.exports=f},{"../utils":32}],19:[function(o,l,s){var c=o("./Uint8ArrayReader");function f(h){c.call(this,h)}o("../utils").inherits(f,c),f.prototype.readData=function(h){this.checkOffset(h);var p=this.data.slice(this.zero+this.index,this.zero+this.index+h);return this.index+=h,p},l.exports=f},{"../utils":32,"./Uint8ArrayReader":21}],20:[function(o,l,s){var c=o("./DataReader");function f(h){c.call(this,h)}o("../utils").inherits(f,c),f.prototype.byteAt=function(h){return this.data.charCodeAt(this.zero+h)},f.prototype.lastIndexOfSignature=function(h){return this.data.lastIndexOf(h)-this.zero},f.prototype.readAndCheckSignature=function(h){return h===this.readData(4)},f.prototype.readData=function(h){this.checkOffset(h);var p=this.data.slice(this.zero+this.index,this.zero+this.index+h);return this.index+=h,p},l.exports=f},{"../utils":32,"./DataReader":18}],21:[function(o,l,s){var c=o("./ArrayReader");function f(h){c.call(this,h)}o("../utils").inherits(f,c),f.prototype.readData=function(h){if(this.checkOffset(h),h===0)return new Uint8Array(0);var p=this.data.subarray(this.zero+this.index,this.zero+this.index+h);return this.index+=h,p},l.exports=f},{"../utils":32,"./ArrayReader":17}],22:[function(o,l,s){var c=o("../utils"),f=o("../support"),h=o("./ArrayReader"),p=o("./StringReader"),m=o("./NodeBufferReader"),v=o("./Uint8ArrayReader");l.exports=function(b){var E=c.getTypeOf(b);return c.checkSupport(E),E!=="string"||f.uint8array?E==="nodebuffer"?new m(b):f.uint8array?new v(c.transformTo("uint8array",b)):new h(c.transformTo("array",b)):new p(b)}},{"../support":30,"../utils":32,"./ArrayReader":17,"./NodeBufferReader":19,"./StringReader":20,"./Uint8ArrayReader":21}],23:[function(o,l,s){s.LOCAL_FILE_HEADER="PK",s.CENTRAL_FILE_HEADER="PK",s.CENTRAL_DIRECTORY_END="PK",s.ZIP64_CENTRAL_DIRECTORY_LOCATOR="PK\x07",s.ZIP64_CENTRAL_DIRECTORY_END="PK",s.DATA_DESCRIPTOR="PK\x07\b"},{}],24:[function(o,l,s){var c=o("./GenericWorker"),f=o("../utils");function h(p){c.call(this,"ConvertWorker to "+p),this.destType=p}f.inherits(h,c),h.prototype.processChunk=function(p){this.push({data:f.transformTo(this.destType,p.data),meta:p.meta})},l.exports=h},{"../utils":32,"./GenericWorker":28}],25:[function(o,l,s){var c=o("./GenericWorker"),f=o("../crc32");function h(){c.call(this,"Crc32Probe"),this.withStreamInfo("crc32",0)}o("../utils").inherits(h,c),h.prototype.processChunk=function(p){this.streamInfo.crc32=f(p.data,this.streamInfo.crc32||0),this.push(p)},l.exports=h},{"../crc32":4,"../utils":32,"./GenericWorker":28}],26:[function(o,l,s){var c=o("../utils"),f=o("./GenericWorker");function h(p){f.call(this,"DataLengthProbe for "+p),this.propName=p,this.withStreamInfo(p,0)}c.inherits(h,f),h.prototype.processChunk=function(p){if(p){var m=this.streamInfo[this.propName]||0;this.streamInfo[this.propName]=m+p.data.length}f.prototype.processChunk.call(this,p)},l.exports=h},{"../utils":32,"./GenericWorker":28}],27:[function(o,l,s){var c=o("../utils"),f=o("./GenericWorker");function h(p){f.call(this,"DataWorker");var m=this;this.dataIsReady=!1,this.index=0,this.max=0,this.data=null,this.type="",this._tickScheduled=!1,p.then(function(v){m.dataIsReady=!0,m.data=v,m.max=v&&v.length||0,m.type=c.getTypeOf(v),m.isPaused||m._tickAndRepeat()},function(v){m.error(v)})}c.inherits(h,f),h.prototype.cleanUp=function(){f.prototype.cleanUp.call(this),this.data=null},h.prototype.resume=function(){return!!f.prototype.resume.call(this)&&(!this._tickScheduled&&this.dataIsReady&&(this._tickScheduled=!0,c.delay(this._tickAndRepeat,[],this)),!0)},h.prototype._tickAndRepeat=function(){this._tickScheduled=!1,this.isPaused||this.isFinished||(this._tick(),this.isFinished||(c.delay(this._tickAndRepeat,[],this),this._tickScheduled=!0))},h.prototype._tick=function(){if(this.isPaused||this.isFinished)return!1;var p=null,m=Math.min(this.max,this.index+16384);if(this.index>=this.max)return this.end();switch(this.type){case"string":p=this.data.substring(this.index,m);break;case"uint8array":p=this.data.subarray(this.index,m);break;case"array":case"nodebuffer":p=this.data.slice(this.index,m)}return this.index=m,this.push({data:p,meta:{percent:this.max?this.index/this.max*100:0}})},l.exports=h},{"../utils":32,"./GenericWorker":28}],28:[function(o,l,s){function c(f){this.name=f||"default",this.streamInfo={},this.generatedError=null,this.extraStreamInfo={},this.isPaused=!0,this.isFinished=!1,this.isLocked=!1,this._listeners={data:[],end:[],error:[]},this.previous=null}c.prototype={push:function(f){this.emit("data",f)},end:function(){if(this.isFinished)return!1;this.flush();try{this.emit("end"),this.cleanUp(),this.isFinished=!0}catch(f){this.emit("error",f)}return!0},error:function(f){return!this.isFinished&&(this.isPaused?this.generatedError=f:(this.isFinished=!0,this.emit("error",f),this.previous&&this.previous.error(f),this.cleanUp()),!0)},on:function(f,h){return this._listeners[f].push(h),this},cleanUp:function(){this.streamInfo=this.generatedError=this.extraStreamInfo=null,this._listeners=[]},emit:function(f,h){if(this._listeners[f])for(var p=0;p<this._listeners[f].length;p++)this._listeners[f][p].call(this,h)},pipe:function(f){return f.registerPrevious(this)},registerPrevious:function(f){if(this.isLocked)throw new Error("The stream '"+this+"' has already been used.");this.streamInfo=f.streamInfo,this.mergeStreamInfo(),this.previous=f;var h=this;return f.on("data",function(p){h.processChunk(p)}),f.on("end",function(){h.end()}),f.on("error",function(p){h.error(p)}),this},pause:function(){return!this.isPaused&&!this.isFinished&&(this.isPaused=!0,this.previous&&this.previous.pause(),!0)},resume:function(){if(!this.isPaused||this.isFinished)return!1;var f=this.isPaused=!1;return this.generatedError&&(this.error(this.generatedError),f=!0),this.previous&&this.previous.resume(),!f},flush:function(){},processChunk:function(f){this.push(f)},withStreamInfo:function(f,h){return this.extraStreamInfo[f]=h,this.mergeStreamInfo(),this},mergeStreamInfo:function(){for(var f in this.extraStreamInfo)Object.prototype.hasOwnProperty.call(this.extraStreamInfo,f)&&(this.streamInfo[f]=this.extraStreamInfo[f])},lock:function(){if(this.isLocked)throw new Error("The stream '"+this+"' has already been used.");this.isLocked=!0,this.previous&&this.previous.lock()},toString:function(){var f="Worker "+this.name;return this.previous?this.previous+" -> "+f:f}},l.exports=c},{}],29:[function(o,l,s){var c=o("../utils"),f=o("./ConvertWorker"),h=o("./GenericWorker"),p=o("../base64"),m=o("../support"),v=o("../external"),b=null;if(m.nodestream)try{b=o("../nodejs/NodejsStreamOutputAdapter")}catch{}function E(z,g){return new v.Promise(function(w,k){var A=[],N=z._internalType,R=z._outputType,U=z._mimeType;z.on("data",function(Y,H){A.push(Y),g&&g(H)}).on("error",function(Y){A=[],k(Y)}).on("end",function(){try{var Y=(function(H,I,K){switch(H){case"blob":return c.newBlob(c.transformTo("arraybuffer",I),K);case"base64":return p.encode(I);default:return c.transformTo(H,I)}})(R,(function(H,I){var K,se=0,ge=null,B=0;for(K=0;K<I.length;K++)B+=I[K].length;switch(H){case"string":return I.join("");case"array":return Array.prototype.concat.apply([],I);case"uint8array":for(ge=new Uint8Array(B),K=0;K<I.length;K++)ge.set(I[K],se),se+=I[K].length;return ge;case"nodebuffer":return Buffer.concat(I);default:throw new Error("concat : unsupported type '"+H+"'")}})(N,A),U);w(Y)}catch(H){k(H)}A=[]}).resume()})}function x(z,g,w){var k=g;switch(g){case"blob":case"arraybuffer":k="uint8array";break;case"base64":k="string"}try{this._internalType=k,this._outputType=g,this._mimeType=w,c.checkSupport(k),this._worker=z.pipe(new f(k)),z.lock()}catch(A){this._worker=new h("error"),this._worker.error(A)}}x.prototype={accumulate:function(z){return E(this,z)},on:function(z,g){var w=this;return z==="data"?this._worker.on(z,function(k){g.call(w,k.data,k.meta)}):this._worker.on(z,function(){c.delay(g,arguments,w)}),this},resume:function(){return c.delay(this._worker.resume,[],this._worker),this},pause:function(){return this._worker.pause(),this},toNodejsStream:function(z){if(c.checkSupport("nodestream"),this._outputType!=="nodebuffer")throw new Error(this._outputType+" is not supported by this method");return new b(this,{objectMode:this._outputType!=="nodebuffer"},z)}},l.exports=x},{"../base64":1,"../external":6,"../nodejs/NodejsStreamOutputAdapter":13,"../support":30,"../utils":32,"./ConvertWorker":24,"./GenericWorker":28}],30:[function(o,l,s){if(s.base64=!0,s.array=!0,s.string=!0,s.arraybuffer=typeof ArrayBuffer<"u"&&typeof Uint8Array<"u",s.nodebuffer=typeof Buffer<"u",s.uint8array=typeof Uint8Array<"u",typeof ArrayBuffer>"u")s.blob=!1;else{var c=new ArrayBuffer(0);try{s.blob=new Blob([c],{type:"application/zip"}).size===0}catch{try{var f=new(self.BlobBuilder||self.WebKitBlobBuilder||self.MozBlobBuilder||self.MSBlobBuilder);f.append(c),s.blob=f.getBlob("application/zip").size===0}catch{s.blob=!1}}}try{s.nodestream=!!o("readable-stream").Readable}catch{s.nodestream=!1}},{"readable-stream":16}],31:[function(o,l,s){for(var c=o("./utils"),f=o("./support"),h=o("./nodejsUtils"),p=o("./stream/GenericWorker"),m=new Array(256),v=0;v<256;v++)m[v]=252<=v?6:248<=v?5:240<=v?4:224<=v?3:192<=v?2:1;m[254]=m[254]=1;function b(){p.call(this,"utf-8 decode"),this.leftOver=null}function E(){p.call(this,"utf-8 encode")}s.utf8encode=function(x){return f.nodebuffer?h.newBufferFrom(x,"utf-8"):(function(z){var g,w,k,A,N,R=z.length,U=0;for(A=0;A<R;A++)(64512&(w=z.charCodeAt(A)))==55296&&A+1<R&&(64512&(k=z.charCodeAt(A+1)))==56320&&(w=65536+(w-55296<<10)+(k-56320),A++),U+=w<128?1:w<2048?2:w<65536?3:4;for(g=f.uint8array?new Uint8Array(U):new Array(U),A=N=0;N<U;A++)(64512&(w=z.charCodeAt(A)))==55296&&A+1<R&&(64512&(k=z.charCodeAt(A+1)))==56320&&(w=65536+(w-55296<<10)+(k-56320),A++),w<128?g[N++]=w:(w<2048?g[N++]=192|w>>>6:(w<65536?g[N++]=224|w>>>12:(g[N++]=240|w>>>18,g[N++]=128|w>>>12&63),g[N++]=128|w>>>6&63),g[N++]=128|63&w);return g})(x)},s.utf8decode=function(x){return f.nodebuffer?c.transformTo("nodebuffer",x).toString("utf-8"):(function(z){var g,w,k,A,N=z.length,R=new Array(2*N);for(g=w=0;g<N;)if((k=z[g++])<128)R[w++]=k;else if(4<(A=m[k]))R[w++]=65533,g+=A-1;else{for(k&=A===2?31:A===3?15:7;1<A&&g<N;)k=k<<6|63&z[g++],A--;1<A?R[w++]=65533:k<65536?R[w++]=k:(k-=65536,R[w++]=55296|k>>10&1023,R[w++]=56320|1023&k)}return R.length!==w&&(R.subarray?R=R.subarray(0,w):R.length=w),c.applyFromCharCode(R)})(x=c.transformTo(f.uint8array?"uint8array":"array",x))},c.inherits(b,p),b.prototype.processChunk=function(x){var z=c.transformTo(f.uint8array?"uint8array":"array",x.data);if(this.leftOver&&this.leftOver.length){if(f.uint8array){var g=z;(z=new Uint8Array(g.length+this.leftOver.length)).set(this.leftOver,0),z.set(g,this.leftOver.length)}else z=this.leftOver.concat(z);this.leftOver=null}var w=(function(A,N){var R;for((N=N||A.length)>A.length&&(N=A.length),R=N-1;0<=R&&(192&A[R])==128;)R--;return R<0||R===0?N:R+m[A[R]]>N?R:N})(z),k=z;w!==z.length&&(f.uint8array?(k=z.subarray(0,w),this.leftOver=z.subarray(w,z.length)):(k=z.slice(0,w),this.leftOver=z.slice(w,z.length))),this.push({data:s.utf8decode(k),meta:x.meta})},b.prototype.flush=function(){this.leftOver&&this.leftOver.length&&(this.push({data:s.utf8decode(this.leftOver),meta:{}}),this.leftOver=null)},s.Utf8DecodeWorker=b,c.inherits(E,p),E.prototype.processChunk=function(x){this.push({data:s.utf8encode(x.data),meta:x.meta})},s.Utf8EncodeWorker=E},{"./nodejsUtils":14,"./stream/GenericWorker":28,"./support":30,"./utils":32}],32:[function(o,l,s){var c=o("./support"),f=o("./base64"),h=o("./nodejsUtils"),p=o("./external");function m(g){return g}function v(g,w){for(var k=0;k<g.length;++k)w[k]=255&g.charCodeAt(k);return w}o("setimmediate"),s.newBlob=function(g,w){s.checkSupport("blob");try{return new Blob([g],{type:w})}catch{try{var k=new(self.BlobBuilder||self.WebKitBlobBuilder||self.MozBlobBuilder||self.MSBlobBuilder);return k.append(g),k.getBlob(w)}catch{throw new Error("Bug : can't construct the Blob.")}}};var b={stringifyByChunk:function(g,w,k){var A=[],N=0,R=g.length;if(R<=k)return String.fromCharCode.apply(null,g);for(;N<R;)w==="array"||w==="nodebuffer"?A.push(String.fromCharCode.apply(null,g.slice(N,Math.min(N+k,R)))):A.push(String.fromCharCode.apply(null,g.subarray(N,Math.min(N+k,R)))),N+=k;return A.join("")},stringifyByChar:function(g){for(var w="",k=0;k<g.length;k++)w+=String.fromCharCode(g[k]);return w},applyCanBeUsed:{uint8array:(function(){try{return c.uint8array&&String.fromCharCode.apply(null,new Uint8Array(1)).length===1}catch{return!1}})(),nodebuffer:(function(){try{return c.nodebuffer&&String.fromCharCode.apply(null,h.allocBuffer(1)).length===1}catch{return!1}})()}};function E(g){var w=65536,k=s.getTypeOf(g),A=!0;if(k==="uint8array"?A=b.applyCanBeUsed.uint8array:k==="nodebuffer"&&(A=b.applyCanBeUsed.nodebuffer),A)for(;1<w;)try{return b.stringifyByChunk(g,k,w)}catch{w=Math.floor(w/2)}return b.stringifyByChar(g)}function x(g,w){for(var k=0;k<g.length;k++)w[k]=g[k];return w}s.applyFromCharCode=E;var z={};z.string={string:m,array:function(g){return v(g,new Array(g.length))},arraybuffer:function(g){return z.string.uint8array(g).buffer},uint8array:function(g){return v(g,new Uint8Array(g.length))},nodebuffer:function(g){return v(g,h.allocBuffer(g.length))}},z.array={string:E,array:m,arraybuffer:function(g){return new Uint8Array(g).buffer},uint8array:function(g){return new Uint8Array(g)},nodebuffer:function(g){return h.newBufferFrom(g)}},z.arraybuffer={string:function(g){return E(new Uint8Array(g))},array:function(g){return x(new Uint8Array(g),new Array(g.byteLength))},arraybuffer:m,uint8array:function(g){return new Uint8Array(g)},nodebuffer:function(g){return h.newBufferFrom(new Uint8Array(g))}},z.uint8array={string:E,array:function(g){return x(g,new Array(g.length))},arraybuffer:function(g){return g.buffer},uint8array:m,nodebuffer:function(g){return h.newBufferFrom(g)}},z.nodebuffer={string:E,array:function(g){return x(g,new Array(g.length))},arraybuffer:function(g){return z.nodebuffer.uint8array(g).buffer},uint8array:function(g){return x(g,new Uint8Array(g.length))},nodebuffer:m},s.transformTo=function(g,w){if(w=w||"",!g)return w;s.checkSupport(g);var k=s.getTypeOf(w);return z[k][g](w)},s.resolve=function(g){for(var w=g.split("/"),k=[],A=0;A<w.length;A++){var N=w[A];N==="."||N===""&&A!==0&&A!==w.length-1||(N===".."?k.pop():k.push(N))}return k.join("/")},s.getTypeOf=function(g){return typeof g=="string"?"string":Object.prototype.toString.call(g)==="[object Array]"?"array":c.nodebuffer&&h.isBuffer(g)?"nodebuffer":c.uint8array&&g instanceof Uint8Array?"uint8array":c.arraybuffer&&g instanceof ArrayBuffer?"arraybuffer":void 0},s.checkSupport=function(g){if(!c[g.toLowerCase()])throw new Error(g+" is not supported by this platform")},s.MAX_VALUE_16BITS=65535,s.MAX_VALUE_32BITS=-1,s.pretty=function(g){var w,k,A="";for(k=0;k<(g||"").length;k++)A+="\\x"+((w=g.charCodeAt(k))<16?"0":"")+w.toString(16).toUpperCase();return A},s.delay=function(g,w,k){setImmediate(function(){g.apply(k||null,w||[])})},s.inherits=function(g,w){function k(){}k.prototype=w.prototype,g.prototype=new k},s.extend=function(){var g,w,k={};for(g=0;g<arguments.length;g++)for(w in arguments[g])Object.prototype.hasOwnProperty.call(arguments[g],w)&&k[w]===void 0&&(k[w]=arguments[g][w]);return k},s.prepareContent=function(g,w,k,A,N){return p.Promise.resolve(w).then(function(R){return c.blob&&(R instanceof Blob||["[object File]","[object Blob]"].indexOf(Object.prototype.toString.call(R))!==-1)&&typeof FileReader<"u"?new p.Promise(function(U,Y){var H=new FileReader;H.onload=function(I){U(I.target.result)},H.onerror=function(I){Y(I.target.error)},H.readAsArrayBuffer(R)}):R}).then(function(R){var U=s.getTypeOf(R);return U?(U==="arraybuffer"?R=s.transformTo("uint8array",R):U==="string"&&(N?R=f.decode(R):k&&A!==!0&&(R=(function(Y){return v(Y,c.uint8array?new Uint8Array(Y.length):new Array(Y.length))})(R))),R):p.Promise.reject(new Error("Can't read the data of '"+g+"'. Is it in a supported JavaScript type (String, Blob, ArrayBuffer, etc) ?"))})}},{"./base64":1,"./external":6,"./nodejsUtils":14,"./support":30,setimmediate:54}],33:[function(o,l,s){var c=o("./reader/readerFor"),f=o("./utils"),h=o("./signature"),p=o("./zipEntry"),m=o("./support");function v(b){this.files=[],this.loadOptions=b}v.prototype={checkSignature:function(b){if(!this.reader.readAndCheckSignature(b)){this.reader.index-=4;var E=this.reader.readString(4);throw new Error("Corrupted zip or bug: unexpected signature ("+f.pretty(E)+", expected "+f.pretty(b)+")")}},isSignature:function(b,E){var x=this.reader.index;this.reader.setIndex(b);var z=this.reader.readString(4)===E;return this.reader.setIndex(x),z},readBlockEndOfCentral:function(){this.diskNumber=this.reader.readInt(2),this.diskWithCentralDirStart=this.reader.readInt(2),this.centralDirRecordsOnThisDisk=this.reader.readInt(2),this.centralDirRecords=this.reader.readInt(2),this.centralDirSize=this.reader.readInt(4),this.centralDirOffset=this.reader.readInt(4),this.zipCommentLength=this.reader.readInt(2);var b=this.reader.readData(this.zipCommentLength),E=m.uint8array?"uint8array":"array",x=f.transformTo(E,b);this.zipComment=this.loadOptions.decodeFileName(x)},readBlockZip64EndOfCentral:function(){this.zip64EndOfCentralSize=this.reader.readInt(8),this.reader.skip(4),this.diskNumber=this.reader.readInt(4),this.diskWithCentralDirStart=this.reader.readInt(4),this.centralDirRecordsOnThisDisk=this.reader.readInt(8),this.centralDirRecords=this.reader.readInt(8),this.centralDirSize=this.reader.readInt(8),this.centralDirOffset=this.reader.readInt(8),this.zip64ExtensibleData={};for(var b,E,x,z=this.zip64EndOfCentralSize-44;0<z;)b=this.reader.readInt(2),E=this.reader.readInt(4),x=this.reader.readData(E),this.zip64ExtensibleData[b]={id:b,length:E,value:x}},readBlockZip64EndOfCentralLocator:function(){if(this.diskWithZip64CentralDirStart=this.reader.readInt(4),this.relativeOffsetEndOfZip64CentralDir=this.reader.readInt(8),this.disksCount=this.reader.readInt(4),1<this.disksCount)throw new Error("Multi-volumes zip are not supported")},readLocalFiles:function(){var b,E;for(b=0;b<this.files.length;b++)E=this.files[b],this.reader.setIndex(E.localHeaderOffset),this.checkSignature(h.LOCAL_FILE_HEADER),E.readLocalPart(this.reader),E.handleUTF8(),E.processAttributes()},readCentralDir:function(){var b;for(this.reader.setIndex(this.centralDirOffset);this.reader.readAndCheckSignature(h.CENTRAL_FILE_HEADER);)(b=new p({zip64:this.zip64},this.loadOptions)).readCentralPart(this.reader),this.files.push(b);if(this.centralDirRecords!==this.files.length&&this.centralDirRecords!==0&&this.files.length===0)throw new Error("Corrupted zip or bug: expected "+this.centralDirRecords+" records in central dir, got "+this.files.length)},readEndOfCentral:function(){var b=this.reader.lastIndexOfSignature(h.CENTRAL_DIRECTORY_END);if(b<0)throw this.isSignature(0,h.LOCAL_FILE_HEADER)?new Error("Corrupted zip: can't find end of central directory"):new Error("Can't find end of central directory : is this a zip file ? If it is, see https://stuk.github.io/jszip/documentation/howto/read_zip.html");this.reader.setIndex(b);var E=b;if(this.checkSignature(h.CENTRAL_DIRECTORY_END),this.readBlockEndOfCentral(),this.diskNumber===f.MAX_VALUE_16BITS||this.diskWithCentralDirStart===f.MAX_VALUE_16BITS||this.centralDirRecordsOnThisDisk===f.MAX_VALUE_16BITS||this.centralDirRecords===f.MAX_VALUE_16BITS||this.centralDirSize===f.MAX_VALUE_32BITS||this.centralDirOffset===f.MAX_VALUE_32BITS){if(this.zip64=!0,(b=this.reader.lastIndexOfSignature(h.ZIP64_CENTRAL_DIRECTORY_LOCATOR))<0)throw new Error("Corrupted zip: can't find the ZIP64 end of central directory locator");if(this.reader.setIndex(b),this.checkSignature(h.ZIP64_CENTRAL_DIRECTORY_LOCATOR),this.readBlockZip64EndOfCentralLocator(),!this.isSignature(this.relativeOffsetEndOfZip64CentralDir,h.ZIP64_CENTRAL_DIRECTORY_END)&&(this.relativeOffsetEndOfZip64CentralDir=this.reader.lastIndexOfSignature(h.ZIP64_CENTRAL_DIRECTORY_END),this.relativeOffsetEndOfZip64CentralDir<0))throw new Error("Corrupted zip: can't find the ZIP64 end of central directory");this.reader.setIndex(this.relativeOffsetEndOfZip64CentralDir),this.checkSignature(h.ZIP64_CENTRAL_DIRECTORY_END),this.readBlockZip64EndOfCentral()}var x=this.centralDirOffset+this.centralDirSize;this.zip64&&(x+=20,x+=12+this.zip64EndOfCentralSize);var z=E-x;if(0<z)this.isSignature(E,h.CENTRAL_FILE_HEADER)||(this.reader.zero=z);else if(z<0)throw new Error("Corrupted zip: missing "+Math.abs(z)+" bytes.")},prepareReader:function(b){this.reader=c(b)},load:function(b){this.prepareReader(b),this.readEndOfCentral(),this.readCentralDir(),this.readLocalFiles()}},l.exports=v},{"./reader/readerFor":22,"./signature":23,"./support":30,"./utils":32,"./zipEntry":34}],34:[function(o,l,s){var c=o("./reader/readerFor"),f=o("./utils"),h=o("./compressedObject"),p=o("./crc32"),m=o("./utf8"),v=o("./compressions"),b=o("./support");function E(x,z){this.options=x,this.loadOptions=z}E.prototype={isEncrypted:function(){return(1&this.bitFlag)==1},useUTF8:function(){return(2048&this.bitFlag)==2048},readLocalPart:function(x){var z,g;if(x.skip(22),this.fileNameLength=x.readInt(2),g=x.readInt(2),this.fileName=x.readData(this.fileNameLength),x.skip(g),this.compressedSize===-1||this.uncompressedSize===-1)throw new Error("Bug or corrupted zip : didn't get enough information from the central directory (compressedSize === -1 || uncompressedSize === -1)");if((z=(function(w){for(var k in v)if(Object.prototype.hasOwnProperty.call(v,k)&&v[k].magic===w)return v[k];return null})(this.compressionMethod))===null)throw new Error("Corrupted zip : compression "+f.pretty(this.compressionMethod)+" unknown (inner file : "+f.transformTo("string",this.fileName)+")");this.decompressed=new h(this.compressedSize,this.uncompressedSize,this.crc32,z,x.readData(this.compressedSize))},readCentralPart:function(x){this.versionMadeBy=x.readInt(2),x.skip(2),this.bitFlag=x.readInt(2),this.compressionMethod=x.readString(2),this.date=x.readDate(),this.crc32=x.readInt(4),this.compressedSize=x.readInt(4),this.uncompressedSize=x.readInt(4);var z=x.readInt(2);if(this.extraFieldsLength=x.readInt(2),this.fileCommentLength=x.readInt(2),this.diskNumberStart=x.readInt(2),this.internalFileAttributes=x.readInt(2),this.externalFileAttributes=x.readInt(4),this.localHeaderOffset=x.readInt(4),this.isEncrypted())throw new Error("Encrypted zip are not supported");x.skip(z),this.readExtraFields(x),this.parseZIP64ExtraField(x),this.fileComment=x.readData(this.fileCommentLength)},processAttributes:function(){this.unixPermissions=null,this.dosPermissions=null;var x=this.versionMadeBy>>8;this.dir=!!(16&this.externalFileAttributes),x==0&&(this.dosPermissions=63&this.externalFileAttributes),x==3&&(this.unixPermissions=this.externalFileAttributes>>16&65535),this.dir||this.fileNameStr.slice(-1)!=="/"||(this.dir=!0)},parseZIP64ExtraField:function(){if(this.extraFields[1]){var x=c(this.extraFields[1].value);this.uncompressedSize===f.MAX_VALUE_32BITS&&(this.uncompressedSize=x.readInt(8)),this.compressedSize===f.MAX_VALUE_32BITS&&(this.compressedSize=x.readInt(8)),this.localHeaderOffset===f.MAX_VALUE_32BITS&&(this.localHeaderOffset=x.readInt(8)),this.diskNumberStart===f.MAX_VALUE_32BITS&&(this.diskNumberStart=x.readInt(4))}},readExtraFields:function(x){var z,g,w,k=x.index+this.extraFieldsLength;for(this.extraFields||(this.extraFields={});x.index+4<k;)z=x.readInt(2),g=x.readInt(2),w=x.readData(g),this.extraFields[z]={id:z,length:g,value:w};x.setIndex(k)},handleUTF8:function(){var x=b.uint8array?"uint8array":"array";if(this.useUTF8())this.fileNameStr=m.utf8decode(this.fileName),this.fileCommentStr=m.utf8decode(this.fileComment);else{var z=this.findExtraFieldUnicodePath();if(z!==null)this.fileNameStr=z;else{var g=f.transformTo(x,this.fileName);this.fileNameStr=this.loadOptions.decodeFileName(g)}var w=this.findExtraFieldUnicodeComment();if(w!==null)this.fileCommentStr=w;else{var k=f.transformTo(x,this.fileComment);this.fileCommentStr=this.loadOptions.decodeFileName(k)}}},findExtraFieldUnicodePath:function(){var x=this.extraFields[28789];if(x){var z=c(x.value);return z.readInt(1)!==1||p(this.fileName)!==z.readInt(4)?null:m.utf8decode(z.readData(x.length-5))}return null},findExtraFieldUnicodeComment:function(){var x=this.extraFields[25461];if(x){var z=c(x.value);return z.readInt(1)!==1||p(this.fileComment)!==z.readInt(4)?null:m.utf8decode(z.readData(x.length-5))}return null}},l.exports=E},{"./compressedObject":2,"./compressions":3,"./crc32":4,"./reader/readerFor":22,"./support":30,"./utf8":31,"./utils":32}],35:[function(o,l,s){function c(z,g,w){this.name=z,this.dir=w.dir,this.date=w.date,this.comment=w.comment,this.unixPermissions=w.unixPermissions,this.dosPermissions=w.dosPermissions,this._data=g,this._dataBinary=w.binary,this.options={compression:w.compression,compressionOptions:w.compressionOptions}}var f=o("./stream/StreamHelper"),h=o("./stream/DataWorker"),p=o("./utf8"),m=o("./compressedObject"),v=o("./stream/GenericWorker");c.prototype={internalStream:function(z){var g=null,w="string";try{if(!z)throw new Error("No output type specified.");var k=(w=z.toLowerCase())==="string"||w==="text";w!=="binarystring"&&w!=="text"||(w="string"),g=this._decompressWorker();var A=!this._dataBinary;A&&!k&&(g=g.pipe(new p.Utf8EncodeWorker)),!A&&k&&(g=g.pipe(new p.Utf8DecodeWorker))}catch(N){(g=new v("error")).error(N)}return new f(g,w,"")},async:function(z,g){return this.internalStream(z).accumulate(g)},nodeStream:function(z,g){return this.internalStream(z||"nodebuffer").toNodejsStream(g)},_compressWorker:function(z,g){if(this._data instanceof m&&this._data.compression.magic===z.magic)return this._data.getCompressedWorker();var w=this._decompressWorker();return this._dataBinary||(w=w.pipe(new p.Utf8EncodeWorker)),m.createWorkerFrom(w,z,g)},_decompressWorker:function(){return this._data instanceof m?this._data.getContentWorker():this._data instanceof v?this._data:new h(this._data)}};for(var b=["asText","asBinary","asNodeBuffer","asUint8Array","asArrayBuffer"],E=function(){throw new Error("This method has been removed in JSZip 3.0, please check the upgrade guide.")},x=0;x<b.length;x++)c.prototype[b[x]]=E;l.exports=c},{"./compressedObject":2,"./stream/DataWorker":27,"./stream/GenericWorker":28,"./stream/StreamHelper":29,"./utf8":31}],36:[function(o,l,s){(function(c){var f,h,p=c.MutationObserver||c.WebKitMutationObserver;if(p){var m=0,v=new p(z),b=c.document.createTextNode("");v.observe(b,{characterData:!0}),f=function(){b.data=m=++m%2}}else if(c.setImmediate||c.MessageChannel===void 0)f="document"in c&&"onreadystatechange"in c.document.createElement("script")?function(){var g=c.document.createElement("script");g.onreadystatechange=function(){z(),g.onreadystatechange=null,g.parentNode.removeChild(g),g=null},c.document.documentElement.appendChild(g)}:function(){setTimeout(z,0)};else{var E=new c.MessageChannel;E.port1.onmessage=z,f=function(){E.port2.postMessage(0)}}var x=[];function z(){var g,w;h=!0;for(var k=x.length;k;){for(w=x,x=[],g=-1;++g<k;)w[g]();k=x.length}h=!1}l.exports=function(g){x.push(g)!==1||h||f()}}).call(this,typeof Gn<"u"?Gn:typeof self<"u"?self:typeof window<"u"?window:{})},{}],37:[function(o,l,s){var c=o("immediate");function f(){}var h={},p=["REJECTED"],m=["FULFILLED"],v=["PENDING"];function b(k){if(typeof k!="function")throw new TypeError("resolver must be a function");this.state=v,this.queue=[],this.outcome=void 0,k!==f&&g(this,k)}function E(k,A,N){this.promise=k,typeof A=="function"&&(this.onFulfilled=A,this.callFulfilled=this.otherCallFulfilled),typeof N=="function"&&(this.onRejected=N,this.callRejected=this.otherCallRejected)}function x(k,A,N){c(function(){var R;try{R=A(N)}catch(U){return h.reject(k,U)}R===k?h.reject(k,new TypeError("Cannot resolve promise with itself")):h.resolve(k,R)})}function z(k){var A=k&&k.then;if(k&&(typeof k=="object"||typeof k=="function")&&typeof A=="function")return function(){A.apply(k,arguments)}}function g(k,A){var N=!1;function R(H){N||(N=!0,h.reject(k,H))}function U(H){N||(N=!0,h.resolve(k,H))}var Y=w(function(){A(U,R)});Y.status==="error"&&R(Y.value)}function w(k,A){var N={};try{N.value=k(A),N.status="success"}catch(R){N.status="error",N.value=R}return N}(l.exports=b).prototype.finally=function(k){if(typeof k!="function")return this;var A=this.constructor;return this.then(function(N){return A.resolve(k()).then(function(){return N})},function(N){return A.resolve(k()).then(function(){throw N})})},b.prototype.catch=function(k){return this.then(null,k)},b.prototype.then=function(k,A){if(typeof k!="function"&&this.state===m||typeof A!="function"&&this.state===p)return this;var N=new this.constructor(f);return this.state!==v?x(N,this.state===m?k:A,this.outcome):this.queue.push(new E(N,k,A)),N},E.prototype.callFulfilled=function(k){h.resolve(this.promise,k)},E.prototype.otherCallFulfilled=function(k){x(this.promise,this.onFulfilled,k)},E.prototype.callRejected=function(k){h.reject(this.promise,k)},E.prototype.otherCallRejected=function(k){x(this.promise,this.onRejected,k)},h.resolve=function(k,A){var N=w(z,A);if(N.status==="error")return h.reject(k,N.value);var R=N.value;if(R)g(k,R);else{k.state=m,k.outcome=A;for(var U=-1,Y=k.queue.length;++U<Y;)k.queue[U].callFulfilled(A)}return k},h.reject=function(k,A){k.state=p,k.outcome=A;for(var N=-1,R=k.queue.length;++N<R;)k.queue[N].callRejected(A);return k},b.resolve=function(k){return k instanceof this?k:h.resolve(new this(f),k)},b.reject=function(k){var A=new this(f);return h.reject(A,k)},b.all=function(k){var A=this;if(Object.prototype.toString.call(k)!=="[object Array]")return this.reject(new TypeError("must be an array"));var N=k.length,R=!1;if(!N)return this.resolve([]);for(var U=new Array(N),Y=0,H=-1,I=new this(f);++H<N;)K(k[H],H);return I;function K(se,ge){A.resolve(se).then(function(B){U[ge]=B,++Y!==N||R||(R=!0,h.resolve(I,U))},function(B){R||(R=!0,h.reject(I,B))})}},b.race=function(k){var A=this;if(Object.prototype.toString.call(k)!=="[object Array]")return this.reject(new TypeError("must be an array"));var N=k.length,R=!1;if(!N)return this.resolve([]);for(var U=-1,Y=new this(f);++U<N;)H=k[U],A.resolve(H).then(function(I){R||(R=!0,h.resolve(Y,I))},function(I){R||(R=!0,h.reject(Y,I))});var H;return Y}},{immediate:36}],38:[function(o,l,s){var c={};(0,o("./lib/utils/common").assign)(c,o("./lib/deflate"),o("./lib/inflate"),o("./lib/zlib/constants")),l.exports=c},{"./lib/deflate":39,"./lib/inflate":40,"./lib/utils/common":41,"./lib/zlib/constants":44}],39:[function(o,l,s){var c=o("./zlib/deflate"),f=o("./utils/common"),h=o("./utils/strings"),p=o("./zlib/messages"),m=o("./zlib/zstream"),v=Object.prototype.toString,b=0,E=-1,x=0,z=8;function g(k){if(!(this instanceof g))return new g(k);this.options=f.assign({level:E,method:z,chunkSize:16384,windowBits:15,memLevel:8,strategy:x,to:""},k||{});var A=this.options;A.raw&&0<A.windowBits?A.windowBits=-A.windowBits:A.gzip&&0<A.windowBits&&A.windowBits<16&&(A.windowBits+=16),this.err=0,this.msg="",this.ended=!1,this.chunks=[],this.strm=new m,this.strm.avail_out=0;var N=c.deflateInit2(this.strm,A.level,A.method,A.windowBits,A.memLevel,A.strategy);if(N!==b)throw new Error(p[N]);if(A.header&&c.deflateSetHeader(this.strm,A.header),A.dictionary){var R;if(R=typeof A.dictionary=="string"?h.string2buf(A.dictionary):v.call(A.dictionary)==="[object ArrayBuffer]"?new Uint8Array(A.dictionary):A.dictionary,(N=c.deflateSetDictionary(this.strm,R))!==b)throw new Error(p[N]);this._dict_set=!0}}function w(k,A){var N=new g(A);if(N.push(k,!0),N.err)throw N.msg||p[N.err];return N.result}g.prototype.push=function(k,A){var N,R,U=this.strm,Y=this.options.chunkSize;if(this.ended)return!1;R=A===~~A?A:A===!0?4:0,typeof k=="string"?U.input=h.string2buf(k):v.call(k)==="[object ArrayBuffer]"?U.input=new Uint8Array(k):U.input=k,U.next_in=0,U.avail_in=U.input.length;do{if(U.avail_out===0&&(U.output=new f.Buf8(Y),U.next_out=0,U.avail_out=Y),(N=c.deflate(U,R))!==1&&N!==b)return this.onEnd(N),!(this.ended=!0);U.avail_out!==0&&(U.avail_in!==0||R!==4&&R!==2)||(this.options.to==="string"?this.onData(h.buf2binstring(f.shrinkBuf(U.output,U.next_out))):this.onData(f.shrinkBuf(U.output,U.next_out)))}while((0<U.avail_in||U.avail_out===0)&&N!==1);return R===4?(N=c.deflateEnd(this.strm),this.onEnd(N),this.ended=!0,N===b):R!==2||(this.onEnd(b),!(U.avail_out=0))},g.prototype.onData=function(k){this.chunks.push(k)},g.prototype.onEnd=function(k){k===b&&(this.options.to==="string"?this.result=this.chunks.join(""):this.result=f.flattenChunks(this.chunks)),this.chunks=[],this.err=k,this.msg=this.strm.msg},s.Deflate=g,s.deflate=w,s.deflateRaw=function(k,A){return(A=A||{}).raw=!0,w(k,A)},s.gzip=function(k,A){return(A=A||{}).gzip=!0,w(k,A)}},{"./utils/common":41,"./utils/strings":42,"./zlib/deflate":46,"./zlib/messages":51,"./zlib/zstream":53}],40:[function(o,l,s){var c=o("./zlib/inflate"),f=o("./utils/common"),h=o("./utils/strings"),p=o("./zlib/constants"),m=o("./zlib/messages"),v=o("./zlib/zstream"),b=o("./zlib/gzheader"),E=Object.prototype.toString;function x(g){if(!(this instanceof x))return new x(g);this.options=f.assign({chunkSize:16384,windowBits:0,to:""},g||{});var w=this.options;w.raw&&0<=w.windowBits&&w.windowBits<16&&(w.windowBits=-w.windowBits,w.windowBits===0&&(w.windowBits=-15)),!(0<=w.windowBits&&w.windowBits<16)||g&&g.windowBits||(w.windowBits+=32),15<w.windowBits&&w.windowBits<48&&(15&w.windowBits)==0&&(w.windowBits|=15),this.err=0,this.msg="",this.ended=!1,this.chunks=[],this.strm=new v,this.strm.avail_out=0;var k=c.inflateInit2(this.strm,w.windowBits);if(k!==p.Z_OK)throw new Error(m[k]);this.header=new b,c.inflateGetHeader(this.strm,this.header)}function z(g,w){var k=new x(w);if(k.push(g,!0),k.err)throw k.msg||m[k.err];return k.result}x.prototype.push=function(g,w){var k,A,N,R,U,Y,H=this.strm,I=this.options.chunkSize,K=this.options.dictionary,se=!1;if(this.ended)return!1;A=w===~~w?w:w===!0?p.Z_FINISH:p.Z_NO_FLUSH,typeof g=="string"?H.input=h.binstring2buf(g):E.call(g)==="[object ArrayBuffer]"?H.input=new Uint8Array(g):H.input=g,H.next_in=0,H.avail_in=H.input.length;do{if(H.avail_out===0&&(H.output=new f.Buf8(I),H.next_out=0,H.avail_out=I),(k=c.inflate(H,p.Z_NO_FLUSH))===p.Z_NEED_DICT&&K&&(Y=typeof K=="string"?h.string2buf(K):E.call(K)==="[object ArrayBuffer]"?new Uint8Array(K):K,k=c.inflateSetDictionary(this.strm,Y)),k===p.Z_BUF_ERROR&&se===!0&&(k=p.Z_OK,se=!1),k!==p.Z_STREAM_END&&k!==p.Z_OK)return this.onEnd(k),!(this.ended=!0);H.next_out&&(H.avail_out!==0&&k!==p.Z_STREAM_END&&(H.avail_in!==0||A!==p.Z_FINISH&&A!==p.Z_SYNC_FLUSH)||(this.options.to==="string"?(N=h.utf8border(H.output,H.next_out),R=H.next_out-N,U=h.buf2string(H.output,N),H.next_out=R,H.avail_out=I-R,R&&f.arraySet(H.output,H.output,N,R,0),this.onData(U)):this.onData(f.shrinkBuf(H.output,H.next_out)))),H.avail_in===0&&H.avail_out===0&&(se=!0)}while((0<H.avail_in||H.avail_out===0)&&k!==p.Z_STREAM_END);return k===p.Z_STREAM_END&&(A=p.Z_FINISH),A===p.Z_FINISH?(k=c.inflateEnd(this.strm),this.onEnd(k),this.ended=!0,k===p.Z_OK):A!==p.Z_SYNC_FLUSH||(this.onEnd(p.Z_OK),!(H.avail_out=0))},x.prototype.onData=function(g){this.chunks.push(g)},x.prototype.onEnd=function(g){g===p.Z_OK&&(this.options.to==="string"?this.result=this.chunks.join(""):this.result=f.flattenChunks(this.chunks)),this.chunks=[],this.err=g,this.msg=this.strm.msg},s.Inflate=x,s.inflate=z,s.inflateRaw=function(g,w){return(w=w||{}).raw=!0,z(g,w)},s.ungzip=z},{"./utils/common":41,"./utils/strings":42,"./zlib/constants":44,"./zlib/gzheader":47,"./zlib/inflate":49,"./zlib/messages":51,"./zlib/zstream":53}],41:[function(o,l,s){var c=typeof Uint8Array<"u"&&typeof Uint16Array<"u"&&typeof Int32Array<"u";s.assign=function(p){for(var m=Array.prototype.slice.call(arguments,1);m.length;){var v=m.shift();if(v){if(typeof v!="object")throw new TypeError(v+"must be non-object");for(var b in v)v.hasOwnProperty(b)&&(p[b]=v[b])}}return p},s.shrinkBuf=function(p,m){return p.length===m?p:p.subarray?p.subarray(0,m):(p.length=m,p)};var f={arraySet:function(p,m,v,b,E){if(m.subarray&&p.subarray)p.set(m.subarray(v,v+b),E);else for(var x=0;x<b;x++)p[E+x]=m[v+x]},flattenChunks:function(p){var m,v,b,E,x,z;for(m=b=0,v=p.length;m<v;m++)b+=p[m].length;for(z=new Uint8Array(b),m=E=0,v=p.length;m<v;m++)x=p[m],z.set(x,E),E+=x.length;return z}},h={arraySet:function(p,m,v,b,E){for(var x=0;x<b;x++)p[E+x]=m[v+x]},flattenChunks:function(p){return[].concat.apply([],p)}};s.setTyped=function(p){p?(s.Buf8=Uint8Array,s.Buf16=Uint16Array,s.Buf32=Int32Array,s.assign(s,f)):(s.Buf8=Array,s.Buf16=Array,s.Buf32=Array,s.assign(s,h))},s.setTyped(c)},{}],42:[function(o,l,s){var c=o("./common"),f=!0,h=!0;try{String.fromCharCode.apply(null,[0])}catch{f=!1}try{String.fromCharCode.apply(null,new Uint8Array(1))}catch{h=!1}for(var p=new c.Buf8(256),m=0;m<256;m++)p[m]=252<=m?6:248<=m?5:240<=m?4:224<=m?3:192<=m?2:1;function v(b,E){if(E<65537&&(b.subarray&&h||!b.subarray&&f))return String.fromCharCode.apply(null,c.shrinkBuf(b,E));for(var x="",z=0;z<E;z++)x+=String.fromCharCode(b[z]);return x}p[254]=p[254]=1,s.string2buf=function(b){var E,x,z,g,w,k=b.length,A=0;for(g=0;g<k;g++)(64512&(x=b.charCodeAt(g)))==55296&&g+1<k&&(64512&(z=b.charCodeAt(g+1)))==56320&&(x=65536+(x-55296<<10)+(z-56320),g++),A+=x<128?1:x<2048?2:x<65536?3:4;for(E=new c.Buf8(A),g=w=0;w<A;g++)(64512&(x=b.charCodeAt(g)))==55296&&g+1<k&&(64512&(z=b.charCodeAt(g+1)))==56320&&(x=65536+(x-55296<<10)+(z-56320),g++),x<128?E[w++]=x:(x<2048?E[w++]=192|x>>>6:(x<65536?E[w++]=224|x>>>12:(E[w++]=240|x>>>18,E[w++]=128|x>>>12&63),E[w++]=128|x>>>6&63),E[w++]=128|63&x);return E},s.buf2binstring=function(b){return v(b,b.length)},s.binstring2buf=function(b){for(var E=new c.Buf8(b.length),x=0,z=E.length;x<z;x++)E[x]=b.charCodeAt(x);return E},s.buf2string=function(b,E){var x,z,g,w,k=E||b.length,A=new Array(2*k);for(x=z=0;x<k;)if((g=b[x++])<128)A[z++]=g;else if(4<(w=p[g]))A[z++]=65533,x+=w-1;else{for(g&=w===2?31:w===3?15:7;1<w&&x<k;)g=g<<6|63&b[x++],w--;1<w?A[z++]=65533:g<65536?A[z++]=g:(g-=65536,A[z++]=55296|g>>10&1023,A[z++]=56320|1023&g)}return v(A,z)},s.utf8border=function(b,E){var x;for((E=E||b.length)>b.length&&(E=b.length),x=E-1;0<=x&&(192&b[x])==128;)x--;return x<0||x===0?E:x+p[b[x]]>E?x:E}},{"./common":41}],43:[function(o,l,s){l.exports=function(c,f,h,p){for(var m=65535&c|0,v=c>>>16&65535|0,b=0;h!==0;){for(h-=b=2e3<h?2e3:h;v=v+(m=m+f[p++]|0)|0,--b;);m%=65521,v%=65521}return m|v<<16|0}},{}],44:[function(o,l,s){l.exports={Z_NO_FLUSH:0,Z_PARTIAL_FLUSH:1,Z_SYNC_FLUSH:2,Z_FULL_FLUSH:3,Z_FINISH:4,Z_BLOCK:5,Z_TREES:6,Z_OK:0,Z_STREAM_END:1,Z_NEED_DICT:2,Z_ERRNO:-1,Z_STREAM_ERROR:-2,Z_DATA_ERROR:-3,Z_BUF_ERROR:-5,Z_NO_COMPRESSION:0,Z_BEST_SPEED:1,Z_BEST_COMPRESSION:9,Z_DEFAULT_COMPRESSION:-1,Z_FILTERED:1,Z_HUFFMAN_ONLY:2,Z_RLE:3,Z_FIXED:4,Z_DEFAULT_STRATEGY:0,Z_BINARY:0,Z_TEXT:1,Z_UNKNOWN:2,Z_DEFLATED:8}},{}],45:[function(o,l,s){var c=(function(){for(var f,h=[],p=0;p<256;p++){f=p;for(var m=0;m<8;m++)f=1&f?3988292384^f>>>1:f>>>1;h[p]=f}return h})();l.exports=function(f,h,p,m){var v=c,b=m+p;f^=-1;for(var E=m;E<b;E++)f=f>>>8^v[255&(f^h[E])];return-1^f}},{}],46:[function(o,l,s){var c,f=o("../utils/common"),h=o("./trees"),p=o("./adler32"),m=o("./crc32"),v=o("./messages"),b=0,E=4,x=0,z=-2,g=-1,w=4,k=2,A=8,N=9,R=286,U=30,Y=19,H=2*R+1,I=15,K=3,se=258,ge=se+K+1,B=42,W=113,C=1,ae=2,V=3,q=4;function Q(S,ue){return S.msg=v[ue],ue}function ne(S){return(S<<1)-(4<S?9:0)}function ve(S){for(var ue=S.length;0<=--ue;)S[ue]=0}function O(S){var ue=S.state,ie=ue.pending;ie>S.avail_out&&(ie=S.avail_out),ie!==0&&(f.arraySet(S.output,ue.pending_buf,ue.pending_out,ie,S.next_out),S.next_out+=ie,ue.pending_out+=ie,S.total_out+=ie,S.avail_out-=ie,ue.pending-=ie,ue.pending===0&&(ue.pending_out=0))}function D(S,ue){h._tr_flush_block(S,0<=S.block_start?S.block_start:-1,S.strstart-S.block_start,ue),S.block_start=S.strstart,O(S.strm)}function re(S,ue){S.pending_buf[S.pending++]=ue}function ee(S,ue){S.pending_buf[S.pending++]=ue>>>8&255,S.pending_buf[S.pending++]=255&ue}function le(S,ue){var ie,L,M=S.max_chain_length,X=S.strstart,pe=S.prev_length,me=S.nice_match,$=S.strstart>S.w_size-ge?S.strstart-(S.w_size-ge):0,be=S.window,_e=S.w_mask,xe=S.prev,De=S.strstart+se,it=be[X+pe-1],Ye=be[X+pe];S.prev_length>=S.good_match&&(M>>=2),me>S.lookahead&&(me=S.lookahead);do if(be[(ie=ue)+pe]===Ye&&be[ie+pe-1]===it&&be[ie]===be[X]&&be[++ie]===be[X+1]){X+=2,ie++;do;while(be[++X]===be[++ie]&&be[++X]===be[++ie]&&be[++X]===be[++ie]&&be[++X]===be[++ie]&&be[++X]===be[++ie]&&be[++X]===be[++ie]&&be[++X]===be[++ie]&&be[++X]===be[++ie]&&X<De);if(L=se-(De-X),X=De-se,pe<L){if(S.match_start=ue,me<=(pe=L))break;it=be[X+pe-1],Ye=be[X+pe]}}while((ue=xe[ue&_e])>$&&--M!=0);return pe<=S.lookahead?pe:S.lookahead}function Ee(S){var ue,ie,L,M,X,pe,me,$,be,_e,xe=S.w_size;do{if(M=S.window_size-S.lookahead-S.strstart,S.strstart>=xe+(xe-ge)){for(f.arraySet(S.window,S.window,xe,xe,0),S.match_start-=xe,S.strstart-=xe,S.block_start-=xe,ue=ie=S.hash_size;L=S.head[--ue],S.head[ue]=xe<=L?L-xe:0,--ie;);for(ue=ie=xe;L=S.prev[--ue],S.prev[ue]=xe<=L?L-xe:0,--ie;);M+=xe}if(S.strm.avail_in===0)break;if(pe=S.strm,me=S.window,$=S.strstart+S.lookahead,be=M,_e=void 0,_e=pe.avail_in,be<_e&&(_e=be),ie=_e===0?0:(pe.avail_in-=_e,f.arraySet(me,pe.input,pe.next_in,_e,$),pe.state.wrap===1?pe.adler=p(pe.adler,me,_e,$):pe.state.wrap===2&&(pe.adler=m(pe.adler,me,_e,$)),pe.next_in+=_e,pe.total_in+=_e,_e),S.lookahead+=ie,S.lookahead+S.insert>=K)for(X=S.strstart-S.insert,S.ins_h=S.window[X],S.ins_h=(S.ins_h<<S.hash_shift^S.window[X+1])&S.hash_mask;S.insert&&(S.ins_h=(S.ins_h<<S.hash_shift^S.window[X+K-1])&S.hash_mask,S.prev[X&S.w_mask]=S.head[S.ins_h],S.head[S.ins_h]=X,X++,S.insert--,!(S.lookahead+S.insert<K)););}while(S.lookahead<ge&&S.strm.avail_in!==0)}function he(S,ue){for(var ie,L;;){if(S.lookahead<ge){if(Ee(S),S.lookahead<ge&&ue===b)return C;if(S.lookahead===0)break}if(ie=0,S.lookahead>=K&&(S.ins_h=(S.ins_h<<S.hash_shift^S.window[S.strstart+K-1])&S.hash_mask,ie=S.prev[S.strstart&S.w_mask]=S.head[S.ins_h],S.head[S.ins_h]=S.strstart),ie!==0&&S.strstart-ie<=S.w_size-ge&&(S.match_length=le(S,ie)),S.match_length>=K)if(L=h._tr_tally(S,S.strstart-S.match_start,S.match_length-K),S.lookahead-=S.match_length,S.match_length<=S.max_lazy_match&&S.lookahead>=K){for(S.match_length--;S.strstart++,S.ins_h=(S.ins_h<<S.hash_shift^S.window[S.strstart+K-1])&S.hash_mask,ie=S.prev[S.strstart&S.w_mask]=S.head[S.ins_h],S.head[S.ins_h]=S.strstart,--S.match_length!=0;);S.strstart++}else S.strstart+=S.match_length,S.match_length=0,S.ins_h=S.window[S.strstart],S.ins_h=(S.ins_h<<S.hash_shift^S.window[S.strstart+1])&S.hash_mask;else L=h._tr_tally(S,0,S.window[S.strstart]),S.lookahead--,S.strstart++;if(L&&(D(S,!1),S.strm.avail_out===0))return C}return S.insert=S.strstart<K-1?S.strstart:K-1,ue===E?(D(S,!0),S.strm.avail_out===0?V:q):S.last_lit&&(D(S,!1),S.strm.avail_out===0)?C:ae}function Se(S,ue){for(var ie,L,M;;){if(S.lookahead<ge){if(Ee(S),S.lookahead<ge&&ue===b)return C;if(S.lookahead===0)break}if(ie=0,S.lookahead>=K&&(S.ins_h=(S.ins_h<<S.hash_shift^S.window[S.strstart+K-1])&S.hash_mask,ie=S.prev[S.strstart&S.w_mask]=S.head[S.ins_h],S.head[S.ins_h]=S.strstart),S.prev_length=S.match_length,S.prev_match=S.match_start,S.match_length=K-1,ie!==0&&S.prev_length<S.max_lazy_match&&S.strstart-ie<=S.w_size-ge&&(S.match_length=le(S,ie),S.match_length<=5&&(S.strategy===1||S.match_length===K&&4096<S.strstart-S.match_start)&&(S.match_length=K-1)),S.prev_length>=K&&S.match_length<=S.prev_length){for(M=S.strstart+S.lookahead-K,L=h._tr_tally(S,S.strstart-1-S.prev_match,S.prev_length-K),S.lookahead-=S.prev_length-1,S.prev_length-=2;++S.strstart<=M&&(S.ins_h=(S.ins_h<<S.hash_shift^S.window[S.strstart+K-1])&S.hash_mask,ie=S.prev[S.strstart&S.w_mask]=S.head[S.ins_h],S.head[S.ins_h]=S.strstart),--S.prev_length!=0;);if(S.match_available=0,S.match_length=K-1,S.strstart++,L&&(D(S,!1),S.strm.avail_out===0))return C}else if(S.match_available){if((L=h._tr_tally(S,0,S.window[S.strstart-1]))&&D(S,!1),S.strstart++,S.lookahead--,S.strm.avail_out===0)return C}else S.match_available=1,S.strstart++,S.lookahead--}return S.match_available&&(L=h._tr_tally(S,0,S.window[S.strstart-1]),S.match_available=0),S.insert=S.strstart<K-1?S.strstart:K-1,ue===E?(D(S,!0),S.strm.avail_out===0?V:q):S.last_lit&&(D(S,!1),S.strm.avail_out===0)?C:ae}function ke(S,ue,ie,L,M){this.good_length=S,this.max_lazy=ue,this.nice_length=ie,this.max_chain=L,this.func=M}function Me(){this.strm=null,this.status=0,this.pending_buf=null,this.pending_buf_size=0,this.pending_out=0,this.pending=0,this.wrap=0,this.gzhead=null,this.gzindex=0,this.method=A,this.last_flush=-1,this.w_size=0,this.w_bits=0,this.w_mask=0,this.window=null,this.window_size=0,this.prev=null,this.head=null,this.ins_h=0,this.hash_size=0,this.hash_bits=0,this.hash_mask=0,this.hash_shift=0,this.block_start=0,this.match_length=0,this.prev_match=0,this.match_available=0,this.strstart=0,this.match_start=0,this.lookahead=0,this.prev_length=0,this.max_chain_length=0,this.max_lazy_match=0,this.level=0,this.strategy=0,this.good_match=0,this.nice_match=0,this.dyn_ltree=new f.Buf16(2*H),this.dyn_dtree=new f.Buf16(2*(2*U+1)),this.bl_tree=new f.Buf16(2*(2*Y+1)),ve(this.dyn_ltree),ve(this.dyn_dtree),ve(this.bl_tree),this.l_desc=null,this.d_desc=null,this.bl_desc=null,this.bl_count=new f.Buf16(I+1),this.heap=new f.Buf16(2*R+1),ve(this.heap),this.heap_len=0,this.heap_max=0,this.depth=new f.Buf16(2*R+1),ve(this.depth),this.l_buf=0,this.lit_bufsize=0,this.last_lit=0,this.d_buf=0,this.opt_len=0,this.static_len=0,this.matches=0,this.insert=0,this.bi_buf=0,this.bi_valid=0}function Re(S){var ue;return S&&S.state?(S.total_in=S.total_out=0,S.data_type=k,(ue=S.state).pending=0,ue.pending_out=0,ue.wrap<0&&(ue.wrap=-ue.wrap),ue.status=ue.wrap?B:W,S.adler=ue.wrap===2?0:1,ue.last_flush=b,h._tr_init(ue),x):Q(S,z)}function Le(S){var ue=Re(S);return ue===x&&(function(ie){ie.window_size=2*ie.w_size,ve(ie.head),ie.max_lazy_match=c[ie.level].max_lazy,ie.good_match=c[ie.level].good_length,ie.nice_match=c[ie.level].nice_length,ie.max_chain_length=c[ie.level].max_chain,ie.strstart=0,ie.block_start=0,ie.lookahead=0,ie.insert=0,ie.match_length=ie.prev_length=K-1,ie.match_available=0,ie.ins_h=0})(S.state),ue}function st(S,ue,ie,L,M,X){if(!S)return z;var pe=1;if(ue===g&&(ue=6),L<0?(pe=0,L=-L):15<L&&(pe=2,L-=16),M<1||N<M||ie!==A||L<8||15<L||ue<0||9<ue||X<0||w<X)return Q(S,z);L===8&&(L=9);var me=new Me;return(S.state=me).strm=S,me.wrap=pe,me.gzhead=null,me.w_bits=L,me.w_size=1<<me.w_bits,me.w_mask=me.w_size-1,me.hash_bits=M+7,me.hash_size=1<<me.hash_bits,me.hash_mask=me.hash_size-1,me.hash_shift=~~((me.hash_bits+K-1)/K),me.window=new f.Buf8(2*me.w_size),me.head=new f.Buf16(me.hash_size),me.prev=new f.Buf16(me.w_size),me.lit_bufsize=1<<M+6,me.pending_buf_size=4*me.lit_bufsize,me.pending_buf=new f.Buf8(me.pending_buf_size),me.d_buf=1*me.lit_bufsize,me.l_buf=3*me.lit_bufsize,me.level=ue,me.strategy=X,me.method=ie,Le(S)}c=[new ke(0,0,0,0,function(S,ue){var ie=65535;for(ie>S.pending_buf_size-5&&(ie=S.pending_buf_size-5);;){if(S.lookahead<=1){if(Ee(S),S.lookahead===0&&ue===b)return C;if(S.lookahead===0)break}S.strstart+=S.lookahead,S.lookahead=0;var L=S.block_start+ie;if((S.strstart===0||S.strstart>=L)&&(S.lookahead=S.strstart-L,S.strstart=L,D(S,!1),S.strm.avail_out===0)||S.strstart-S.block_start>=S.w_size-ge&&(D(S,!1),S.strm.avail_out===0))return C}return S.insert=0,ue===E?(D(S,!0),S.strm.avail_out===0?V:q):(S.strstart>S.block_start&&(D(S,!1),S.strm.avail_out),C)}),new ke(4,4,8,4,he),new ke(4,5,16,8,he),new ke(4,6,32,32,he),new ke(4,4,16,16,Se),new ke(8,16,32,32,Se),new ke(8,16,128,128,Se),new ke(8,32,128,256,Se),new ke(32,128,258,1024,Se),new ke(32,258,258,4096,Se)],s.deflateInit=function(S,ue){return st(S,ue,A,15,8,0)},s.deflateInit2=st,s.deflateReset=Le,s.deflateResetKeep=Re,s.deflateSetHeader=function(S,ue){return S&&S.state?S.state.wrap!==2?z:(S.state.gzhead=ue,x):z},s.deflate=function(S,ue){var ie,L,M,X;if(!S||!S.state||5<ue||ue<0)return S?Q(S,z):z;if(L=S.state,!S.output||!S.input&&S.avail_in!==0||L.status===666&&ue!==E)return Q(S,S.avail_out===0?-5:z);if(L.strm=S,ie=L.last_flush,L.last_flush=ue,L.status===B)if(L.wrap===2)S.adler=0,re(L,31),re(L,139),re(L,8),L.gzhead?(re(L,(L.gzhead.text?1:0)+(L.gzhead.hcrc?2:0)+(L.gzhead.extra?4:0)+(L.gzhead.name?8:0)+(L.gzhead.comment?16:0)),re(L,255&L.gzhead.time),re(L,L.gzhead.time>>8&255),re(L,L.gzhead.time>>16&255),re(L,L.gzhead.time>>24&255),re(L,L.level===9?2:2<=L.strategy||L.level<2?4:0),re(L,255&L.gzhead.os),L.gzhead.extra&&L.gzhead.extra.length&&(re(L,255&L.gzhead.extra.length),re(L,L.gzhead.extra.length>>8&255)),L.gzhead.hcrc&&(S.adler=m(S.adler,L.pending_buf,L.pending,0)),L.gzindex=0,L.status=69):(re(L,0),re(L,0),re(L,0),re(L,0),re(L,0),re(L,L.level===9?2:2<=L.strategy||L.level<2?4:0),re(L,3),L.status=W);else{var pe=A+(L.w_bits-8<<4)<<8;pe|=(2<=L.strategy||L.level<2?0:L.level<6?1:L.level===6?2:3)<<6,L.strstart!==0&&(pe|=32),pe+=31-pe%31,L.status=W,ee(L,pe),L.strstart!==0&&(ee(L,S.adler>>>16),ee(L,65535&S.adler)),S.adler=1}if(L.status===69)if(L.gzhead.extra){for(M=L.pending;L.gzindex<(65535&L.gzhead.extra.length)&&(L.pending!==L.pending_buf_size||(L.gzhead.hcrc&&L.pending>M&&(S.adler=m(S.adler,L.pending_buf,L.pending-M,M)),O(S),M=L.pending,L.pending!==L.pending_buf_size));)re(L,255&L.gzhead.extra[L.gzindex]),L.gzindex++;L.gzhead.hcrc&&L.pending>M&&(S.adler=m(S.adler,L.pending_buf,L.pending-M,M)),L.gzindex===L.gzhead.extra.length&&(L.gzindex=0,L.status=73)}else L.status=73;if(L.status===73)if(L.gzhead.name){M=L.pending;do{if(L.pending===L.pending_buf_size&&(L.gzhead.hcrc&&L.pending>M&&(S.adler=m(S.adler,L.pending_buf,L.pending-M,M)),O(S),M=L.pending,L.pending===L.pending_buf_size)){X=1;break}X=L.gzindex<L.gzhead.name.length?255&L.gzhead.name.charCodeAt(L.gzindex++):0,re(L,X)}while(X!==0);L.gzhead.hcrc&&L.pending>M&&(S.adler=m(S.adler,L.pending_buf,L.pending-M,M)),X===0&&(L.gzindex=0,L.status=91)}else L.status=91;if(L.status===91)if(L.gzhead.comment){M=L.pending;do{if(L.pending===L.pending_buf_size&&(L.gzhead.hcrc&&L.pending>M&&(S.adler=m(S.adler,L.pending_buf,L.pending-M,M)),O(S),M=L.pending,L.pending===L.pending_buf_size)){X=1;break}X=L.gzindex<L.gzhead.comment.length?255&L.gzhead.comment.charCodeAt(L.gzindex++):0,re(L,X)}while(X!==0);L.gzhead.hcrc&&L.pending>M&&(S.adler=m(S.adler,L.pending_buf,L.pending-M,M)),X===0&&(L.status=103)}else L.status=103;if(L.status===103&&(L.gzhead.hcrc?(L.pending+2>L.pending_buf_size&&O(S),L.pending+2<=L.pending_buf_size&&(re(L,255&S.adler),re(L,S.adler>>8&255),S.adler=0,L.status=W)):L.status=W),L.pending!==0){if(O(S),S.avail_out===0)return L.last_flush=-1,x}else if(S.avail_in===0&&ne(ue)<=ne(ie)&&ue!==E)return Q(S,-5);if(L.status===666&&S.avail_in!==0)return Q(S,-5);if(S.avail_in!==0||L.lookahead!==0||ue!==b&&L.status!==666){var me=L.strategy===2?(function($,be){for(var _e;;){if($.lookahead===0&&(Ee($),$.lookahead===0)){if(be===b)return C;break}if($.match_length=0,_e=h._tr_tally($,0,$.window[$.strstart]),$.lookahead--,$.strstart++,_e&&(D($,!1),$.strm.avail_out===0))return C}return $.insert=0,be===E?(D($,!0),$.strm.avail_out===0?V:q):$.last_lit&&(D($,!1),$.strm.avail_out===0)?C:ae})(L,ue):L.strategy===3?(function($,be){for(var _e,xe,De,it,Ye=$.window;;){if($.lookahead<=se){if(Ee($),$.lookahead<=se&&be===b)return C;if($.lookahead===0)break}if($.match_length=0,$.lookahead>=K&&0<$.strstart&&(xe=Ye[De=$.strstart-1])===Ye[++De]&&xe===Ye[++De]&&xe===Ye[++De]){it=$.strstart+se;do;while(xe===Ye[++De]&&xe===Ye[++De]&&xe===Ye[++De]&&xe===Ye[++De]&&xe===Ye[++De]&&xe===Ye[++De]&&xe===Ye[++De]&&xe===Ye[++De]&&De<it);$.match_length=se-(it-De),$.match_length>$.lookahead&&($.match_length=$.lookahead)}if($.match_length>=K?(_e=h._tr_tally($,1,$.match_length-K),$.lookahead-=$.match_length,$.strstart+=$.match_length,$.match_length=0):(_e=h._tr_tally($,0,$.window[$.strstart]),$.lookahead--,$.strstart++),_e&&(D($,!1),$.strm.avail_out===0))return C}return $.insert=0,be===E?(D($,!0),$.strm.avail_out===0?V:q):$.last_lit&&(D($,!1),$.strm.avail_out===0)?C:ae})(L,ue):c[L.level].func(L,ue);if(me!==V&&me!==q||(L.status=666),me===C||me===V)return S.avail_out===0&&(L.last_flush=-1),x;if(me===ae&&(ue===1?h._tr_align(L):ue!==5&&(h._tr_stored_block(L,0,0,!1),ue===3&&(ve(L.head),L.lookahead===0&&(L.strstart=0,L.block_start=0,L.insert=0))),O(S),S.avail_out===0))return L.last_flush=-1,x}return ue!==E?x:L.wrap<=0?1:(L.wrap===2?(re(L,255&S.adler),re(L,S.adler>>8&255),re(L,S.adler>>16&255),re(L,S.adler>>24&255),re(L,255&S.total_in),re(L,S.total_in>>8&255),re(L,S.total_in>>16&255),re(L,S.total_in>>24&255)):(ee(L,S.adler>>>16),ee(L,65535&S.adler)),O(S),0<L.wrap&&(L.wrap=-L.wrap),L.pending!==0?x:1)},s.deflateEnd=function(S){var ue;return S&&S.state?(ue=S.state.status)!==B&&ue!==69&&ue!==73&&ue!==91&&ue!==103&&ue!==W&&ue!==666?Q(S,z):(S.state=null,ue===W?Q(S,-3):x):z},s.deflateSetDictionary=function(S,ue){var ie,L,M,X,pe,me,$,be,_e=ue.length;if(!S||!S.state||(X=(ie=S.state).wrap)===2||X===1&&ie.status!==B||ie.lookahead)return z;for(X===1&&(S.adler=p(S.adler,ue,_e,0)),ie.wrap=0,_e>=ie.w_size&&(X===0&&(ve(ie.head),ie.strstart=0,ie.block_start=0,ie.insert=0),be=new f.Buf8(ie.w_size),f.arraySet(be,ue,_e-ie.w_size,ie.w_size,0),ue=be,_e=ie.w_size),pe=S.avail_in,me=S.next_in,$=S.input,S.avail_in=_e,S.next_in=0,S.input=ue,Ee(ie);ie.lookahead>=K;){for(L=ie.strstart,M=ie.lookahead-(K-1);ie.ins_h=(ie.ins_h<<ie.hash_shift^ie.window[L+K-1])&ie.hash_mask,ie.prev[L&ie.w_mask]=ie.head[ie.ins_h],ie.head[ie.ins_h]=L,L++,--M;);ie.strstart=L,ie.lookahead=K-1,Ee(ie)}return ie.strstart+=ie.lookahead,ie.block_start=ie.strstart,ie.insert=ie.lookahead,ie.lookahead=0,ie.match_length=ie.prev_length=K-1,ie.match_available=0,S.next_in=me,S.input=$,S.avail_in=pe,ie.wrap=X,x},s.deflateInfo="pako deflate (from Nodeca project)"},{"../utils/common":41,"./adler32":43,"./crc32":45,"./messages":51,"./trees":52}],47:[function(o,l,s){l.exports=function(){this.text=0,this.time=0,this.xflags=0,this.os=0,this.extra=null,this.extra_len=0,this.name="",this.comment="",this.hcrc=0,this.done=!1}},{}],48:[function(o,l,s){l.exports=function(c,f){var h,p,m,v,b,E,x,z,g,w,k,A,N,R,U,Y,H,I,K,se,ge,B,W,C,ae;h=c.state,p=c.next_in,C=c.input,m=p+(c.avail_in-5),v=c.next_out,ae=c.output,b=v-(f-c.avail_out),E=v+(c.avail_out-257),x=h.dmax,z=h.wsize,g=h.whave,w=h.wnext,k=h.window,A=h.hold,N=h.bits,R=h.lencode,U=h.distcode,Y=(1<<h.lenbits)-1,H=(1<<h.distbits)-1;e:do{N<15&&(A+=C[p++]<<N,N+=8,A+=C[p++]<<N,N+=8),I=R[A&Y];t:for(;;){if(A>>>=K=I>>>24,N-=K,(K=I>>>16&255)===0)ae[v++]=65535&I;else{if(!(16&K)){if((64&K)==0){I=R[(65535&I)+(A&(1<<K)-1)];continue t}if(32&K){h.mode=12;break e}c.msg="invalid literal/length code",h.mode=30;break e}se=65535&I,(K&=15)&&(N<K&&(A+=C[p++]<<N,N+=8),se+=A&(1<<K)-1,A>>>=K,N-=K),N<15&&(A+=C[p++]<<N,N+=8,A+=C[p++]<<N,N+=8),I=U[A&H];a:for(;;){if(A>>>=K=I>>>24,N-=K,!(16&(K=I>>>16&255))){if((64&K)==0){I=U[(65535&I)+(A&(1<<K)-1)];continue a}c.msg="invalid distance code",h.mode=30;break e}if(ge=65535&I,N<(K&=15)&&(A+=C[p++]<<N,(N+=8)<K&&(A+=C[p++]<<N,N+=8)),x<(ge+=A&(1<<K)-1)){c.msg="invalid distance too far back",h.mode=30;break e}if(A>>>=K,N-=K,(K=v-b)<ge){if(g<(K=ge-K)&&h.sane){c.msg="invalid distance too far back",h.mode=30;break e}if(W=k,(B=0)===w){if(B+=z-K,K<se){for(se-=K;ae[v++]=k[B++],--K;);B=v-ge,W=ae}}else if(w<K){if(B+=z+w-K,(K-=w)<se){for(se-=K;ae[v++]=k[B++],--K;);if(B=0,w<se){for(se-=K=w;ae[v++]=k[B++],--K;);B=v-ge,W=ae}}}else if(B+=w-K,K<se){for(se-=K;ae[v++]=k[B++],--K;);B=v-ge,W=ae}for(;2<se;)ae[v++]=W[B++],ae[v++]=W[B++],ae[v++]=W[B++],se-=3;se&&(ae[v++]=W[B++],1<se&&(ae[v++]=W[B++]))}else{for(B=v-ge;ae[v++]=ae[B++],ae[v++]=ae[B++],ae[v++]=ae[B++],2<(se-=3););se&&(ae[v++]=ae[B++],1<se&&(ae[v++]=ae[B++]))}break}}break}}while(p<m&&v<E);p-=se=N>>3,A&=(1<<(N-=se<<3))-1,c.next_in=p,c.next_out=v,c.avail_in=p<m?m-p+5:5-(p-m),c.avail_out=v<E?E-v+257:257-(v-E),h.hold=A,h.bits=N}},{}],49:[function(o,l,s){var c=o("../utils/common"),f=o("./adler32"),h=o("./crc32"),p=o("./inffast"),m=o("./inftrees"),v=1,b=2,E=0,x=-2,z=1,g=852,w=592;function k(B){return(B>>>24&255)+(B>>>8&65280)+((65280&B)<<8)+((255&B)<<24)}function A(){this.mode=0,this.last=!1,this.wrap=0,this.havedict=!1,this.flags=0,this.dmax=0,this.check=0,this.total=0,this.head=null,this.wbits=0,this.wsize=0,this.whave=0,this.wnext=0,this.window=null,this.hold=0,this.bits=0,this.length=0,this.offset=0,this.extra=0,this.lencode=null,this.distcode=null,this.lenbits=0,this.distbits=0,this.ncode=0,this.nlen=0,this.ndist=0,this.have=0,this.next=null,this.lens=new c.Buf16(320),this.work=new c.Buf16(288),this.lendyn=null,this.distdyn=null,this.sane=0,this.back=0,this.was=0}function N(B){var W;return B&&B.state?(W=B.state,B.total_in=B.total_out=W.total=0,B.msg="",W.wrap&&(B.adler=1&W.wrap),W.mode=z,W.last=0,W.havedict=0,W.dmax=32768,W.head=null,W.hold=0,W.bits=0,W.lencode=W.lendyn=new c.Buf32(g),W.distcode=W.distdyn=new c.Buf32(w),W.sane=1,W.back=-1,E):x}function R(B){var W;return B&&B.state?((W=B.state).wsize=0,W.whave=0,W.wnext=0,N(B)):x}function U(B,W){var C,ae;return B&&B.state?(ae=B.state,W<0?(C=0,W=-W):(C=1+(W>>4),W<48&&(W&=15)),W&&(W<8||15<W)?x:(ae.window!==null&&ae.wbits!==W&&(ae.window=null),ae.wrap=C,ae.wbits=W,R(B))):x}function Y(B,W){var C,ae;return B?(ae=new A,(B.state=ae).window=null,(C=U(B,W))!==E&&(B.state=null),C):x}var H,I,K=!0;function se(B){if(K){var W;for(H=new c.Buf32(512),I=new c.Buf32(32),W=0;W<144;)B.lens[W++]=8;for(;W<256;)B.lens[W++]=9;for(;W<280;)B.lens[W++]=7;for(;W<288;)B.lens[W++]=8;for(m(v,B.lens,0,288,H,0,B.work,{bits:9}),W=0;W<32;)B.lens[W++]=5;m(b,B.lens,0,32,I,0,B.work,{bits:5}),K=!1}B.lencode=H,B.lenbits=9,B.distcode=I,B.distbits=5}function ge(B,W,C,ae){var V,q=B.state;return q.window===null&&(q.wsize=1<<q.wbits,q.wnext=0,q.whave=0,q.window=new c.Buf8(q.wsize)),ae>=q.wsize?(c.arraySet(q.window,W,C-q.wsize,q.wsize,0),q.wnext=0,q.whave=q.wsize):(ae<(V=q.wsize-q.wnext)&&(V=ae),c.arraySet(q.window,W,C-ae,V,q.wnext),(ae-=V)?(c.arraySet(q.window,W,C-ae,ae,0),q.wnext=ae,q.whave=q.wsize):(q.wnext+=V,q.wnext===q.wsize&&(q.wnext=0),q.whave<q.wsize&&(q.whave+=V))),0}s.inflateReset=R,s.inflateReset2=U,s.inflateResetKeep=N,s.inflateInit=function(B){return Y(B,15)},s.inflateInit2=Y,s.inflate=function(B,W){var C,ae,V,q,Q,ne,ve,O,D,re,ee,le,Ee,he,Se,ke,Me,Re,Le,st,S,ue,ie,L,M=0,X=new c.Buf8(4),pe=[16,17,18,0,8,7,9,6,10,5,11,4,12,3,13,2,14,1,15];if(!B||!B.state||!B.output||!B.input&&B.avail_in!==0)return x;(C=B.state).mode===12&&(C.mode=13),Q=B.next_out,V=B.output,ve=B.avail_out,q=B.next_in,ae=B.input,ne=B.avail_in,O=C.hold,D=C.bits,re=ne,ee=ve,ue=E;e:for(;;)switch(C.mode){case z:if(C.wrap===0){C.mode=13;break}for(;D<16;){if(ne===0)break e;ne--,O+=ae[q++]<<D,D+=8}if(2&C.wrap&&O===35615){X[C.check=0]=255&O,X[1]=O>>>8&255,C.check=h(C.check,X,2,0),D=O=0,C.mode=2;break}if(C.flags=0,C.head&&(C.head.done=!1),!(1&C.wrap)||(((255&O)<<8)+(O>>8))%31){B.msg="incorrect header check",C.mode=30;break}if((15&O)!=8){B.msg="unknown compression method",C.mode=30;break}if(D-=4,S=8+(15&(O>>>=4)),C.wbits===0)C.wbits=S;else if(S>C.wbits){B.msg="invalid window size",C.mode=30;break}C.dmax=1<<S,B.adler=C.check=1,C.mode=512&O?10:12,D=O=0;break;case 2:for(;D<16;){if(ne===0)break e;ne--,O+=ae[q++]<<D,D+=8}if(C.flags=O,(255&C.flags)!=8){B.msg="unknown compression method",C.mode=30;break}if(57344&C.flags){B.msg="unknown header flags set",C.mode=30;break}C.head&&(C.head.text=O>>8&1),512&C.flags&&(X[0]=255&O,X[1]=O>>>8&255,C.check=h(C.check,X,2,0)),D=O=0,C.mode=3;case 3:for(;D<32;){if(ne===0)break e;ne--,O+=ae[q++]<<D,D+=8}C.head&&(C.head.time=O),512&C.flags&&(X[0]=255&O,X[1]=O>>>8&255,X[2]=O>>>16&255,X[3]=O>>>24&255,C.check=h(C.check,X,4,0)),D=O=0,C.mode=4;case 4:for(;D<16;){if(ne===0)break e;ne--,O+=ae[q++]<<D,D+=8}C.head&&(C.head.xflags=255&O,C.head.os=O>>8),512&C.flags&&(X[0]=255&O,X[1]=O>>>8&255,C.check=h(C.check,X,2,0)),D=O=0,C.mode=5;case 5:if(1024&C.flags){for(;D<16;){if(ne===0)break e;ne--,O+=ae[q++]<<D,D+=8}C.length=O,C.head&&(C.head.extra_len=O),512&C.flags&&(X[0]=255&O,X[1]=O>>>8&255,C.check=h(C.check,X,2,0)),D=O=0}else C.head&&(C.head.extra=null);C.mode=6;case 6:if(1024&C.flags&&(ne<(le=C.length)&&(le=ne),le&&(C.head&&(S=C.head.extra_len-C.length,C.head.extra||(C.head.extra=new Array(C.head.extra_len)),c.arraySet(C.head.extra,ae,q,le,S)),512&C.flags&&(C.check=h(C.check,ae,le,q)),ne-=le,q+=le,C.length-=le),C.length))break e;C.length=0,C.mode=7;case 7:if(2048&C.flags){if(ne===0)break e;for(le=0;S=ae[q+le++],C.head&&S&&C.length<65536&&(C.head.name+=String.fromCharCode(S)),S&&le<ne;);if(512&C.flags&&(C.check=h(C.check,ae,le,q)),ne-=le,q+=le,S)break e}else C.head&&(C.head.name=null);C.length=0,C.mode=8;case 8:if(4096&C.flags){if(ne===0)break e;for(le=0;S=ae[q+le++],C.head&&S&&C.length<65536&&(C.head.comment+=String.fromCharCode(S)),S&&le<ne;);if(512&C.flags&&(C.check=h(C.check,ae,le,q)),ne-=le,q+=le,S)break e}else C.head&&(C.head.comment=null);C.mode=9;case 9:if(512&C.flags){for(;D<16;){if(ne===0)break e;ne--,O+=ae[q++]<<D,D+=8}if(O!==(65535&C.check)){B.msg="header crc mismatch",C.mode=30;break}D=O=0}C.head&&(C.head.hcrc=C.flags>>9&1,C.head.done=!0),B.adler=C.check=0,C.mode=12;break;case 10:for(;D<32;){if(ne===0)break e;ne--,O+=ae[q++]<<D,D+=8}B.adler=C.check=k(O),D=O=0,C.mode=11;case 11:if(C.havedict===0)return B.next_out=Q,B.avail_out=ve,B.next_in=q,B.avail_in=ne,C.hold=O,C.bits=D,2;B.adler=C.check=1,C.mode=12;case 12:if(W===5||W===6)break e;case 13:if(C.last){O>>>=7&D,D-=7&D,C.mode=27;break}for(;D<3;){if(ne===0)break e;ne--,O+=ae[q++]<<D,D+=8}switch(C.last=1&O,D-=1,3&(O>>>=1)){case 0:C.mode=14;break;case 1:if(se(C),C.mode=20,W!==6)break;O>>>=2,D-=2;break e;case 2:C.mode=17;break;case 3:B.msg="invalid block type",C.mode=30}O>>>=2,D-=2;break;case 14:for(O>>>=7&D,D-=7&D;D<32;){if(ne===0)break e;ne--,O+=ae[q++]<<D,D+=8}if((65535&O)!=(O>>>16^65535)){B.msg="invalid stored block lengths",C.mode=30;break}if(C.length=65535&O,D=O=0,C.mode=15,W===6)break e;case 15:C.mode=16;case 16:if(le=C.length){if(ne<le&&(le=ne),ve<le&&(le=ve),le===0)break e;c.arraySet(V,ae,q,le,Q),ne-=le,q+=le,ve-=le,Q+=le,C.length-=le;break}C.mode=12;break;case 17:for(;D<14;){if(ne===0)break e;ne--,O+=ae[q++]<<D,D+=8}if(C.nlen=257+(31&O),O>>>=5,D-=5,C.ndist=1+(31&O),O>>>=5,D-=5,C.ncode=4+(15&O),O>>>=4,D-=4,286<C.nlen||30<C.ndist){B.msg="too many length or distance symbols",C.mode=30;break}C.have=0,C.mode=18;case 18:for(;C.have<C.ncode;){for(;D<3;){if(ne===0)break e;ne--,O+=ae[q++]<<D,D+=8}C.lens[pe[C.have++]]=7&O,O>>>=3,D-=3}for(;C.have<19;)C.lens[pe[C.have++]]=0;if(C.lencode=C.lendyn,C.lenbits=7,ie={bits:C.lenbits},ue=m(0,C.lens,0,19,C.lencode,0,C.work,ie),C.lenbits=ie.bits,ue){B.msg="invalid code lengths set",C.mode=30;break}C.have=0,C.mode=19;case 19:for(;C.have<C.nlen+C.ndist;){for(;ke=(M=C.lencode[O&(1<<C.lenbits)-1])>>>16&255,Me=65535&M,!((Se=M>>>24)<=D);){if(ne===0)break e;ne--,O+=ae[q++]<<D,D+=8}if(Me<16)O>>>=Se,D-=Se,C.lens[C.have++]=Me;else{if(Me===16){for(L=Se+2;D<L;){if(ne===0)break e;ne--,O+=ae[q++]<<D,D+=8}if(O>>>=Se,D-=Se,C.have===0){B.msg="invalid bit length repeat",C.mode=30;break}S=C.lens[C.have-1],le=3+(3&O),O>>>=2,D-=2}else if(Me===17){for(L=Se+3;D<L;){if(ne===0)break e;ne--,O+=ae[q++]<<D,D+=8}D-=Se,S=0,le=3+(7&(O>>>=Se)),O>>>=3,D-=3}else{for(L=Se+7;D<L;){if(ne===0)break e;ne--,O+=ae[q++]<<D,D+=8}D-=Se,S=0,le=11+(127&(O>>>=Se)),O>>>=7,D-=7}if(C.have+le>C.nlen+C.ndist){B.msg="invalid bit length repeat",C.mode=30;break}for(;le--;)C.lens[C.have++]=S}}if(C.mode===30)break;if(C.lens[256]===0){B.msg="invalid code -- missing end-of-block",C.mode=30;break}if(C.lenbits=9,ie={bits:C.lenbits},ue=m(v,C.lens,0,C.nlen,C.lencode,0,C.work,ie),C.lenbits=ie.bits,ue){B.msg="invalid literal/lengths set",C.mode=30;break}if(C.distbits=6,C.distcode=C.distdyn,ie={bits:C.distbits},ue=m(b,C.lens,C.nlen,C.ndist,C.distcode,0,C.work,ie),C.distbits=ie.bits,ue){B.msg="invalid distances set",C.mode=30;break}if(C.mode=20,W===6)break e;case 20:C.mode=21;case 21:if(6<=ne&&258<=ve){B.next_out=Q,B.avail_out=ve,B.next_in=q,B.avail_in=ne,C.hold=O,C.bits=D,p(B,ee),Q=B.next_out,V=B.output,ve=B.avail_out,q=B.next_in,ae=B.input,ne=B.avail_in,O=C.hold,D=C.bits,C.mode===12&&(C.back=-1);break}for(C.back=0;ke=(M=C.lencode[O&(1<<C.lenbits)-1])>>>16&255,Me=65535&M,!((Se=M>>>24)<=D);){if(ne===0)break e;ne--,O+=ae[q++]<<D,D+=8}if(ke&&(240&ke)==0){for(Re=Se,Le=ke,st=Me;ke=(M=C.lencode[st+((O&(1<<Re+Le)-1)>>Re)])>>>16&255,Me=65535&M,!(Re+(Se=M>>>24)<=D);){if(ne===0)break e;ne--,O+=ae[q++]<<D,D+=8}O>>>=Re,D-=Re,C.back+=Re}if(O>>>=Se,D-=Se,C.back+=Se,C.length=Me,ke===0){C.mode=26;break}if(32&ke){C.back=-1,C.mode=12;break}if(64&ke){B.msg="invalid literal/length code",C.mode=30;break}C.extra=15&ke,C.mode=22;case 22:if(C.extra){for(L=C.extra;D<L;){if(ne===0)break e;ne--,O+=ae[q++]<<D,D+=8}C.length+=O&(1<<C.extra)-1,O>>>=C.extra,D-=C.extra,C.back+=C.extra}C.was=C.length,C.mode=23;case 23:for(;ke=(M=C.distcode[O&(1<<C.distbits)-1])>>>16&255,Me=65535&M,!((Se=M>>>24)<=D);){if(ne===0)break e;ne--,O+=ae[q++]<<D,D+=8}if((240&ke)==0){for(Re=Se,Le=ke,st=Me;ke=(M=C.distcode[st+((O&(1<<Re+Le)-1)>>Re)])>>>16&255,Me=65535&M,!(Re+(Se=M>>>24)<=D);){if(ne===0)break e;ne--,O+=ae[q++]<<D,D+=8}O>>>=Re,D-=Re,C.back+=Re}if(O>>>=Se,D-=Se,C.back+=Se,64&ke){B.msg="invalid distance code",C.mode=30;break}C.offset=Me,C.extra=15&ke,C.mode=24;case 24:if(C.extra){for(L=C.extra;D<L;){if(ne===0)break e;ne--,O+=ae[q++]<<D,D+=8}C.offset+=O&(1<<C.extra)-1,O>>>=C.extra,D-=C.extra,C.back+=C.extra}if(C.offset>C.dmax){B.msg="invalid distance too far back",C.mode=30;break}C.mode=25;case 25:if(ve===0)break e;if(le=ee-ve,C.offset>le){if((le=C.offset-le)>C.whave&&C.sane){B.msg="invalid distance too far back",C.mode=30;break}Ee=le>C.wnext?(le-=C.wnext,C.wsize-le):C.wnext-le,le>C.length&&(le=C.length),he=C.window}else he=V,Ee=Q-C.offset,le=C.length;for(ve<le&&(le=ve),ve-=le,C.length-=le;V[Q++]=he[Ee++],--le;);C.length===0&&(C.mode=21);break;case 26:if(ve===0)break e;V[Q++]=C.length,ve--,C.mode=21;break;case 27:if(C.wrap){for(;D<32;){if(ne===0)break e;ne--,O|=ae[q++]<<D,D+=8}if(ee-=ve,B.total_out+=ee,C.total+=ee,ee&&(B.adler=C.check=C.flags?h(C.check,V,ee,Q-ee):f(C.check,V,ee,Q-ee)),ee=ve,(C.flags?O:k(O))!==C.check){B.msg="incorrect data check",C.mode=30;break}D=O=0}C.mode=28;case 28:if(C.wrap&&C.flags){for(;D<32;){if(ne===0)break e;ne--,O+=ae[q++]<<D,D+=8}if(O!==(4294967295&C.total)){B.msg="incorrect length check",C.mode=30;break}D=O=0}C.mode=29;case 29:ue=1;break e;case 30:ue=-3;break e;case 31:return-4;case 32:default:return x}return B.next_out=Q,B.avail_out=ve,B.next_in=q,B.avail_in=ne,C.hold=O,C.bits=D,(C.wsize||ee!==B.avail_out&&C.mode<30&&(C.mode<27||W!==4))&&ge(B,B.output,B.next_out,ee-B.avail_out)?(C.mode=31,-4):(re-=B.avail_in,ee-=B.avail_out,B.total_in+=re,B.total_out+=ee,C.total+=ee,C.wrap&&ee&&(B.adler=C.check=C.flags?h(C.check,V,ee,B.next_out-ee):f(C.check,V,ee,B.next_out-ee)),B.data_type=C.bits+(C.last?64:0)+(C.mode===12?128:0)+(C.mode===20||C.mode===15?256:0),(re==0&&ee===0||W===4)&&ue===E&&(ue=-5),ue)},s.inflateEnd=function(B){if(!B||!B.state)return x;var W=B.state;return W.window&&(W.window=null),B.state=null,E},s.inflateGetHeader=function(B,W){var C;return B&&B.state?(2&(C=B.state).wrap)==0?x:((C.head=W).done=!1,E):x},s.inflateSetDictionary=function(B,W){var C,ae=W.length;return B&&B.state?(C=B.state).wrap!==0&&C.mode!==11?x:C.mode===11&&f(1,W,ae,0)!==C.check?-3:ge(B,W,ae,ae)?(C.mode=31,-4):(C.havedict=1,E):x},s.inflateInfo="pako inflate (from Nodeca project)"},{"../utils/common":41,"./adler32":43,"./crc32":45,"./inffast":48,"./inftrees":50}],50:[function(o,l,s){var c=o("../utils/common"),f=[3,4,5,6,7,8,9,10,11,13,15,17,19,23,27,31,35,43,51,59,67,83,99,115,131,163,195,227,258,0,0],h=[16,16,16,16,16,16,16,16,17,17,17,17,18,18,18,18,19,19,19,19,20,20,20,20,21,21,21,21,16,72,78],p=[1,2,3,4,5,7,9,13,17,25,33,49,65,97,129,193,257,385,513,769,1025,1537,2049,3073,4097,6145,8193,12289,16385,24577,0,0],m=[16,16,16,16,17,17,18,18,19,19,20,20,21,21,22,22,23,23,24,24,25,25,26,26,27,27,28,28,29,29,64,64];l.exports=function(v,b,E,x,z,g,w,k){var A,N,R,U,Y,H,I,K,se,ge=k.bits,B=0,W=0,C=0,ae=0,V=0,q=0,Q=0,ne=0,ve=0,O=0,D=null,re=0,ee=new c.Buf16(16),le=new c.Buf16(16),Ee=null,he=0;for(B=0;B<=15;B++)ee[B]=0;for(W=0;W<x;W++)ee[b[E+W]]++;for(V=ge,ae=15;1<=ae&&ee[ae]===0;ae--);if(ae<V&&(V=ae),ae===0)return z[g++]=20971520,z[g++]=20971520,k.bits=1,0;for(C=1;C<ae&&ee[C]===0;C++);for(V<C&&(V=C),B=ne=1;B<=15;B++)if(ne<<=1,(ne-=ee[B])<0)return-1;if(0<ne&&(v===0||ae!==1))return-1;for(le[1]=0,B=1;B<15;B++)le[B+1]=le[B]+ee[B];for(W=0;W<x;W++)b[E+W]!==0&&(w[le[b[E+W]]++]=W);if(H=v===0?(D=Ee=w,19):v===1?(D=f,re-=257,Ee=h,he-=257,256):(D=p,Ee=m,-1),B=C,Y=g,Q=W=O=0,R=-1,U=(ve=1<<(q=V))-1,v===1&&852<ve||v===2&&592<ve)return 1;for(;;){for(I=B-Q,se=w[W]<H?(K=0,w[W]):w[W]>H?(K=Ee[he+w[W]],D[re+w[W]]):(K=96,0),A=1<<B-Q,C=N=1<<q;z[Y+(O>>Q)+(N-=A)]=I<<24|K<<16|se|0,N!==0;);for(A=1<<B-1;O&A;)A>>=1;if(A!==0?(O&=A-1,O+=A):O=0,W++,--ee[B]==0){if(B===ae)break;B=b[E+w[W]]}if(V<B&&(O&U)!==R){for(Q===0&&(Q=V),Y+=C,ne=1<<(q=B-Q);q+Q<ae&&!((ne-=ee[q+Q])<=0);)q++,ne<<=1;if(ve+=1<<q,v===1&&852<ve||v===2&&592<ve)return 1;z[R=O&U]=V<<24|q<<16|Y-g|0}}return O!==0&&(z[Y+O]=B-Q<<24|64<<16|0),k.bits=V,0}},{"../utils/common":41}],51:[function(o,l,s){l.exports={2:"need dictionary",1:"stream end",0:"","-1":"file error","-2":"stream error","-3":"data error","-4":"insufficient memory","-5":"buffer error","-6":"incompatible version"}},{}],52:[function(o,l,s){var c=o("../utils/common"),f=0,h=1;function p(M){for(var X=M.length;0<=--X;)M[X]=0}var m=0,v=29,b=256,E=b+1+v,x=30,z=19,g=2*E+1,w=15,k=16,A=7,N=256,R=16,U=17,Y=18,H=[0,0,0,0,0,0,0,0,1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,0],I=[0,0,0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12,13,13],K=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,3,7],se=[16,17,18,0,8,7,9,6,10,5,11,4,12,3,13,2,14,1,15],ge=new Array(2*(E+2));p(ge);var B=new Array(2*x);p(B);var W=new Array(512);p(W);var C=new Array(256);p(C);var ae=new Array(v);p(ae);var V,q,Q,ne=new Array(x);function ve(M,X,pe,me,$){this.static_tree=M,this.extra_bits=X,this.extra_base=pe,this.elems=me,this.max_length=$,this.has_stree=M&&M.length}function O(M,X){this.dyn_tree=M,this.max_code=0,this.stat_desc=X}function D(M){return M<256?W[M]:W[256+(M>>>7)]}function re(M,X){M.pending_buf[M.pending++]=255&X,M.pending_buf[M.pending++]=X>>>8&255}function ee(M,X,pe){M.bi_valid>k-pe?(M.bi_buf|=X<<M.bi_valid&65535,re(M,M.bi_buf),M.bi_buf=X>>k-M.bi_valid,M.bi_valid+=pe-k):(M.bi_buf|=X<<M.bi_valid&65535,M.bi_valid+=pe)}function le(M,X,pe){ee(M,pe[2*X],pe[2*X+1])}function Ee(M,X){for(var pe=0;pe|=1&M,M>>>=1,pe<<=1,0<--X;);return pe>>>1}function he(M,X,pe){var me,$,be=new Array(w+1),_e=0;for(me=1;me<=w;me++)be[me]=_e=_e+pe[me-1]<<1;for($=0;$<=X;$++){var xe=M[2*$+1];xe!==0&&(M[2*$]=Ee(be[xe]++,xe))}}function Se(M){var X;for(X=0;X<E;X++)M.dyn_ltree[2*X]=0;for(X=0;X<x;X++)M.dyn_dtree[2*X]=0;for(X=0;X<z;X++)M.bl_tree[2*X]=0;M.dyn_ltree[2*N]=1,M.opt_len=M.static_len=0,M.last_lit=M.matches=0}function ke(M){8<M.bi_valid?re(M,M.bi_buf):0<M.bi_valid&&(M.pending_buf[M.pending++]=M.bi_buf),M.bi_buf=0,M.bi_valid=0}function Me(M,X,pe,me){var $=2*X,be=2*pe;return M[$]<M[be]||M[$]===M[be]&&me[X]<=me[pe]}function Re(M,X,pe){for(var me=M.heap[pe],$=pe<<1;$<=M.heap_len&&($<M.heap_len&&Me(X,M.heap[$+1],M.heap[$],M.depth)&&$++,!Me(X,me,M.heap[$],M.depth));)M.heap[pe]=M.heap[$],pe=$,$<<=1;M.heap[pe]=me}function Le(M,X,pe){var me,$,be,_e,xe=0;if(M.last_lit!==0)for(;me=M.pending_buf[M.d_buf+2*xe]<<8|M.pending_buf[M.d_buf+2*xe+1],$=M.pending_buf[M.l_buf+xe],xe++,me===0?le(M,$,X):(le(M,(be=C[$])+b+1,X),(_e=H[be])!==0&&ee(M,$-=ae[be],_e),le(M,be=D(--me),pe),(_e=I[be])!==0&&ee(M,me-=ne[be],_e)),xe<M.last_lit;);le(M,N,X)}function st(M,X){var pe,me,$,be=X.dyn_tree,_e=X.stat_desc.static_tree,xe=X.stat_desc.has_stree,De=X.stat_desc.elems,it=-1;for(M.heap_len=0,M.heap_max=g,pe=0;pe<De;pe++)be[2*pe]!==0?(M.heap[++M.heap_len]=it=pe,M.depth[pe]=0):be[2*pe+1]=0;for(;M.heap_len<2;)be[2*($=M.heap[++M.heap_len]=it<2?++it:0)]=1,M.depth[$]=0,M.opt_len--,xe&&(M.static_len-=_e[2*$+1]);for(X.max_code=it,pe=M.heap_len>>1;1<=pe;pe--)Re(M,be,pe);for($=De;pe=M.heap[1],M.heap[1]=M.heap[M.heap_len--],Re(M,be,1),me=M.heap[1],M.heap[--M.heap_max]=pe,M.heap[--M.heap_max]=me,be[2*$]=be[2*pe]+be[2*me],M.depth[$]=(M.depth[pe]>=M.depth[me]?M.depth[pe]:M.depth[me])+1,be[2*pe+1]=be[2*me+1]=$,M.heap[1]=$++,Re(M,be,1),2<=M.heap_len;);M.heap[--M.heap_max]=M.heap[1],(function(Ye,It){var mn,ua,$n,ft,Rt,da,bt=It.dyn_tree,Ro=It.max_code,Ds=It.stat_desc.static_tree,Bs=It.stat_desc.has_stree,Er=It.stat_desc.extra_bits,er=It.stat_desc.extra_base,Ma=It.stat_desc.max_length,fa=0;for(ft=0;ft<=w;ft++)Ye.bl_count[ft]=0;for(bt[2*Ye.heap[Ye.heap_max]+1]=0,mn=Ye.heap_max+1;mn<g;mn++)Ma<(ft=bt[2*bt[2*(ua=Ye.heap[mn])+1]+1]+1)&&(ft=Ma,fa++),bt[2*ua+1]=ft,Ro<ua||(Ye.bl_count[ft]++,Rt=0,er<=ua&&(Rt=Er[ua-er]),da=bt[2*ua],Ye.opt_len+=da*(ft+Rt),Bs&&(Ye.static_len+=da*(Ds[2*ua+1]+Rt)));if(fa!==0){do{for(ft=Ma-1;Ye.bl_count[ft]===0;)ft--;Ye.bl_count[ft]--,Ye.bl_count[ft+1]+=2,Ye.bl_count[Ma]--,fa-=2}while(0<fa);for(ft=Ma;ft!==0;ft--)for(ua=Ye.bl_count[ft];ua!==0;)Ro<($n=Ye.heap[--mn])||(bt[2*$n+1]!==ft&&(Ye.opt_len+=(ft-bt[2*$n+1])*bt[2*$n],bt[2*$n+1]=ft),ua--)}})(M,X),he(be,it,M.bl_count)}function S(M,X,pe){var me,$,be=-1,_e=X[1],xe=0,De=7,it=4;for(_e===0&&(De=138,it=3),X[2*(pe+1)+1]=65535,me=0;me<=pe;me++)$=_e,_e=X[2*(me+1)+1],++xe<De&&$===_e||(xe<it?M.bl_tree[2*$]+=xe:$!==0?($!==be&&M.bl_tree[2*$]++,M.bl_tree[2*R]++):xe<=10?M.bl_tree[2*U]++:M.bl_tree[2*Y]++,be=$,it=(xe=0)===_e?(De=138,3):$===_e?(De=6,3):(De=7,4))}function ue(M,X,pe){var me,$,be=-1,_e=X[1],xe=0,De=7,it=4;for(_e===0&&(De=138,it=3),me=0;me<=pe;me++)if($=_e,_e=X[2*(me+1)+1],!(++xe<De&&$===_e)){if(xe<it)for(;le(M,$,M.bl_tree),--xe!=0;);else $!==0?($!==be&&(le(M,$,M.bl_tree),xe--),le(M,R,M.bl_tree),ee(M,xe-3,2)):xe<=10?(le(M,U,M.bl_tree),ee(M,xe-3,3)):(le(M,Y,M.bl_tree),ee(M,xe-11,7));be=$,it=(xe=0)===_e?(De=138,3):$===_e?(De=6,3):(De=7,4)}}p(ne);var ie=!1;function L(M,X,pe,me){ee(M,(m<<1)+(me?1:0),3),(function($,be,_e,xe){ke($),re($,_e),re($,~_e),c.arraySet($.pending_buf,$.window,be,_e,$.pending),$.pending+=_e})(M,X,pe)}s._tr_init=function(M){ie||((function(){var X,pe,me,$,be,_e=new Array(w+1);for($=me=0;$<v-1;$++)for(ae[$]=me,X=0;X<1<<H[$];X++)C[me++]=$;for(C[me-1]=$,$=be=0;$<16;$++)for(ne[$]=be,X=0;X<1<<I[$];X++)W[be++]=$;for(be>>=7;$<x;$++)for(ne[$]=be<<7,X=0;X<1<<I[$]-7;X++)W[256+be++]=$;for(pe=0;pe<=w;pe++)_e[pe]=0;for(X=0;X<=143;)ge[2*X+1]=8,X++,_e[8]++;for(;X<=255;)ge[2*X+1]=9,X++,_e[9]++;for(;X<=279;)ge[2*X+1]=7,X++,_e[7]++;for(;X<=287;)ge[2*X+1]=8,X++,_e[8]++;for(he(ge,E+1,_e),X=0;X<x;X++)B[2*X+1]=5,B[2*X]=Ee(X,5);V=new ve(ge,H,b+1,E,w),q=new ve(B,I,0,x,w),Q=new ve(new Array(0),K,0,z,A)})(),ie=!0),M.l_desc=new O(M.dyn_ltree,V),M.d_desc=new O(M.dyn_dtree,q),M.bl_desc=new O(M.bl_tree,Q),M.bi_buf=0,M.bi_valid=0,Se(M)},s._tr_stored_block=L,s._tr_flush_block=function(M,X,pe,me){var $,be,_e=0;0<M.level?(M.strm.data_type===2&&(M.strm.data_type=(function(xe){var De,it=4093624447;for(De=0;De<=31;De++,it>>>=1)if(1&it&&xe.dyn_ltree[2*De]!==0)return f;if(xe.dyn_ltree[18]!==0||xe.dyn_ltree[20]!==0||xe.dyn_ltree[26]!==0)return h;for(De=32;De<b;De++)if(xe.dyn_ltree[2*De]!==0)return h;return f})(M)),st(M,M.l_desc),st(M,M.d_desc),_e=(function(xe){var De;for(S(xe,xe.dyn_ltree,xe.l_desc.max_code),S(xe,xe.dyn_dtree,xe.d_desc.max_code),st(xe,xe.bl_desc),De=z-1;3<=De&&xe.bl_tree[2*se[De]+1]===0;De--);return xe.opt_len+=3*(De+1)+5+5+4,De})(M),$=M.opt_len+3+7>>>3,(be=M.static_len+3+7>>>3)<=$&&($=be)):$=be=pe+5,pe+4<=$&&X!==-1?L(M,X,pe,me):M.strategy===4||be===$?(ee(M,2+(me?1:0),3),Le(M,ge,B)):(ee(M,4+(me?1:0),3),(function(xe,De,it,Ye){var It;for(ee(xe,De-257,5),ee(xe,it-1,5),ee(xe,Ye-4,4),It=0;It<Ye;It++)ee(xe,xe.bl_tree[2*se[It]+1],3);ue(xe,xe.dyn_ltree,De-1),ue(xe,xe.dyn_dtree,it-1)})(M,M.l_desc.max_code+1,M.d_desc.max_code+1,_e+1),Le(M,M.dyn_ltree,M.dyn_dtree)),Se(M),me&&ke(M)},s._tr_tally=function(M,X,pe){return M.pending_buf[M.d_buf+2*M.last_lit]=X>>>8&255,M.pending_buf[M.d_buf+2*M.last_lit+1]=255&X,M.pending_buf[M.l_buf+M.last_lit]=255&pe,M.last_lit++,X===0?M.dyn_ltree[2*pe]++:(M.matches++,X--,M.dyn_ltree[2*(C[pe]+b+1)]++,M.dyn_dtree[2*D(X)]++),M.last_lit===M.lit_bufsize-1},s._tr_align=function(M){ee(M,2,3),le(M,N,ge),(function(X){X.bi_valid===16?(re(X,X.bi_buf),X.bi_buf=0,X.bi_valid=0):8<=X.bi_valid&&(X.pending_buf[X.pending++]=255&X.bi_buf,X.bi_buf>>=8,X.bi_valid-=8)})(M)}},{"../utils/common":41}],53:[function(o,l,s){l.exports=function(){this.input=null,this.next_in=0,this.avail_in=0,this.total_in=0,this.output=null,this.next_out=0,this.avail_out=0,this.total_out=0,this.msg="",this.state=null,this.data_type=2,this.adler=0}},{}],54:[function(o,l,s){(function(c){(function(f,h){if(!f.setImmediate){var p,m,v,b,E=1,x={},z=!1,g=f.document,w=Object.getPrototypeOf&&Object.getPrototypeOf(f);w=w&&w.setTimeout?w:f,p={}.toString.call(f.process)==="[object process]"?function(R){process.nextTick(function(){A(R)})}:(function(){if(f.postMessage&&!f.importScripts){var R=!0,U=f.onmessage;return f.onmessage=function(){R=!1},f.postMessage("","*"),f.onmessage=U,R}})()?(b="setImmediate$"+Math.random()+"$",f.addEventListener?f.addEventListener("message",N,!1):f.attachEvent("onmessage",N),function(R){f.postMessage(b+R,"*")}):f.MessageChannel?((v=new MessageChannel).port1.onmessage=function(R){A(R.data)},function(R){v.port2.postMessage(R)}):g&&"onreadystatechange"in g.createElement("script")?(m=g.documentElement,function(R){var U=g.createElement("script");U.onreadystatechange=function(){A(R),U.onreadystatechange=null,m.removeChild(U),U=null},m.appendChild(U)}):function(R){setTimeout(A,0,R)},w.setImmediate=function(R){typeof R!="function"&&(R=new Function(""+R));for(var U=new Array(arguments.length-1),Y=0;Y<U.length;Y++)U[Y]=arguments[Y+1];var H={callback:R,args:U};return x[E]=H,p(E),E++},w.clearImmediate=k}function k(R){delete x[R]}function A(R){if(z)setTimeout(A,0,R);else{var U=x[R];if(U){z=!0;try{(function(Y){var H=Y.callback,I=Y.args;switch(I.length){case 0:H();break;case 1:H(I[0]);break;case 2:H(I[0],I[1]);break;case 3:H(I[0],I[1],I[2]);break;default:H.apply(h,I)}})(U)}finally{k(R),z=!1}}}}function N(R){R.source===f&&typeof R.data=="string"&&R.data.indexOf(b)===0&&A(+R.data.slice(b.length))}})(typeof self>"u"?c===void 0?this:c:self)}).call(this,typeof Gn<"u"?Gn:typeof self<"u"?self:typeof window<"u"?window:{})},{}]},{},[10])(10)})})(pd)),pd.exports}var O3=N3();const j3=ws(O3);var is={exports:{}},R3=is.exports,Sv;function M3(){return Sv||(Sv=1,(function(n,r){(function(o,l){l()})(R3,function(){function o(m,v){return typeof v>"u"?v={autoBom:!1}:typeof v!="object"&&(console.warn("Deprecated: Expected third argument to be a object"),v={autoBom:!v}),v.autoBom&&/^\s*(?:text\/\S*|application\/xml|\S*\/\S*\+xml)\s*;.*charset\s*=\s*utf-8/i.test(m.type)?new Blob(["\uFEFF",m],{type:m.type}):m}function l(m,v,b){var E=new XMLHttpRequest;E.open("GET",m),E.responseType="blob",E.onload=function(){p(E.response,v,b)},E.onerror=function(){console.error("could not download file")},E.send()}function s(m){var v=new XMLHttpRequest;v.open("HEAD",m,!1);try{v.send()}catch{}return 200<=v.status&&299>=v.status}function c(m){try{m.dispatchEvent(new MouseEvent("click"))}catch{var v=document.createEvent("MouseEvents");v.initMouseEvent("click",!0,!0,window,0,0,0,80,20,!1,!1,!1,!1,0,null),m.dispatchEvent(v)}}var f=typeof window=="object"&&window.window===window?window:typeof self=="object"&&self.self===self?self:typeof Gn=="object"&&Gn.global===Gn?Gn:void 0,h=f.navigator&&/Macintosh/.test(navigator.userAgent)&&/AppleWebKit/.test(navigator.userAgent)&&!/Safari/.test(navigator.userAgent),p=f.saveAs||(typeof window!="object"||window!==f?function(){}:"download"in HTMLAnchorElement.prototype&&!h?function(m,v,b){var E=f.URL||f.webkitURL,x=document.createElement("a");v=v||m.name||"download",x.download=v,x.rel="noopener",typeof m=="string"?(x.href=m,x.origin===location.origin?c(x):s(x.href)?l(m,v,b):c(x,x.target="_blank")):(x.href=E.createObjectURL(m),setTimeout(function(){E.revokeObjectURL(x.href)},4e4),setTimeout(function(){c(x)},0))}:"msSaveOrOpenBlob"in navigator?function(m,v,b){if(v=v||m.name||"download",typeof m!="string")navigator.msSaveOrOpenBlob(o(m,b),v);else if(s(m))l(m,v,b);else{var E=document.createElement("a");E.href=m,E.target="_blank",setTimeout(function(){c(E)})}}:function(m,v,b,E){if(E=E||open("","_blank"),E&&(E.document.title=E.document.body.innerText="downloading..."),typeof m=="string")return l(m,v,b);var x=m.type==="application/octet-stream",z=/constructor/i.test(f.HTMLElement)||f.safari,g=/CriOS\/[\d]+/.test(navigator.userAgent);if((g||x&&z||h)&&typeof FileReader<"u"){var w=new FileReader;w.onloadend=function(){var N=w.result;N=g?N:N.replace(/^data:[^;]*;/,"data:attachment/file;"),E?E.location.href=N:location=N,E=null},w.readAsDataURL(m)}else{var k=f.URL||f.webkitURL,A=k.createObjectURL(m);E?E.location=A:location.href=A,E=null,setTimeout(function(){k.revokeObjectURL(A)},4e4)}});f.saveAs=p.saveAs=p,n.exports=p})})(is)),is.exports}var Lb=M3();const D3=async(n,r)=>{const o=new j3,l=o.folder("config");l==null||l.file("site.json",JSON.stringify(n.site,null,2)),l==null||l.file("theme.json",JSON.stringify(n.theme,null,2)),l==null||l.file("menu.json",JSON.stringify(n.menu,null,2));const s=o.folder("pages");s==null||s.file(`${r}.json`,JSON.stringify(n.page,null,2));const c=await o.generateAsync({type:"blob"});Lb.saveAs(c,`jsonpages-project-${r}-${Date.now()}.zip`)},B3=(n,r,o)=>{const s=`<script id="jp-baked-state" type="application/json">${JSON.stringify(n)}<\/script>`,c=o.replace("</head>",`${s}</head>`),f=new Blob([`<!DOCTYPE html>${c}`],{type:"text/html;charset=utf-8"});Lb.saveAs(f,`${r}.html`)},U3={title:"JsonPages",logoUrl:"/logo.svg"},L3=[{slug:"home",label:"Home"},{slug:"architecture",label:"Architecture"},{slug:"usage",label:"Usage"}],H3={id:"global-header",type:"header",data:{logoText:"Json",logoHighlight:"Pages",logoIconText:"{ }",links:[{label:"Architecture",href:"#architecture",isCta:!1},{label:"Products",href:"#products",isCta:!1},{label:"PA Ready",href:"#pa-ready",isCta:!1},{label:"Philosophy",href:"#philosophy",isCta:!1}]},settings:{sticky:!0}},Z3={id:"global-footer",type:"footer",data:{brandText:"Json",brandHighlight:"Pages",copyright:"© 2026 JsonPages Ecosystem. Architected by Guido Filippo Serio.",links:[{label:"Documentation",href:"#"},{label:"API Reference",href:"#"},{label:"Changelog",href:"#"},{label:"Privacy",href:"#"}]},settings:{showLogo:!0}},V3={identity:U3,pages:L3,header:H3,footer:Z3},q3=[{label:"Architecture",href:"#architecture"},{label:"Products",href:"#products"},{label:"PA Ready",href:"#pa-ready"},{label:"Philosophy",href:"#philosophy"}],G3={main:q3},Y3="home-page",I3="home",X3={title:"JsonPages — Global Authoring. Global Governance.",description:"A high-fidelity Site Factory that solves the scalability bottleneck of traditional CMS systems."},Q3=[{id:"hero-main",type:"hero",data:{badge:"Composable UI Engine · SaaS v1.4",title:"Global Authoring.",titleHighlight:"Global Governance.",description:"JsonPages is a high-fidelity Site Factory that solves the scalability bottleneck of traditional CMS systems. Distribute, govern, and render UI components across hundreds of independent sites — without technical drift.",ctas:[{label:"Explore Products →",href:"#products",variant:"primary"},{label:"Read the Spec",href:"#architecture",variant:"secondary"}],metrics:[{val:"100+",label:"Pages per tenant"},{val:"0ms",label:"Runtime overhead"},{val:"∞",label:"Scalable blocks"}]},settings:{}},{id:"problem-statement",type:"problem-statement",data:{siloGroups:[{blocks:[{label:"Agency A Stack",variant:"red"},{label:"Custom CMS",variant:"red"},{label:"PHP Backend",variant:"red"}],label:"Silo #1"},{blocks:[{label:"Agency B Tools",variant:"amber"},{label:"WordPress",variant:"amber"},{label:"LAMP Stack",variant:"amber"}],label:"Silo #2"},{blocks:[{label:"Agency C Kit",variant:"green"},{label:"React App",variant:"green"},{label:"Node.js",variant:"green"}],label:"Silo #3"}],title:"Traditional CMS systems create closed silos.",paragraphs:[{text:"When global brands delegate web projects to multiple agencies, each agency picks its own stack, its own conventions, its own deployment pipeline. The result is a portfolio of ungovernable sites with inconsistent quality and unpredictable maintenance costs.",isBold:!1},{text:"JsonPages eliminates this by providing a centralized protocol to distribute, govern, and render UI components — ensuring every site, regardless of who builds it, conforms to a single typed ontology.",isBold:!0}]},settings:{}},{id:"architecture-pillars",type:"pillars-grid",data:{anchorId:"architecture",label:"Core Architecture",title:"Three Pillars of Composability",description:"A contract-first architecture designed to scale without core refactoring.",pillars:[{icon:"⟐",iconVariant:"split",title:"The Machine-Readable Blueprint. 📐",description:'We enforce a strict file-system ontology that physically separates Global Governance from Local Content. By utilizing "Dumb Components" (CIP), we create a deterministic environment where the UI is a predictable function of data. This protocol allows AI agents to understand your site structure instantly, eliminating the "guessing game" of traditional web development.',tag:"The Foundation",tagVariant:"core"},{icon:"⬡",iconVariant:"registry",title:"The Semantic Brain. 🧠",description:"We reject hardcoded Union Types. The Kernel defines an open registry where independent modules inject their DNA via Zod schemas. This provides the AI with a precise, type-safe vocabulary to build brand-compliant interfaces. Because the registry is the Single Source of Truth, the AI knows exactly which components exist and how to configure them without ever touching the core code.",tag:"The Vocabulary",tagVariant:"pattern"},{icon:"◈",iconVariant:"federation",title:"The 5-Minute Tenant. 🤖",description:"AI doesn't guess; it follows the Protocol. Because our ecosystem is governed by 5 deterministic standards, agents like Claude can project a complex, multi-page, brand-compliant tenant in under 5 minutes. The result is 100% Type-Safe JSON that perfectly matches your schemas, delivering a production-ready site with zero technical drift and an instant polymorphic CMS.",tag:"The Multiplier",tagVariant:"enterprise"}]},settings:{}},{id:"layered-architecture",type:"arch-layers",data:{anchorId:"layers",label:"Engineering Layers",title:"Strict Boundaries. Clean Contracts.",description:"Three architectural layers maintain the separation between engine and implementation.",layers:[{number:"0",layerLevel:"l0",title:"The Immutable Kernel",description:"Defines the base structure of a Section — ID, Type, Payload, Settings — and exports the computed union. Zero knowledge of UI implementation or business logic."},{number:"1",layerLevel:"l1",title:"The Standard Library",description:"Fundamental components (Hero, Text, Grid) used across 90% of projects. Augments the Kernel's registry while remaining part of the internal ecosystem."},{number:"2",layerLevel:"l2",title:"User-Land Extensions",description:"The enabling layer. Third-party developers define specialized blocks — StockTickers, CRM Forms — in their own repositories. These extensions plug into the Kernel at compile-time."}],codeFilename:"libs/shared-data/src/lib/core.ts",codeLines:[{content:"// 🛡️ KERNEL — Single Source of Truth",tokenType:"comment"},{content:"",tokenType:"plain"},{content:"export interface SectionDataRegistry {",tokenType:"keyword"},{content:"  // Open Registry: modules inject here",tokenType:"comment"},{content:"}",tokenType:"plain"},{content:"",tokenType:"plain"},{content:"export interface BaseSection<K extends keyof SectionDataRegistry> {",tokenType:"keyword"},{content:"  id: string;",tokenType:"type"},{content:"  type: K;",tokenType:"type"},{content:"  data: SectionDataRegistry[K];",tokenType:"type"},{content:"  settings?: SectionSettings;",tokenType:"type"},{content:"}",tokenType:"plain"},{content:"",tokenType:"plain"},{content:"// Computed Union — built automatically from registry",tokenType:"comment"},{content:"export type Section =",tokenType:"keyword"},{content:"  { [K in keyof SectionDataRegistry]: BaseSection<K> }",tokenType:"type"},{content:"  [keyof SectionDataRegistry];",tokenType:"operator"}]},settings:{}},{id:"product-triad",type:"product-triad",data:{anchorId:"products",label:"Product Triad",title:"One Protocol. Three Products.",description:"From solo developers to global enterprises — the same underlying ontology powers every tier.",products:[{tier:"Starter",name:"JsonPage",price:"NPM",priceSuffix:"Local Install",delivery:"Static Export · Zero Runtime",features:[{text:"Local Authoring SDK"},{text:"Zero-Runtime HTML Bake"},{text:"Pure HTML/CSS Export"},{text:"CDN-Ready Delivery"},{text:"Full Code Ownership"}],featured:!1},{tier:"Professional",name:"JsonPages",price:"SaaS",priceSuffix:"/month",delivery:"Managed Cloud · Multi-Tenant",features:[{text:"Multi-Tenant Hosting"},{text:"Premium Block Library"},{text:"SchemaUI Components"},{text:"In-Context Editing"},{text:"AI-Native Protocol"},{text:"Tailwind v4 & BI Engine"}],featured:!1},{tier:"Enterprise",name:"The Platform",price:"Custom",delivery:"Private Cloud · Enterprise Governance",features:[{text:"Private Federated Registry"},{text:"Module Federation"},{text:"Runtime Component Injection"},{text:"Custom Brand Guidelines"},{text:"Dedicated SLA & Support"},{text:"SSO & RBAC"}],featured:!1}]},settings:{}},{id:"pa-ready",type:"pa-section",data:{anchorId:"pa-ready",label:"Public Sector",title:"PA Ready — One Platform, Two Markets",subtitle:"The Only Builder with Native Bootstrap Italia.",paragraphs:[{text:"By switching the rendering engine to Bootstrap Italia, System Integrators use the same high-efficiency workflow to deliver WCAG-compliant sites for Municipalities and Government bodies — without rewriting backend logic."},{text:"The same JSON ontology drives both the Tailwind-powered private sector and the Bootstrap Italia public sector pipeline. This is not flexibility — this is Business Continuity."}],badges:[{label:"PNRR Ready"},{label:"WCAG 2.1 AA"},{label:"AgID Compliant"}],engines:[{label:"Tailwind v4",variant:"tailwind"},{label:"Bootstrap Italia",variant:"bootstrap"}],codeSnippet:`{
  "type": "hero",
  "data": { "title": "..." },
  "settings": { "engine": "auto" }
}`},settings:{}},{id:"philosophy",type:"philosophy",data:{anchorId:"philosophy",label:"Our Philosophy",title:"Governance Over Captivity",quote:"We sell the infrastructure to manage UI — not the right to access the code.",quoteHighlightWord:"manage",description:"Unlike closed-garden platforms, JsonPages provides an Eject Button by design. The Bake Engine exports your site as pure HTML/CSS with zero backend requirements. If you leave the SaaS, the shared ontology and SDK ensure you remain fully operational and independent. We earn your loyalty through value — not lock-in."},settings:{}},{id:"cta-final",type:"cta-banner",data:{anchorId:"start",label:"Local Authoring Global Governance",title:"Ready to Govern at Scale?",description:"Whether you're building a single site or managing a portfolio of hundreds — JsonPages scales with your ambition."},settings:{}}],F3={id:Y3,slug:I3,meta:X3,sections:Q3},Hb=V3,Bd=Ub,Zb=G3,Vb={home:F3},kv=()=>{const{slug:n="home"}=Dv(),[r,o]=j.useState(null);j.useEffect(()=>{const f=document.getElementById("jp-baked-state");if(f&&f.textContent)try{const h=JSON.parse(f.textContent);o(h),Id.setTheme(h.theme)}catch(h){console.error("Failed to parse baked state",h)}},[]);const l=r?r.page:Vb[n],s=r?r.site:Hb,c=r?r.menu:Zb;return l?_.jsx(rf,{mode:"tenant",children:_.jsx(Yd,{mode:"visitor",children:_.jsx(s0,{pageConfig:l,siteConfig:s,menuConfig:c})})}):_.jsx(c0,{})},Ev=()=>{const{slug:n="home"}=Dv(),[r,o]=j.useState(null),[l,s]=j.useState(!1),[c,f]=j.useState(()=>{const z=JSON.parse(JSON.stringify(Hb));return z.header&&z.header.data&&(z.header.data.links=JSON.parse(JSON.stringify(Zb.main))),z}),[h,p]=j.useState(null);j.useEffect(()=>{const z=Vb[n];z&&o(JSON.parse(JSON.stringify(z))),p(null),s(!1)},[n]);const m=j.useCallback(z=>{if(z.origin===window.location.origin&&(z.data.type===ka.SECTION_SELECT&&p(z.data.section),z.data.type===ka.SEND_CLEAN_HTML)){if(!r)return;const g={page:r,site:c,menu:{main:c.header.data.links||[]},theme:Bd};B3(g,n,z.data.html),s(!1)}},[r,c,n]);j.useEffect(()=>(window.addEventListener("message",m),()=>window.removeEventListener("message",m)),[m]);const v=z=>{if(!(!h||!r))if(s(!0),h.scope==="global")h.type==="header"?f({...c,header:{...c.header,data:z}}):h.type==="footer"&&f({...c,footer:{...c.footer,data:z}});else{const g=r.sections.map(w=>w.id===h.id?{...w,data:z}:w);o({...r,sections:g})}},b=()=>{var g;const z=document.querySelector("iframe");(g=z==null?void 0:z.contentWindow)==null||g.postMessage({type:ka.REQUEST_CLEAN_HTML},"*")},E=()=>{if(!r)return;const z={page:r,site:c,menu:{main:c.header.data.links||[]},theme:Bd};D3(z,n),s(!1)};if(!r)return _.jsx("div",{children:"Loading Studio..."});const x=(h==null?void 0:h.scope)==="global"?{sections:[c.header,c.footer]}:r;return _.jsx(rf,{mode:"admin",children:_.jsx(Yd,{mode:"studio",children:_.jsxs("div",{className:"flex flex-col h-screen w-screen bg-background text-foreground overflow-hidden",children:[_.jsx(S3,{hasChanges:l,onExportJSON:E,onExportHTML:b}),_.jsxs("div",{className:"flex flex-1 overflow-hidden",children:[_.jsx("main",{className:"flex-1 relative bg-zinc-900/50 overflow-hidden",children:_.jsx(z3,{draft:r,globalDraft:c,slug:n,selectedId:h==null?void 0:h.id})}),_.jsx(_3,{selectedSection:h,pageData:x,onUpdate:v,onClose:()=>p(null)})]})]})})})},K3=()=>_.jsx(rf,{mode:"tenant",children:_.jsx(C3,{})});function P3(){const[n,r]=j.useState(!1);return j.useEffect(()=>{Id.setTheme(Bd),r(!0)},[]),n?_.jsx(e1,{children:_.jsxs(Jw,{children:[_.jsx(yr,{path:"/",element:_.jsx(kv,{})}),_.jsx(yr,{path:"/:slug",element:_.jsx(kv,{})}),_.jsx(yr,{path:"/admin",element:_.jsx(Ev,{})}),_.jsx(yr,{path:"/admin/:slug",element:_.jsx(Ev,{})}),_.jsx(yr,{path:"/admin/preview/:slug",element:_.jsx(K3,{})}),_.jsx(yr,{path:"*",element:_.jsx(c0,{})})]})}):null}dw.createRoot(document.getElementById("root")).render(_.jsx(Sa.StrictMode,{children:_.jsx(P3,{})}));

END_OF_FILE_CONTENT
echo "Creating dist/index.html..."
cat << 'END_OF_FILE_CONTENT' > "dist/index.html"
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="JsonPages - Global Authoring. Global Governance." />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Instrument+Sans:wght@400;500;600;700&family=JetBrains+Mono:wght@400;500&family=Playfair+Display:wght@700;800;900&display=swap" rel="stylesheet" />
    <title>JsonPages</title>
    <script type="module" crossorigin src="/assets/index-DpwGE-uV.js"></script>
  </head>
  <body>
    <div id="root"></div>
  </body>
</html>


END_OF_FILE_CONTENT
echo "Creating index.html..."
cat << 'END_OF_FILE_CONTENT' > "index.html"
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="JsonPages - Global Authoring. Global Governance." />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Instrument+Sans:wght@400;500;600;700&family=JetBrains+Mono:wght@400;500&family=Playfair+Display:wght@700;800;900&display=swap" rel="stylesheet" />
    <title>JsonPages</title>
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/src/main.tsx"></script>
  </body>
</html>


END_OF_FILE_CONTENT
echo "Creating package.json..."
cat << 'END_OF_FILE_CONTENT' > "package.json"
{
  "name": "jsonpage-skeleton",
  "private": true,
  "version": "2.4.1",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "tsc && vite build",
    "preview": "vite preview",
    "lint": "eslint src"
  },
  "dependencies": {
    "@base-ui/react": "^1.1.0",
    "class-variance-authority": "^0.7.1",
    "clsx": "^2.1.1",
    "file-saver": "^2.0.5",
    "jszip": "^3.10.1",
    "lucide-react": "^0.474.0",
    "radix-ui": "^1.4.3",
    "react": "^19.0.0",
    "react-dom": "^19.0.0",
    "react-router-dom": "^6.29.0",
    "tailwind-merge": "^3.0.1",
    "tw-animate-css": "^1.4.0",
    "zod": "^3.24.1"
  },
  "devDependencies": {
    "@tailwindcss/postcss": "^4.0.0",
    "@tailwindcss/vite": "^4.0.0",
    "@types/file-saver": "^2.0.7",
    "@types/node": "^22.13.1",
    "@types/react": "^19.0.8",
    "@types/react-dom": "^19.0.3",
    "@vitejs/plugin-react": "^4.3.4",
    "autoprefixer": "^10.4.20",
    "eslint": "^9.19.0",
    "postcss": "^8.5.1",
    "tailwindcss": "^4.0.0",
    "typescript": "^5.7.3",
    "vite": "^6.0.11"
  }
}



END_OF_FILE_CONTENT
mkdir -p "public"
mkdir -p "src"
echo "Creating src/App.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/App.tsx"
/**
 * Thin Entry Point (Tenant).
 * Only imports the Engine and local implementation data; passes everything via config.
 * No routing or Admin UI logic here — that lives in JsonPagesEngine.
 */
import React from 'react';
import { JsonPagesEngine } from '@/lib/JsonPagesEngine';
import { ComponentRegistry } from '@/lib/ComponentRegistry';
import { SECTION_SCHEMAS } from '@/lib/schemas';
import type { JsonPagesConfig } from '@/lib/types-engine';
import type { PageConfig, SiteConfig, ThemeConfig, MenuConfig } from '@/types';

// Tenant data (implementation)
import siteData from '@/data/config/site.json';
import themeData from '@/data/config/theme.json';
import menuData from '@/data/config/menu.json';
import homeData from '@/data/pages/home.json';

// Tenant CSS for ThemeLoader (Engine injects it; Tenant does not manage Admin CSS)
// @ts-expect-error Vite ?inline returns raw string
import tenantCss from './index.css?inline';

const siteConfig = siteData as unknown as SiteConfig;
const themeConfig = themeData as unknown as ThemeConfig;
const menuConfig = menuData as unknown as MenuConfig;

const pages: Record<string, PageConfig> = {
  home: homeData as unknown as PageConfig,
};

const config: JsonPagesConfig = {
  registry: ComponentRegistry as JsonPagesConfig['registry'],
  schemas: SECTION_SCHEMAS as unknown as JsonPagesConfig['schemas'],
  pages,
  siteConfig,
  themeConfig,
  menuConfig,
  themeCss: { tenant: tenantCss },
};

function App() {
  return <JsonPagesEngine config={config} />;
}

export default App;

END_OF_FILE_CONTENT
mkdir -p "src/admin"
echo "Creating src/admin/AdminSidebar.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/admin/AdminSidebar.tsx"
import React from 'react';
import { z } from 'zod';
import { useConfig } from '../lib/ConfigContext';
import { FormFactory } from './FormFactory';
import { PageConfig, Section, SectionType } from '@/types';
import { MousePointerClick, SlidersHorizontal, Save, Layers } from 'lucide-react';

/**
 * 🧩 SelectedSectionInfo
 */
interface SelectedSectionInfo {
  id: string;
  type: SectionType;
  scope: 'local' | 'global';
}

/**
 * 🧩 AdminSidebarProps
 */
interface AdminSidebarProps {
  selectedSection: SelectedSectionInfo | null;
  pageData: PageConfig | { sections: Section[] };
  onUpdate: (newData: Record<string, unknown>) => void;
  onClose: () => void;
}

/**
 * 🛡️ ZERO STATE COMPONENT
 */
const ZeroStateContent: React.FC = () => (
  <div className="flex flex-col h-full">
    <div className="flex-1 flex flex-col items-center justify-center p-8 text-center space-y-6">
      <div className="relative">
        <div className="absolute inset-0 bg-blue-500/20 blur-xl rounded-full" />
        <div className="relative w-20 h-20 rounded-2xl bg-zinc-900 border border-zinc-800 flex items-center justify-center shadow-2xl">
          <Layers className="text-zinc-400" size={40} strokeWidth={1.5} />
        </div>
      </div>
      
      <div className="space-y-2 max-w-[200px]">
        <h3 className="text-sm font-semibold text-zinc-100">Welcome to Studio</h3>
        <p className="text-xs text-zinc-500 leading-relaxed">
          The canvas is ready. Select an element to begin editing.
        </p>
      </div>
    </div>

    <div className="p-6 border-t border-zinc-800/50 bg-zinc-900/20">
      <h4 className="text-[10px] font-bold uppercase tracking-widest text-zinc-600 mb-4">
        How it works
      </h4>
      <ul className="space-y-4">
        <li className="flex items-start gap-3 group">
          <div className="mt-0.5 p-1.5 rounded-md bg-zinc-900 border border-zinc-800 text-zinc-500 group-hover:text-blue-400 group-hover:border-blue-500/30 transition-colors">
            <MousePointerClick size={14} />
          </div>
          <div>
            <p className="text-xs font-medium text-zinc-300">Select</p>
            <p className="text-[10px] text-zinc-500">Click any section on the stage.</p>
          </div>
        </li>
        <li className="flex items-start gap-3 group">
          <div className="mt-0.5 p-1.5 rounded-md bg-zinc-900 border border-zinc-800 text-zinc-500 group-hover:text-blue-400 group-hover:border-blue-500/30 transition-colors">
            <SlidersHorizontal size={14} />
          </div>
          <div>
            <p className="text-xs font-medium text-zinc-300">Edit</p>
            <p className="text-[10px] text-zinc-500">Tweak content and settings.</p>
          </div>
        </li>
        <li className="flex items-start gap-3 group">
          <div className="mt-0.5 p-1.5 rounded-md bg-zinc-900 border border-zinc-800 text-zinc-500 group-hover:text-blue-400 group-hover:border-blue-500/30 transition-colors">
            <Save size={14} />
          </div>
          <div>
            <p className="text-xs font-medium text-zinc-300">Save</p>
            <p className="text-[10px] text-zinc-500">Persist changes to JSON.</p>
          </div>
        </li>
      </ul>
    </div>
  </div>
);

/**
 * 🛠️ AdminSidebar (Inspector)
 */
export const AdminSidebar: React.FC<AdminSidebarProps> = ({ 
  selectedSection, 
  pageData, 
  onUpdate,
  onClose 
}) => {
  if (!selectedSection) {
    return (
      <aside className="relative w-80 h-screen bg-zinc-950 border-l border-zinc-800 flex flex-col shadow-2xl shrink-0">
        <div className="p-4 border-b border-zinc-800 flex justify-between items-center bg-zinc-900/50">
          <div>
            <h3 className="text-sm font-bold text-white">Inspector</h3>
            <p className="text-[10px] font-mono text-zinc-500 uppercase tracking-wider">
              Waiting for Selection...
            </p>
          </div>
        </div>
        <ZeroStateContent />
      </aside>
    );
  }

  const section = pageData.sections.find((s: Section) => s.id === selectedSection.id);
  const { schemas } = useConfig();
  const schema = schemas[selectedSection.type] as z.ZodObject<z.ZodRawShape> | undefined;

  return (
    <aside className="relative w-80 h-screen bg-zinc-950 border-l border-zinc-800 flex flex-col shadow-2xl shrink-0 animate-in slide-in-from-right duration-300">
      <div className="p-4 border-b border-zinc-800 flex justify-between items-center bg-zinc-900/50">
        <div>
          <h3 className="text-sm font-bold text-white">Inspector</h3>
          <p className="text-[10px] font-mono text-blue-400 uppercase tracking-wider">
            {selectedSection.type} <span className="text-zinc-600">|</span> {selectedSection.scope}
          </p>
        </div>
        <button 
          onClick={onClose} 
          className="text-zinc-500 hover:text-white transition-colors p-1 hover:bg-zinc-800 rounded"
        >
          ✕
        </button>
      </div>

      <div className="flex-1 overflow-y-auto p-6 custom-scrollbar">
        {!schema ? (
          <div className="text-xs text-red-400 p-4 border border-dashed border-red-900/30 rounded bg-red-900/10">
            No schema found for {selectedSection.type}
          </div>
        ) : (
          <FormFactory 
            schema={schema}
            data={(section?.data as Record<string, unknown>) || {}} 
            onChange={(newData) => onUpdate(newData)} 
          />
        )}
      </div>

      <div className="p-4 border-t border-zinc-800 bg-zinc-900/50">
        <button className="w-full bg-blue-600 hover:bg-blue-500 text-white text-xs font-bold py-2.5 rounded shadow-lg shadow-blue-900/20 transition-all active:scale-[0.98] flex items-center justify-center gap-2">
          <Save size={14} />
          Save Changes
        </button>
      </div>
    </aside>
  );
};



END_OF_FILE_CONTENT
echo "Creating src/admin/ControlBar.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/admin/ControlBar.tsx"
import React from 'react';
import { FileJson, FileCode } from 'lucide-react';
import { cn } from '@/lib/utils';

interface ControlBarProps {
  hasChanges: boolean;
  onExportJSON: () => void;
  onExportHTML: () => void;
}

export const ControlBar: React.FC<ControlBarProps> = ({ 
  hasChanges, 
  onExportJSON, 
  onExportHTML 
}) => {
  return (
    <div className="h-14 border-b border-zinc-800 bg-zinc-950 flex items-center justify-between px-6 shrink-0 z-50 relative">
      <div className="flex items-center gap-3">
        <div className="flex items-center gap-2">
          <div className={cn(
            "w-2 h-2 rounded-full transition-colors duration-300",
            hasChanges ? "bg-amber-500 shadow-[0_0_8px_rgba(245,158,11,0.5)]" : "bg-emerald-500"
          )} />
          <span className={cn(
            "text-xs font-medium transition-colors duration-300",
            hasChanges ? "text-amber-500" : "text-zinc-500"
          )}>
            {hasChanges ? "Unsaved Changes" : "All Changes Saved"}
          </span>
        </div>
      </div>

      <div className="absolute left-1/2 -translate-x-1/2 opacity-20 pointer-events-none">
        <span className="text-xs font-black tracking-[0.2em] text-zinc-100">JSONPAGES STUDIO</span>
      </div>

      <div className="flex items-center gap-2">
        <button
          onClick={onExportHTML}
          disabled={!hasChanges}
          className={cn(
            "flex items-center gap-2 px-3 py-1.5 rounded-md text-xs font-medium transition-all border",
            hasChanges 
              ? "bg-zinc-900 border-zinc-700 text-zinc-200 hover:bg-zinc-800 hover:border-zinc-600" 
              : "bg-transparent border-transparent text-zinc-600 cursor-not-allowed"
          )}
        >
          <FileCode size={14} />
          <span>Bake HTML</span>
        </button>

        <button
          onClick={onExportJSON}
          disabled={!hasChanges}
          className={cn(
            "flex items-center gap-2 px-4 py-1.5 rounded-md text-xs font-bold transition-all shadow-lg",
            hasChanges 
              ? "bg-blue-600 text-white hover:bg-blue-500 shadow-blue-900/20" 
              : "bg-zinc-900 text-zinc-600 cursor-not-allowed"
          )}
        >
          <FileJson size={14} />
          <span>Export JSON</span>
        </button>
      </div>
    </div>
  );
};



END_OF_FILE_CONTENT
echo "Creating src/admin/FormFactory.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/admin/FormFactory.tsx"
import React from 'react';
import { z } from 'zod';
import { InputWidgets, WidgetType } from './InputRegistry';
import { Plus, Trash2, ChevronDown, ChevronUp, ArrowUp, ArrowDown } from 'lucide-react';
import { BaseWidgetProps } from '@/lib/shared-types';

/**
 * 🛠️ HELPER: Generates a default value based on the Zod schema.
 */
const generateDefaultValue = (schema: z.ZodTypeAny): unknown => {
  if (schema instanceof z.ZodOptional || schema instanceof z.ZodDefault) {
    return generateDefaultValue(schema._def.innerType);
  }
  if (schema instanceof z.ZodObject) {
    const obj: Record<string, unknown> = {};
    for (const key in schema.shape) {
      obj[key] = generateDefaultValue(schema.shape[key]);
    }
    return obj;
  }
  if (schema instanceof z.ZodArray) return [];
  if (schema instanceof z.ZodString) return "";
  if (schema instanceof z.ZodNumber) return 0;
  if (schema instanceof z.ZodBoolean) return false;
  if (schema instanceof z.ZodEnum) return schema._def.values[0];
  return null;
};

/**
 * 🛠️ HELPER: Extracts the real schema ignoring Zod wrappers.
 */
const getEffectiveSchema = (schema: z.ZodTypeAny): z.ZodTypeAny => {
  if (schema instanceof z.ZodOptional || schema instanceof z.ZodDefault) {
    return getEffectiveSchema(schema._def.innerType);
  }
  return schema;
};

interface FormFactoryProps {
  schema: z.ZodObject<z.ZodRawShape>;
  data: Record<string, unknown>;
  onChange: (newData: Record<string, unknown>) => void;
}

/**
 * 🏭 POLYMORPHIC FORM FACTORY (V2.7.0)
 */
export const FormFactory: React.FC<FormFactoryProps> = ({ schema, data, onChange }) => {
  const shape = schema.shape;

  return (
    <div className="space-y-4">
      {Object.keys(shape).map((key) => {
        const fieldSchema = shape[key];
        if (!fieldSchema) return null;

        const effectiveSchema = getEffectiveSchema(fieldSchema);
        const uiHint = (fieldSchema.description as WidgetType) || 'ui:text';
        const value = data[key];

        // 1. OBJECT HANDLING
        if (effectiveSchema instanceof z.ZodObject) {
          const objectData = (value as Record<string, unknown>) || {};
          return (
            <div key={key} className="group/obj mb-6 p-4 border border-zinc-800 rounded-lg bg-zinc-900/20 hover:border-zinc-700 transition-colors">
              <div className="flex items-center gap-2 mb-4">
                <div className="w-1 h-3 bg-blue-500 rounded-full" />
                <h4 className="text-[10px] font-black uppercase text-zinc-400 tracking-widest">
                  {key}
                </h4>
              </div>
              <FormFactory 
                schema={effectiveSchema} 
                data={objectData} 
                onChange={(val) => onChange({ ...data, [key]: val })} 
              />
            </div>
          );
        }

        // 2. ARRAY HANDLING
        if (effectiveSchema instanceof z.ZodArray) {
          const items = (Array.isArray(value) ? value : []) as unknown[];
          const itemSchema = getEffectiveSchema(effectiveSchema.element);

          const moveItem = (from: number, to: number) => {
            if (to < 0 || to >= items.length) return;
            const newItems = [...items];
            const [removed] = newItems.splice(from, 1);
            newItems.splice(to, 0, removed);
            onChange({ ...data, [key]: newItems });
          };

          return (
            <div key={key} className="mb-8">
              <div className="flex items-center justify-between mb-3">
                <label className="text-[10px] font-black uppercase text-zinc-500 tracking-widest">
                  {key} ({items.length})
                </label>
                <button 
                  type="button"
                  onClick={() => {
                    const newItem = generateDefaultValue(itemSchema);
                    onChange({ ...data, [key]: [...items, newItem] });
                  }}
                  className="flex items-center gap-1 px-2 py-1 bg-blue-600/10 hover:bg-blue-600/20 text-blue-500 rounded text-[10px] font-bold transition-colors"
                >
                  <Plus size={12} /> Add Item
                </button>
              </div>

              <div className="space-y-2">
                {items.map((item, index) => {
                  const itemRecord = item as Record<string, unknown>;
                  const itemTitle = 
                    (typeof itemRecord.title === 'string' ? itemRecord.title : null) || 
                    (typeof itemRecord.label === 'string' ? itemRecord.label : null) || 
                    (typeof itemRecord.name === 'string' ? itemRecord.name : null) || 
                    (typeof itemRecord.content === 'string' ? itemRecord.content : null) || 
                    (typeof itemRecord.text === 'string' ? itemRecord.text : null) || 
                    `${key} #${index + 1}`;

                  return (
                    <ArrayItemWrapper 
                      key={index} 
                      index={index}
                      isFirst={index === 0}
                      isLast={index === items.length - 1}
                      label={itemTitle}
                      onRemove={() => {
                        const newItems = items.filter((_, i) => i !== index);
                        onChange({ ...data, [key]: newItems });
                      }}
                      onMoveUp={() => moveItem(index, index - 1)}
                      onMoveDown={() => moveItem(index, index + 1)}
                    >
                      {itemSchema instanceof z.ZodObject ? (
                        <FormFactory 
                          schema={itemSchema} 
                          data={itemRecord || {}} 
                          onChange={(val) => {
                            const newItems = [...items];
                            newItems[index] = val;
                            onChange({ ...data, [key]: newItems });
                          }} 
                        />
                      ) : (
                        <div className="text-[10px] text-red-400">Primitive arrays not supported.</div>
                      )}
                    </ArrayItemWrapper>
                  );
                })}
              </div>
            </div>
          );
        }

        // 3. ATOMIC WIDGET HANDLING
        const Widget = (InputWidgets[uiHint] || InputWidgets['ui:text']) as React.ComponentType<BaseWidgetProps>;
        const options = effectiveSchema instanceof z.ZodEnum ? (effectiveSchema._def.values as string[]) : undefined;

        return (
          <Widget 
            key={key}
            label={key}
            value={value}
            options={options}
            onChange={(val) => onChange({ ...data, [key]: val })}
          />
        );
      })}
    </div>
  );
};

interface ArrayItemWrapperProps {
  index: number;
  isFirst: boolean;
  isLast: boolean;
  label: string;
  onRemove: () => void;
  onMoveUp: () => void;
  onMoveDown: () => void;
  children: React.ReactNode;
}

const ArrayItemWrapper: React.FC<ArrayItemWrapperProps> = ({ 
  label, 
  onRemove, 
  onMoveUp, 
  onMoveDown, 
  isFirst, 
  isLast, 
  children 
}) => {
  const [isOpen, setIsOpen] = React.useState(false);

  return (
    <div className="border border-zinc-800 rounded-md bg-zinc-900/40 overflow-hidden">
      <div className="flex items-center justify-between px-3 py-2 bg-zinc-900/60">
        <div className="flex items-center gap-2 flex-1 min-w-0">
          <button 
            type="button"
            onClick={() => setIsOpen(!isOpen)}
            className="flex items-center gap-2 text-[10px] font-bold text-zinc-300 uppercase tracking-tight truncate"
          >
            {isOpen ? <ChevronUp size={12} className="shrink-0" /> : <ChevronDown size={12} className="shrink-0" />}
            <span className="truncate">{label}</span>
          </button>
        </div>
        
        <div className="flex items-center gap-1 shrink-0 ml-2">
          <button 
            type="button"
            disabled={isFirst}
            onClick={onMoveUp}
            className="text-zinc-500 hover:text-blue-400 disabled:opacity-20 p-1 transition-colors"
          >
            <ArrowUp size={12} />
          </button>
          <button 
            type="button"
            disabled={isLast}
            onClick={onMoveDown}
            className="text-zinc-500 hover:text-blue-400 disabled:opacity-20 p-1 transition-colors"
          >
            <ArrowDown size={12} />
          </button>
          <div className="w-px h-3 bg-zinc-800 mx-1" />
          <button 
            type="button"
            onClick={onRemove}
            className="text-zinc-600 hover:text-red-500 transition-colors p-1"
          >
            <Trash2 size={12} />
          </button>
        </div>
      </div>
      {isOpen && (
        <div className="p-4 border-t border-zinc-800 bg-black/20">
          {children}
        </div>
      )}
    </div>
  );
};




END_OF_FILE_CONTENT
echo "Creating src/admin/InputRegistry.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/admin/InputRegistry.tsx"
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { Checkbox } from "@/components/ui/checkbox";
import { Label } from "@/components/ui/label";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { 
  Layers, 
  Github, 
  ArrowRight, 
  Box, 
  Terminal, 
  ChevronRight, 
  Menu, 
  X 
} from "lucide-react";
import { BaseWidgetProps } from '@/lib/shared-types';

export const InputWidgets = {
  'ui:text': ({ label, value, onChange }: BaseWidgetProps<string>) => (
    <div className="grid w-full items-center gap-1.5 mb-4">
      <Label className="text-[9px] uppercase font-black tracking-widest text-zinc-500">
        {label}
      </Label>
      <Input 
        type="text" 
        className="h-7 text-[11px] bg-zinc-900/50 border-zinc-800 focus-visible:ring-blue-600"
        value={value || ''} 
        onChange={(e) => onChange(e.target.value)} 
      />
    </div>
  ),

  'ui:textarea': ({ label, value, onChange }: BaseWidgetProps<string>) => (
    <div className="grid w-full gap-1.5 mb-4">
      <Label className="text-[9px] uppercase font-black tracking-widest text-zinc-500">
        {label}
      </Label>
      <Textarea 
        className="min-h-[80px] text-[11px] bg-zinc-900/50 border-zinc-800 focus-visible:ring-blue-600 resize-none"
        value={value || ''} 
        onChange={(e) => onChange(e.target.value)} 
      />
    </div>
  ),

  'ui:select': ({ label, value, onChange, options = [] }: BaseWidgetProps<string>) => (
    <div className="grid w-full gap-1.5 mb-4">
      <Label className="text-[9px] uppercase font-black tracking-widest text-zinc-500">
        {label}
      </Label>
      <Select value={value || ""} onValueChange={onChange}>
        <SelectTrigger className="w-full h-7 text-[11px] bg-zinc-900/50 border-zinc-800 focus:ring-blue-600">
          <SelectValue placeholder={`Select...`} />
        </SelectTrigger>
        <SelectContent className="dark">
          {options.map((opt) => (
            <SelectItem key={opt} value={opt} className="text-[11px]">
              {opt}
            </SelectItem>
          ))}
        </SelectContent>
      </Select>
    </div>
  ),

  'ui:checkbox': ({ label, value, onChange }: BaseWidgetProps<boolean>) => (
    <div className="flex items-center space-x-2 mb-4 p-2 rounded border border-zinc-800/50 bg-zinc-900/20">
      <Checkbox 
        id={label} 
        checked={!!value} 
        onCheckedChange={(checked) => onChange(checked === true)} 
      />
      <Label 
        htmlFor={label} 
        className="text-[11px] font-medium cursor-pointer select-none text-zinc-300"
      >
        {label}
      </Label>
    </div>
  ),

  'ui:icon-picker': ({ label, value, onChange }: BaseWidgetProps<string>) => {
    const availableIcons = [
      { name: 'layers', icon: Layers },
      { name: 'github', icon: Github },
      { name: 'arrow-right', icon: ArrowRight },
      { name: 'box', icon: Box },
      { name: 'terminal', icon: Terminal },
      { name: 'chevron-right', icon: ChevronRight },
      { name: 'menu', icon: Menu },
      { name: 'x', icon: X },
    ];

    return (
      <div className="grid w-full gap-1.5 mb-4">
        <Label className="text-[9px] uppercase font-black tracking-widest text-zinc-500">
          {label}
        </Label>
        <Select value={value || ""} onValueChange={onChange}>
          <SelectTrigger className="w-full h-7 text-[11px] bg-zinc-900/50 border-zinc-800 focus:ring-blue-600">
            <SelectValue placeholder="Icon..." />
          </SelectTrigger>
          <SelectContent className="dark">
            {availableIcons.map((item) => (
              <SelectItem key={item.name} value={item.name} className="text-[11px]">
                <div className="flex items-center gap-2">
                  <item.icon size={12} className="text-zinc-500" />
                  <span className="capitalize">{item.name}</span>
                </div>
              </SelectItem>
            ))}
          </SelectContent>
        </Select>
      </div>
    );
  },
} as const;

export type WidgetType = keyof typeof InputWidgets;



END_OF_FILE_CONTENT
echo "Creating src/admin/PreviewEntry.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/admin/PreviewEntry.tsx"
import React, { useState, useEffect } from 'react';
import { PageRenderer } from '@/lib/PageRenderer';
import { StudioProvider } from '@/lib/StudioContext';
import { themeManager } from '@/utils/theme-manager';
import { STUDIO_EVENTS } from '@/lib/events';
import type { PageConfig, SiteConfig, MenuConfig } from '@/types';

export const PreviewEntry: React.FC = () => {
  const [draft, setDraft] = useState<PageConfig | null>(null);
  const [globalDraft, setGlobalDraft] = useState<SiteConfig | null>(null);
  const [selectedId, setSelectedId] = useState<string | null>(null);
  const [isBaking, setIsBaking] = useState(false);

  useEffect(() => {
    const handleMessage = (event: MessageEvent) => {
      if (event.data.type === STUDIO_EVENTS.UPDATE_DRAFTS) {
        setDraft(event.data.draft);
        setGlobalDraft(event.data.globalDraft);
        if (event.data.themeConfig) {
           themeManager.setTheme(event.data.themeConfig);
        }
      }
      
      if (event.data.type === STUDIO_EVENTS.SYNC_SELECTION) {
        setSelectedId(event.data.selectedId);
      }

      // 🛡️ BAKE HANDSHAKE: Switch to visitor mode and send HTML back
      if (event.data.type === STUDIO_EVENTS.REQUEST_CLEAN_HTML) {
        setIsBaking(true);
        // Use setTimeout to ensure React has rendered the "Visitor" mode (no outlines)
        setTimeout(() => {
          const html = document.documentElement.outerHTML;
          window.parent.postMessage({ 
            type: STUDIO_EVENTS.SEND_CLEAN_HTML, 
            html 
          }, '*');
          setIsBaking(false);
        }, 50);
      }
    };

    window.addEventListener('message', handleMessage);
    window.parent.postMessage({ type: STUDIO_EVENTS.STAGE_READY }, '*');
    return () => window.removeEventListener('message', handleMessage);
  }, []);

  if (!draft || !globalDraft) {
    return (
      <div className="flex items-center justify-center h-screen w-full bg-zinc-950 text-zinc-500 font-mono text-xs uppercase tracking-widest animate-pulse">
        Waiting for Studio Signal...
      </div>
    );
  }

  const currentMenuConfig: MenuConfig = {
    main: globalDraft.header.data.links || []
  };

  return (
    <StudioProvider mode={isBaking ? "visitor" : "studio"}>
      <div className={isBaking ? "" : "jp-ice-active"}>
        <PageRenderer 
          pageConfig={draft} 
          siteConfig={globalDraft} 
          menuConfig={currentMenuConfig}
          selectedId={isBaking ? null : selectedId}
        />
      </div>
    </StudioProvider>
  );
};


END_OF_FILE_CONTENT
echo "Creating src/admin/StudioStage.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/admin/StudioStage.tsx"
import React, { useEffect, useRef, useCallback } from 'react';
import { STUDIO_EVENTS } from '@/lib/events';
import type { PageConfig, SiteConfig, ThemeConfig } from '@/types';

interface StudioStageProps {
  draft: PageConfig;
  globalDraft: SiteConfig;
  themeConfig: ThemeConfig;
  slug: string;
  selectedId?: string | null;
}

/**
 * 📺 STUDIO STAGE (Full Preview Mode)
 * Manages the Iframe and the PostMessage protocol.
 * NOW INCLUDES: Handshake Listener to fix the "Waiting..." race condition.
 */
export const StudioStage: React.FC<StudioStageProps> = ({
  draft,
  globalDraft,
  themeConfig,
  slug,
  selectedId,
}) => {
  const iframeRef = useRef<HTMLIFrameElement>(null);

  /**
   * 📤 TRANSMITTER
   * Encapsulated function to send the current state to the Iframe.
   */
  const sendDataToStage = useCallback(() => {
    if (iframeRef.current?.contentWindow) {
      iframeRef.current.contentWindow.postMessage({
        type: STUDIO_EVENTS.UPDATE_DRAFTS,
        draft,
        globalDraft,
        themeConfig,
      }, '*');
    }
  }, [draft, globalDraft, themeConfig]);

  /**
   * 🔄 SYNC 1: Reactivity
   * Send data whenever the draft changes in the Inspector.
   */
  useEffect(() => {
    sendDataToStage();
  }, [sendDataToStage]);

  /**
   * 🤝 SYNC 2: The Handshake (Fixes the Race Condition)
   * Listen for the Iframe saying "I am ready" and send data immediately.
   */
  useEffect(() => {
    const handleHandshake = (event: MessageEvent) => {
      if (event.data.type === STUDIO_EVENTS.STAGE_READY) {
        // console.log("🤝 Handshake received from Stage. Transmitting data...");
        sendDataToStage();
      }
    };

    window.addEventListener('message', handleHandshake);
    return () => window.removeEventListener('message', handleHandshake);
  }, [sendDataToStage]);

  /**
   * 🎯 SYNC 3: Selection
   * Independent channel for high-frequency selection updates.
   */
  useEffect(() => {
    if (iframeRef.current?.contentWindow) {
      iframeRef.current.contentWindow.postMessage({
        type: STUDIO_EVENTS.SYNC_SELECTION,
        selectedId
      }, '*');
    }
  }, [selectedId]);

  return (
    <div className="w-full h-full bg-background overflow-hidden">
      <iframe
        ref={iframeRef}
        src={`/admin/preview/${slug}`}
        className="w-full h-full border-none"
        title="JsonPages Stage"
      />
    </div>
  );
};




END_OF_FILE_CONTENT
echo "Creating src/admin/admin-skin.css..."
cat << 'END_OF_FILE_CONTENT' > "src/admin/admin-skin.css"
@import "tailwindcss";

@source "../**/*.tsx";

@theme {
  --color-background: var(--background);
  --color-foreground: var(--foreground);
  --color-card: var(--card);
  --color-card-foreground: var(--card-foreground);
  --color-popover: var(--popover);
  --color-popover-foreground: var(--popover-foreground);
  --color-primary: var(--primary);
  --color-primary-foreground: var(--primary-foreground);
  --color-secondary: var(--secondary);
  --color-secondary-foreground: var(--secondary-foreground);
  --color-muted: var(--muted);
  --color-muted-foreground: var(--muted-foreground);
  --color-accent: var(--accent);
  --color-accent-foreground: var(--accent-foreground);
  --color-destructive: var(--destructive);
  --color-destructive-foreground: var(--destructive-foreground);
  --color-border: var(--border);
  --color-input: var(--input);
  --color-ring: var(--ring);
}

:root {
  --background: oklch(0.141 0.005 285.823);
  --foreground: oklch(0.985 0 0);
  --card: oklch(0.21 0.006 285.885);
  --card-foreground: oklch(0.985 0 0);
  --popover: oklch(0.21 0.006 285.885);
  --popover-foreground: oklch(0.985 0 0);
  --primary: oklch(0.42 0.18 266);
  --primary-foreground: oklch(0.97 0.014 254.604);
  --secondary: oklch(0.274 0.006 286.033);
  --secondary-foreground: oklch(0.985 0 0);
  --muted: oklch(0.274 0.006 286.033);
  --muted-foreground: oklch(0.705 0.015 286.067);
  --accent: oklch(0.42 0.18 266);
  --accent-foreground: oklch(0.97 0.014 254.604);
  --destructive: oklch(0.704 0.191 22.216);
  --destructive-foreground: oklch(0.97 0.014 254.604);
  --border: oklch(1 0 0 / 10%);
  --input: oklch(1 0 0 / 15%);
  --ring: oklch(0.552 0.016 285.938);
  --radius: 0.5rem;
  font-family: ui-sans-serif, system-ui, sans-serif;
}

@layer base {
  * { border-color: var(--border); }
  body {
    background-color: var(--background);
    color: var(--foreground);
    @apply antialiased;
  }
}

[data-radix-portal] { z-index: 9999 !important; }




END_OF_FILE_CONTENT
mkdir -p "src/components"
mkdir -p "src/components"
echo "Creating src/components/ArchLayers.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/components/ArchLayers.tsx"
import React from 'react';
import { cn } from '@/lib/utils';
import type { ArchLayersData, BaseSectionSettings } from '@/types';

interface ArchLayersProps {
  data: ArchLayersData;
  settings?: BaseSectionSettings;
}

const layerBgStyles: Record<string, string> = {
  l0: 'bg-[#3b82f6]',
  l1: 'bg-[rgba(59,130,246,0.6)]',
  l2: 'bg-[rgba(59,130,246,0.35)]',
};

const tokenStyles: Record<string, string> = {
  plain: 'text-[#cbd5e1]',
  keyword: 'text-[#60a5fa]',
  type: 'text-[#22d3ee]',
  string: 'text-[#4ade80]',
  comment: 'text-[#64748b] italic',
  operator: 'text-[#f472b6]',
};

export const ArchLayers: React.FC<ArchLayersProps> = ({ data }) => {
  return (
    <section
      style={{
        '--local-bg': 'var(--card)',
        '--local-text': 'var(--foreground)',
        '--local-text-muted': 'var(--muted-foreground)',
        '--local-primary': 'var(--primary)',
        '--local-accent': 'var(--color-accent, #60a5fa)',
        '--local-border': 'var(--border)',
        '--local-deep': 'var(--background)',
      } as React.CSSProperties}
      className="relative z-0 py-28 bg-[var(--local-bg)]"
    >
      {/* Top/Bottom dividers */}
      <div className="absolute top-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-[rgba(59,130,246,0.1)] to-transparent" />
      <div className="absolute bottom-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-[rgba(59,130,246,0.1)] to-transparent" />

      <div className="max-w-[1200px] mx-auto px-8">
        {/* Section Header */}
        <div className="text-center">
          {data.label && (
            <div className="jp-section-label inline-flex items-center gap-2 text-[0.72rem] font-bold uppercase tracking-[0.12em] text-[var(--local-accent)] mb-4">
              <span className="w-5 h-px bg-[var(--local-primary)]" />
              {data.label}
            </div>
          )}
          <h2 className="font-display text-[clamp(2rem,4vw,3.2rem)] font-extrabold text-[var(--local-text)] leading-[1.15] tracking-tight mb-4">
            {data.title}
          </h2>
          {data.description && (
            <p className="text-lg text-[var(--local-text-muted)] max-w-[600px] mx-auto leading-relaxed">
              {data.description}
            </p>
          )}
        </div>

        {/* Layers */}
        <div className="mt-14 max-w-[740px] mx-auto">
          {data.layers.map((layer, idx) => (
            <div
              key={idx}
              className="group border border-[rgba(255,255,255,0.06)] rounded-[7px] p-8 mb-4 bg-[rgba(255,255,255,0.015)] flex items-start gap-6 transition-all duration-300 hover:border-[rgba(59,130,246,0.2)] hover:translate-x-1.5"
            >
              <div className={cn(
                'shrink-0 w-9 h-9 rounded-lg flex items-center justify-center font-mono text-[0.85rem] font-bold text-white',
                layerBgStyles[layer.layerLevel] || layerBgStyles.l0
              )}>
                {layer.number}
              </div>
              <div>
                <h4 className="text-[1.05rem] font-bold text-[var(--local-text)] mb-1.5">
                  {layer.title}
                </h4>
                <p className="text-[0.92rem] text-[var(--local-text-muted)] leading-relaxed">
                  {layer.description}
                </p>
              </div>
            </div>
          ))}
        </div>

        {/* Code Showcase */}
        {data.codeLines && data.codeLines.length > 0 && (
          <div className="mt-12 max-w-[740px] mx-auto">
            <div className="border border-[rgba(255,255,255,0.08)] rounded-[7px] overflow-hidden bg-[var(--local-deep)]">
              {/* Code Header */}
              <div className="flex items-center gap-2 px-5 py-3 bg-[rgba(255,255,255,0.03)] border-b border-[rgba(255,255,255,0.06)]">
                <span className="w-2.5 h-2.5 rounded-full bg-[#ef4444]" />
                <span className="w-2.5 h-2.5 rounded-full bg-[#f59e0b]" />
                <span className="w-2.5 h-2.5 rounded-full bg-[#22c55e]" />
                {data.codeFilename && (
                  <span className="ml-3 font-mono text-[0.75rem] text-[var(--local-text-muted)] opacity-60">
                    {data.codeFilename}
                  </span>
                )}
              </div>
              {/* Code Body */}
              <div className="p-6 font-mono text-[0.82rem] leading-[1.7] overflow-x-auto">
                {data.codeLines.map((line, idx) => (
                  <div key={idx}>
                    <span className={tokenStyles[line.tokenType] || tokenStyles.plain}>
                      {line.content}
                    </span>
                  </div>
                ))}
              </div>
            </div>
          </div>
        )}
      </div>
    </section>
  );
};



END_OF_FILE_CONTENT
echo "Creating src/components/CodeBlock.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/components/CodeBlock.tsx"
import React from 'react';
import { cn } from '@/lib/utils';
import { Icon } from '@/lib/IconResolver';
import type { CodeBlockData, CodeBlockSettings } from '@/types';

interface CodeBlockProps {
  data: CodeBlockData;
  settings?: CodeBlockSettings;
}

export const CodeBlock: React.FC<CodeBlockProps> = ({ data, settings }) => {
  const showLineNumbers = settings?.showLineNumbers ?? true;

  return (
    <section 
      style={{
        '--local-surface': 'var(--card)',
        '--local-text-muted': 'var(--muted-foreground)',
        '--local-bg': 'var(--background)',
        '--local-border': 'var(--border)',
        '--local-text': 'var(--foreground)',
        '--local-accent': 'var(--primary)',
        '--local-radius-lg': 'var(--radius)',
      } as React.CSSProperties}
      className="py-16 bg-[var(--local-surface)]"
    >
      <div className="container mx-auto px-6 max-w-4xl">
        {/* Label */}
        {data.label && (
          <div className="flex items-center gap-2 text-xs font-semibold uppercase tracking-wider text-[var(--local-text-muted)] mb-4">
            <Icon name="terminal" size={14} />
            <span>{data.label}</span>
          </div>
        )}

        {/* Code Container */}
        <div className="rounded-[var(--local-radius-lg)] bg-[var(--local-bg)] border border-[var(--local-border)] overflow-hidden">
          <div className="p-6 font-mono text-sm overflow-x-auto">
            {data.lines.map((line, idx) => (
              <div key={idx} className="flex items-start gap-4 py-1">
                {/* Line Number */}
                {showLineNumbers && (
                  <span className="select-none w-6 text-right text-[var(--local-text-muted)]/50">
                    {idx + 1}
                  </span>
                )}

                {/* Line Content */}
                <span
                  className={cn(
                    line.isComment
                      ? "text-[var(--local-text-muted)]/60"
                      : "text-[var(--local-text)]"
                  )}
                >
                  {!line.isComment && (
                    <span className="text-[var(--local-accent)] mr-2">$</span>
                  )}
                  {line.content}
                </span>
              </div>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
};




END_OF_FILE_CONTENT
echo "Creating src/components/CtaBanner.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/components/CtaBanner.tsx"
import React from 'react';
import { cn } from '@/lib/utils';
import type { CtaBannerData, BaseSectionSettings } from '@/types';

interface CtaBannerProps {
  data: CtaBannerData;
  settings?: BaseSectionSettings;
}

export const CtaBanner: React.FC<CtaBannerProps> = ({ data }) => {
  return (
    <section
      style={{
        '--local-bg': 'var(--background)',
        '--local-text': 'var(--foreground)',
        '--local-text-muted': 'var(--muted-foreground)',
        '--local-primary': 'var(--primary)',
        '--local-accent': 'var(--color-accent, #60a5fa)',
      } as React.CSSProperties}
      className="relative z-0 py-28 bg-[var(--local-bg)] overflow-hidden text-center"
    >
      {/* Radial glow */}
      <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[60vw] h-[60vw] bg-[radial-gradient(circle,rgba(59,130,246,0.08)_0%,transparent_60%)] pointer-events-none" />

      <div className="relative z-[2] max-w-[1200px] mx-auto px-8">
        {data.label && (
          <div className="jp-section-label inline-flex items-center gap-2 text-[0.72rem] font-bold uppercase tracking-[0.12em] text-[var(--local-accent)] mb-4">
            <span className="w-5 h-px bg-[var(--local-primary)]" />
            {data.label}
          </div>
        )}
        <h2 className="font-display text-[clamp(2rem,4vw,3.2rem)] font-extrabold text-[var(--local-text)] leading-[1.15] tracking-tight mb-6">
          {data.title}
        </h2>
        {data.description && (
          <p className="text-lg text-[var(--local-text-muted)] max-w-[600px] mx-auto leading-relaxed mb-10">
            {data.description}
          </p>
        )}

        {data.ctas && data.ctas.length > 0 && (
          <div className="flex gap-4 justify-center flex-wrap">
            {data.ctas.map((cta, idx) => (
              <a
                key={idx}
                href={cta.href}
                className={cn(
                  "inline-flex items-center gap-2 px-8 py-3.5 rounded-[5px] font-semibold text-base transition-all duration-200 no-underline",
                  cta.variant === 'primary'
                    ? "bg-[var(--local-primary)] text-white hover:brightness-110 hover:-translate-y-0.5 hover:shadow-[0_8px_30px_rgba(59,130,246,0.3)]"
                    : "bg-transparent text-[var(--local-text)] border border-[rgba(255,255,255,0.12)] hover:border-[rgba(255,255,255,0.3)] hover:bg-[rgba(255,255,255,0.04)]"
                )}
              >
                {cta.label}
              </a>
            ))}
          </div>
        )}
      </div>
    </section>
  );
};



END_OF_FILE_CONTENT
echo "Creating src/components/FeatureGrid.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/components/FeatureGrid.tsx"
import React from 'react';
import { cn } from '@/lib/utils';
import { Icon } from '@/lib/IconResolver';
import type { FeatureGridData, FeatureGridSettings } from '@/types';

interface FeatureGridProps {
  data: FeatureGridData;
  settings?: FeatureGridSettings;
}

const columnsMap: Record<number, string> = {
  2: 'md:grid-cols-2',
  3: 'md:grid-cols-3',
  4: 'md:grid-cols-4',
};

export const FeatureGrid: React.FC<FeatureGridProps> = ({ data, settings }) => {
  const cols = columnsMap[settings?.columns ?? 3];
  const isBordered = settings?.cardStyle === 'bordered';

  const localStyles = {
    '--local-bg': 'var(--background)',
    '--local-text': 'var(--foreground)',
    '--local-text-muted': 'var(--muted-foreground)',
    '--local-surface': 'var(--card)',
    '--local-surface-alt': 'var(--muted)',
    '--local-border': 'var(--border)',
    '--local-radius-lg': 'var(--radius)',
    '--local-radius-md': 'calc(var(--radius) - 2px)',
  } as React.CSSProperties;

  return (
    <section 
      style={localStyles}
      className="py-20 bg-[var(--local-bg)] relative z-0"
    >
      <div className="container mx-auto px-6">
        <h2 className="text-3xl md:text-4xl font-bold text-center text-[var(--local-text)] mb-16">
          {data.sectionTitle}
        </h2>

        <div className={cn("grid grid-cols-1 gap-6", cols)}>
          {data.cards.map((card, idx) => (
            <div
              key={idx}
              className={cn(
                "p-6 rounded-[var(--local-radius-lg)] bg-[var(--local-surface)]",
                isBordered && "border border-[var(--local-border)]"
              )}
            >
              {card.icon && (
                <div className="w-10 h-10 rounded-[var(--local-radius-md)] bg-[var(--local-surface-alt)] flex items-center justify-center mb-4">
                  <Icon name={card.icon} size={20} className="text-[var(--local-text-muted)]" />
                </div>
              )}

              <h3 className="text-lg font-semibold text-[var(--local-text)] mb-2">
                {card.emoji && <span className="mr-2">{card.emoji}</span>}
                {card.title}
              </h3>

              <p className="text-sm text-[var(--local-text-muted)] leading-relaxed">
                {card.description}
              </p>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
};



END_OF_FILE_CONTENT
echo "Creating src/components/Footer.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/components/Footer.tsx"
import React from 'react';
import type { FooterData, FooterSettings } from '@/types';

interface FooterProps {
  data: FooterData;
  settings?: FooterSettings;
}

export const Footer: React.FC<FooterProps> = ({ data }) => {
  return (
    <footer
      style={{
        '--local-bg': 'var(--background)',
        '--local-text': 'var(--foreground)',
        '--local-text-muted': 'var(--muted-foreground)',
        '--local-accent': 'var(--color-accent, #60a5fa)',
        '--local-border': 'rgba(255,255,255,0.05)',
      } as React.CSSProperties}
      className="py-12 border-t border-[var(--local-border)] bg-[var(--local-bg)] relative z-0"
    >
      <div className="max-w-[1200px] mx-auto px-8">
        <div className="flex flex-col md:flex-row items-center justify-between gap-4">
          {/* Brand */}
          <div className="flex items-center gap-2 font-bold text-[0.9rem] text-[var(--local-text-muted)]">
            {data.brandText}
            {data.brandHighlight && (
              <span className="text-[var(--local-accent)]">{data.brandHighlight}</span>
            )}
          </div>

          {/* Links */}
          {data.links && data.links.length > 0 && (
            <nav className="flex gap-6">
              {data.links.map((link, idx) => (
                <a
                  key={idx}
                  href={link.href}
                  className="text-[0.82rem] text-[var(--local-text-muted)] hover:text-[var(--local-accent)] transition-colors no-underline"
                >
                  {link.label}
                </a>
              ))}
            </nav>
          )}

          {/* Copyright */}
          <div className="text-[0.8rem] text-[var(--local-text-muted)] opacity-60">
            {data.copyright}
          </div>
        </div>
      </div>
    </footer>
  );
};



END_OF_FILE_CONTENT
echo "Creating src/components/Header.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/components/Header.tsx"
import React, { useState, useEffect } from 'react';
import { cn } from '@/lib/utils';
import type { HeaderData, HeaderSettings, MenuItem } from '@/types';

interface HeaderProps {
  data: HeaderData;
  settings?: HeaderSettings;
  menu: MenuItem[];
}

// 🛡️ FIX: Removed 'settings' from destructuring to satisfy TS6133 (noUnusedLocals)
export const Header: React.FC<HeaderProps> = ({ data, menu }) => {
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);
  const [scrolled, setScrolled] = useState(false);

  useEffect(() => {
    const handleScroll = () => setScrolled(window.scrollY > 40);
    window.addEventListener('scroll', handleScroll, { passive: true });
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  return (
    <header
      style={{
        '--local-bg': 'rgba(6,13,27,0.92)',
        '--local-text': 'var(--foreground)',
        '--local-text-muted': 'var(--muted-foreground)',
        '--local-primary': 'var(--primary)',
        '--local-accent': 'var(--color-accent, #60a5fa)',
        '--local-border': 'rgba(59,130,246,0.08)',
      } as React.CSSProperties}
      className={cn(
        "w-full py-4 transition-all duration-300 z-0",
        scrolled
          ? "bg-[var(--local-bg)] backdrop-blur-[20px] border-b border-[var(--local-border)]"
          : "bg-transparent border-b border-transparent"
      )}
    >
      <div className="max-w-[1200px] mx-auto px-8 flex justify-between items-center">
        {/* Logo */}
        <a href="/" className="flex items-center gap-2.5 no-underline font-bold text-xl tracking-tight text-[var(--local-text)]">
          {data.logoIconText && (
            <div className="w-8 h-8 rounded-md bg-gradient-to-br from-[var(--local-primary)] to-[var(--local-accent)] flex items-center justify-center font-mono text-[0.8rem] font-bold text-[var(--background)]">
              {data.logoIconText}
            </div>
          )}
          <span>
            {data.logoText}
            {data.logoHighlight && (
              <span className="text-[var(--local-accent)]">{data.logoHighlight}</span>
            )}
          </span>
        </a>

        {/* Desktop Navigation */}
        <nav className="hidden md:flex items-center gap-10">
          {menu.map((item, idx) => (
            <a
              key={idx}
              href={item.href}
              target={item.external ? '_blank' : undefined}
              rel={item.external ? 'noopener noreferrer' : undefined}
              className={cn(
                "no-underline text-sm font-medium transition-colors",
                item.isCta
                  ? "bg-[var(--local-primary)] text-white px-5 py-2 rounded-lg font-semibold hover:brightness-110 hover:-translate-y-px"
                  : "text-[var(--local-text-muted)] hover:text-[var(--local-text)]"
              )}
            >
              {item.label}
            </a>
          ))}
        </nav>

        {/* Mobile Menu Toggle */}
        <button
          className="md:hidden p-2 text-[var(--local-text-muted)] hover:text-[var(--local-text)]"
          onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
          aria-label={mobileMenuOpen ? 'Close menu' : 'Open menu'}
        >
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            {mobileMenuOpen ? (
              <><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></>
            ) : (
              <><line x1="3" y1="12" x2="21" y2="12"/><line x1="3" y1="6" x2="21" y2="6"/><line x1="3" y1="18" x2="21" y2="18"/></>
            )}
          </svg>
        </button>
      </div>

      {/* Mobile Navigation */}
      {mobileMenuOpen && (
        <nav className="md:hidden border-t border-[var(--local-border)] bg-[var(--local-bg)] backdrop-blur-[20px]">
          <div className="max-w-[1200px] mx-auto px-8 py-4 flex flex-col gap-4">
            {menu.map((item, idx) => (
              <a
                key={idx}
                href={item.href}
                className="text-base font-medium text-[var(--local-text-muted)] hover:text-[var(--local-text)] transition-colors py-2 no-underline"
                onClick={() => setMobileMenuOpen(false)}
              >
                {item.label}
              </a>
            ))}
          </div>
        </nav>
      )}
    </header>
  );
};



END_OF_FILE_CONTENT
echo "Creating src/components/Hero.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/components/Hero.tsx"
import React from 'react';
import { cn } from '@/lib/utils';
import type { HeroData, BaseSectionSettings } from '@/types';

interface HeroProps {
  data: HeroData;
  settings?: BaseSectionSettings;
}

export const Hero: React.FC<HeroProps> = ({ data }) => {
  return (
    <section
      style={{
        '--local-bg': 'var(--background)',
        '--local-text': 'var(--foreground)',
        '--local-text-muted': 'var(--muted-foreground)',
        '--local-primary': 'var(--primary)',
        '--local-accent': 'var(--color-accent, #60a5fa)',
        '--local-cyan': 'var(--color-secondary, #22d3ee)',
        '--local-border': 'var(--border)',
      } as React.CSSProperties}
      className="jp-hero relative z-0 min-h-screen flex items-center overflow-hidden pt-24 bg-[var(--local-bg)]"
    >
      {/* Radial Gradient Overlays */}
      <div className="absolute -top-[40%] -right-[20%] w-[70vw] h-[70vw] rounded-full bg-[radial-gradient(circle,rgba(59,130,246,0.06)_0%,transparent_70%)] pointer-events-none" />
      <div className="absolute -bottom-[10%] -left-[10%] w-[50vw] h-[50vw] rounded-full bg-[radial-gradient(circle,rgba(34,211,238,0.03)_0%,transparent_60%)] pointer-events-none" />

      <div className="relative z-[2] max-w-[1200px] mx-auto px-8 w-full">
        <div className="max-w-[820px]">
          {/* Badge */}
          {data.badge && (
            <div className="inline-flex items-center gap-2 bg-[rgba(59,130,246,0.08)] border border-[rgba(59,130,246,0.2)] px-4 py-1.5 rounded-full text-[0.78rem] font-semibold text-[var(--local-accent)] mb-8 tracking-wide jp-animate-in">
              <span className="w-1.5 h-1.5 rounded-full bg-[var(--local-accent)] jp-pulse-dot" />
              {data.badge}
            </div>
          )}

          {/* Title */}
          <h1 className="font-display text-[clamp(2.8rem,6vw,4.8rem)] font-black text-[var(--local-text)] leading-[1.08] tracking-tight mb-6 jp-animate-in jp-d1">
            {data.title}
            {data.titleHighlight && (
              <>
                <br />
                <em className="not-italic bg-gradient-to-br from-[var(--local-accent)] to-[var(--local-cyan)] bg-clip-text text-transparent">
                  {data.titleHighlight}
                </em>
              </>
            )}
          </h1>

          {/* Description */}
          {data.description && (
            <p className="text-xl text-[var(--local-text-muted)] max-w-[600px] leading-relaxed mb-10 jp-animate-in jp-d2">
              {data.description}
            </p>
          )}

          {/* CTA Buttons */}
          {data.ctas && data.ctas.length > 0 && (
            <div className="flex gap-4 flex-wrap jp-animate-in jp-d3">
              {data.ctas.map((cta, idx) => (
                <a
                  key={idx}
                  href={cta.href}
                  className={cn(
                    "inline-flex items-center gap-2 px-8 py-3.5 rounded-[5px] font-semibold text-base transition-all duration-200 no-underline",
                    cta.variant === 'primary'
                      ? "bg-[var(--local-primary)] text-white hover:brightness-110 hover:-translate-y-0.5 hover:shadow-[0_8px_30px_rgba(59,130,246,0.3)]"
                      : "bg-transparent text-[var(--local-text)] border border-[rgba(255,255,255,0.12)] hover:border-[rgba(255,255,255,0.3)] hover:bg-[rgba(255,255,255,0.04)]"
                  )}
                >
                  {cta.label}
                </a>
              ))}
            </div>
          )}

          {/* Metrics */}
          {data.metrics && data.metrics.length > 0 && (
            <div className="flex gap-12 mt-16 pt-12 border-t border-[rgba(255,255,255,0.06)] flex-wrap jp-animate-in jp-d4">
              {data.metrics.map((metric, idx) => (
                <div key={idx}>
                  <div className="text-[2rem] font-bold text-[var(--local-text)] font-display">
                    {metric.val}
                  </div>
                  <div className="text-[0.82rem] text-[var(--muted-foreground)] mt-0.5 opacity-70">
                    {metric.label}
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>
    </section>
  );
};



END_OF_FILE_CONTENT
echo "Creating src/components/NotFound.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/components/NotFound.tsx"
import React from 'react';
import { Icon } from '@/lib/IconResolver';

export const NotFound: React.FC = () => {
  return (
    <div 
      style={{
        '--local-bg': 'var(--color-background)',
        '--local-text': 'var(--color-text)',
        '--local-text-muted': 'var(--color-text-muted)',
        '--local-primary': 'var(--color-primary)',
        '--local-radius-md': 'var(--radius-md)',
      } as React.CSSProperties}
      className="min-h-screen flex flex-col items-center justify-center bg-[var(--local-bg)] px-6"
    >
      <h1 className="text-6xl font-bold text-[var(--local-text)] mb-4">404</h1>
      <p className="text-xl text-[var(--local-text-muted)] mb-8">Page not found</p>
      <a
        href="/"
        className="inline-flex items-center gap-2 px-6 py-3 rounded-[var(--local-radius-md)] bg-[var(--local-primary)] text-[var(--local-bg)] font-semibold text-sm hover:opacity-90 transition-opacity"
      >
        <span>Back to Home</span>
        <Icon name="arrow-right" size={16} />
      </a>
    </div>
  );
};





END_OF_FILE_CONTENT
echo "Creating src/components/PaSection.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/components/PaSection.tsx"
import React from 'react';
import type { PaSectionData, BaseSectionSettings } from '@/types';

interface PaSectionProps {
  data: PaSectionData;
  settings?: BaseSectionSettings;
}

export const PaSection: React.FC<PaSectionProps> = ({ data }) => {
  return (
    <section
      style={{
        '--local-bg': 'var(--card)',
        '--local-text': 'var(--foreground)',
        '--local-text-muted': 'var(--muted-foreground)',
        '--local-primary': 'var(--primary)',
        '--local-accent': 'var(--color-accent, #60a5fa)',
        '--local-deep': 'var(--background)',
      } as React.CSSProperties}
      className="relative z-0 py-28 bg-[var(--local-bg)]"
    >
      {/* Top/Bottom dividers */}
      <div className="absolute top-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-[rgba(59,130,246,0.1)] to-transparent" />
      <div className="absolute bottom-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-[rgba(59,130,246,0.1)] to-transparent" />

      <div className="max-w-[1200px] mx-auto px-8">
        {data.label && (
          <div className="jp-section-label inline-flex items-center gap-2 text-[0.72rem] font-bold uppercase tracking-[0.12em] text-[var(--local-accent)] mb-4">
            <span className="w-5 h-px bg-[var(--local-primary)]" />
            {data.label}
          </div>
        )}
        <h2 className="font-display text-[clamp(2rem,4vw,3.2rem)] font-extrabold text-[var(--local-text)] leading-[1.15] tracking-tight mb-4">
          {data.title}
        </h2>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-16 items-center mt-12">
          {/* Text Content */}
          <div>
            <h3 className="text-2xl font-bold text-[var(--local-text)] mb-4">
              {data.subtitle}
            </h3>
            {data.paragraphs.map((p, idx) => (
              <p key={idx} className="text-[var(--local-text-muted)] mb-5 text-[1.05rem] leading-relaxed">
                {p.text}
              </p>
            ))}
            {data.badges && data.badges.length > 0 && (
              <div className="flex gap-2.5 flex-wrap mt-4">
                {data.badges.map((badge, idx) => (
                  <span
                    key={idx}
                    className="inline-flex items-center gap-1.5 bg-[rgba(34,197,94,0.08)] border border-[rgba(34,197,94,0.2)] text-[#4ade80] px-3 py-1.5 rounded-md text-[0.78rem] font-semibold"
                  >
                    {badge.label}
                  </span>
                ))}
              </div>
            )}
          </div>

          {/* Visual - Engine Switch */}
          <div className="border border-[rgba(255,255,255,0.06)] rounded-lg p-12 bg-[rgba(255,255,255,0.02)] text-center">
            {data.engines && data.engines.length >= 2 && (
              <div className="flex items-center justify-center gap-6 mb-8">
                {data.engines.map((engine, idx) => (
                  <React.Fragment key={idx}>
                    {idx > 0 && (
                      <span className="text-[var(--local-text-muted)] text-2xl opacity-50">⇄</span>
                    )}
                    <div className={
                      engine.variant === 'tailwind'
                        ? 'px-6 py-4 rounded-xl font-bold text-[0.95rem] border bg-[rgba(59,130,246,0.08)] border-[rgba(59,130,246,0.2)] text-[#60a5fa]'
                        : 'px-6 py-4 rounded-xl font-bold text-[0.95rem] border bg-[rgba(34,197,94,0.08)] border-[rgba(34,197,94,0.2)] text-[#4ade80]'
                    }>
                      {engine.label}
                    </div>
                  </React.Fragment>
                ))}
              </div>
            )}

            {data.codeSnippet && (
              <div className="font-mono text-[0.85rem] text-[var(--local-text-muted)] bg-[var(--local-deep)] p-4 rounded-lg text-left border border-[rgba(255,255,255,0.04)]">
                <pre className="whitespace-pre-wrap m-0">{data.codeSnippet}</pre>
                <div className="mt-4 text-[0.75rem] text-center opacity-50">
                  Same JSON. Different Render Engine.
                </div>
              </div>
            )}
          </div>
        </div>
      </div>
    </section>
  );
};



END_OF_FILE_CONTENT
echo "Creating src/components/Philosophy.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/components/Philosophy.tsx"
import React from 'react';
import type { PhilosophyData, BaseSectionSettings } from '@/types';

interface PhilosophyProps {
  data: PhilosophyData;
  settings?: BaseSectionSettings;
}

export const Philosophy: React.FC<PhilosophyProps> = ({ data }) => {
  /**
   * Renders the quote, highlighting occurrences of quoteHighlightWord
   * with the accent color. Pure rendering — no data manipulation beyond
   * splitting for visual emphasis.
   */
  const renderQuote = () => {
    if (!data.quoteHighlightWord) {
      return <>{data.quote}</>;
    }
    const parts = data.quote.split(data.quoteHighlightWord);
    return (
      <>
        {parts.map((part, idx) => (
          <React.Fragment key={idx}>
            {part}
            {idx < parts.length - 1 && (
              <em className="not-italic text-[var(--local-accent)]">
                {data.quoteHighlightWord}
              </em>
            )}
          </React.Fragment>
        ))}
      </>
    );
  };

  return (
    <section
      style={{
        '--local-bg': 'var(--background)',
        '--local-text': 'var(--foreground)',
        '--local-text-muted': 'var(--muted-foreground)',
        '--local-accent': 'var(--color-accent, #60a5fa)',
        '--local-primary': 'var(--primary)',
      } as React.CSSProperties}
      className="relative z-0 py-28 bg-[var(--local-bg)]"
    >
      <div className="max-w-[1200px] mx-auto px-8">
        <div className="max-w-[760px] mx-auto text-center">
          {data.label && (
            <div className="jp-section-label inline-flex items-center gap-2 text-[0.72rem] font-bold uppercase tracking-[0.12em] text-[var(--local-accent)] mb-4">
              <span className="w-5 h-px bg-[var(--local-primary)]" />
              {data.label}
            </div>
          )}
          <h2 className="font-display text-[clamp(2rem,4vw,3.2rem)] font-extrabold text-[var(--local-text)] leading-[1.15] tracking-tight mb-4">
            {data.title}
          </h2>

          {/* Quote */}
          <blockquote className="font-display text-[clamp(1.6rem,3vw,2.4rem)] text-[var(--local-text)] font-bold leading-[1.35] my-8">
            &ldquo;{renderQuote()}&rdquo;
          </blockquote>

          {/* Description */}
          {data.description && (
            <p className="text-[1.05rem] text-[var(--local-text-muted)] max-w-[560px] mx-auto leading-relaxed">
              {data.description}
            </p>
          )}
        </div>
      </div>
    </section>
  );
};



END_OF_FILE_CONTENT
echo "Creating src/components/PillarsGrid.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/components/PillarsGrid.tsx"
import React from 'react';
import { cn } from '@/lib/utils';
import type { PillarsGridData, BaseSectionSettings } from '@/types';

interface PillarsGridProps {
  data: PillarsGridData;
  settings?: BaseSectionSettings;
}

const iconVariantStyles: Record<string, string> = {
  split: 'bg-[rgba(59,130,246,0.1)] text-[#60a5fa]',
  registry: 'bg-[rgba(34,211,238,0.1)] text-[#22d3ee]',
  federation: 'bg-[rgba(168,85,247,0.1)] text-[#c084fc]',
};

const tagVariantStyles: Record<string, string> = {
  core: 'bg-[rgba(59,130,246,0.1)] text-[#60a5fa]',
  pattern: 'bg-[rgba(34,211,238,0.1)] text-[#22d3ee]',
  enterprise: 'bg-[rgba(168,85,247,0.1)] text-[#c084fc]',
};

export const PillarsGrid: React.FC<PillarsGridProps> = ({ data }) => {
  return (
    <section
      style={{
        '--local-bg': 'var(--background)',
        '--local-text': 'var(--foreground)',
        '--local-text-muted': 'var(--muted-foreground)',
        '--local-primary': 'var(--primary)',
        '--local-accent': 'var(--color-accent, #60a5fa)',
        '--local-border': 'var(--border)',
      } as React.CSSProperties}
      className="relative z-0 py-28 bg-[var(--local-bg)]"
    >
      {/* Top divider */}
      <div className="absolute top-0 left-1/2 -translate-x-1/2 w-[80%] h-px bg-gradient-to-r from-transparent via-[rgba(59,130,246,0.15)] to-transparent" />

      <div className="max-w-[1200px] mx-auto px-8">
        {/* Section Header */}
        {data.label && (
          <div className="jp-section-label inline-flex items-center gap-2 text-[0.72rem] font-bold uppercase tracking-[0.12em] text-[var(--local-accent)] mb-4">
            <span className="w-5 h-px bg-[var(--local-primary)]" />
            {data.label}
          </div>
        )}
        <h2 className="font-display text-[clamp(2rem,4vw,3.2rem)] font-extrabold text-[var(--local-text)] leading-[1.15] tracking-tight mb-4">
          {data.title}
        </h2>
        {data.description && (
          <p className="text-lg text-[var(--local-text-muted)] max-w-[600px] leading-relaxed">
            {data.description}
          </p>
        )}

        {/* Pillars Grid */}
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6 mt-14">
          {data.pillars.map((pillar, idx) => (
            <div
              key={idx}
              className="jp-pillar-card group relative border border-[rgba(255,255,255,0.06)] rounded-lg p-10 bg-[rgba(255,255,255,0.015)] transition-all duration-300 overflow-hidden hover:border-[rgba(59,130,246,0.2)] hover:-translate-y-1 hover:bg-[rgba(59,130,246,0.03)]"
            >
              {/* Top gradient bar */}
              <div className="absolute top-0 left-0 right-0 h-[3px] bg-gradient-to-r from-[var(--local-primary)] to-[#22d3ee] opacity-0 group-hover:opacity-100 transition-opacity duration-300" />

              {/* Icon */}
              <div className={cn(
                'w-12 h-12 rounded-xl flex items-center justify-center mb-6 text-xl font-bold',
                iconVariantStyles[pillar.iconVariant] || iconVariantStyles.split
              )}>
                {pillar.icon}
              </div>

              {/* Title */}
              <h3 className="text-xl font-bold text-[var(--local-text)] mb-3">
                {pillar.title}
              </h3>

              {/* Description */}
              <p className="text-[0.95rem] text-[var(--local-text-muted)] leading-relaxed">
                {pillar.description}
              </p>

              {/* Tag */}
              <span className={cn(
                'inline-block text-[0.7rem] font-semibold uppercase tracking-wide px-3 py-1 rounded mt-4',
                tagVariantStyles[pillar.tagVariant] || tagVariantStyles.core
              )}>
                {pillar.tag}
              </span>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
};



END_OF_FILE_CONTENT
echo "Creating src/components/ProblemStatement.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/components/ProblemStatement.tsx"
import React from 'react';
import { cn } from '@/lib/utils';
import type { ProblemStatementData, BaseSectionSettings } from '@/types';

interface ProblemStatementProps {
  data: ProblemStatementData;
  settings?: BaseSectionSettings;
}

const variantStyles: Record<string, string> = {
  red: 'bg-[rgba(239,68,68,0.08)] border-[rgba(239,68,68,0.3)] text-[#f87171]',
  amber: 'bg-[rgba(245,158,11,0.08)] border-[rgba(245,158,11,0.3)] text-[#fbbf24]',
  green: 'bg-[rgba(34,197,94,0.08)] border-[rgba(34,197,94,0.3)] text-[#4ade80]',
  blue: 'bg-[rgba(59,130,246,0.08)] border-[rgba(59,130,246,0.3)] text-[#60a5fa]',
};

export const ProblemStatement: React.FC<ProblemStatementProps> = ({ data }) => {
  return (
    <section
      style={{
        '--local-bg': 'var(--background)',
        '--local-surface': 'var(--card)',
        '--local-text': 'var(--foreground)',
        '--local-text-muted': 'var(--muted-foreground)',
        '--local-border': 'var(--border)',
      } as React.CSSProperties}
      className="jp-problem relative z-0 py-28 bg-gradient-to-b from-[var(--local-bg)] to-[var(--local-surface)]"
    >
      <div className="max-w-[1200px] mx-auto px-8">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-16 items-center">
          {/* Visual - Silo Blocks */}
          <div className="relative h-[360px] border border-[rgba(255,255,255,0.06)] rounded-lg bg-[rgba(255,255,255,0.02)] overflow-hidden flex items-center justify-center">
            <div className="text-center p-8">
              {data.siloGroups.map((group, gIdx) => (
                <div key={gIdx} className="mb-4">
                  <div className="flex flex-wrap justify-center gap-1.5">
                    {group.blocks.map((block, bIdx) => (
                      <span
                        key={bIdx}
                        className={cn(
                          'inline-block px-4 py-2 rounded-lg text-[0.8rem] font-semibold border',
                          variantStyles[block.variant] || variantStyles.blue
                        )}
                      >
                        {block.label}
                      </span>
                    ))}
                  </div>
                  <span className="text-[0.7rem] text-[var(--local-text-muted)] uppercase tracking-widest mt-2 block opacity-60">
                    {group.label}
                  </span>
                </div>
              ))}
            </div>
          </div>

          {/* Text Content */}
          <div>
            <h3 className="text-2xl font-bold text-[var(--local-text)] mb-4">
              {data.title}
            </h3>
            {data.paragraphs.map((p, idx) => (
              <p
                key={idx}
                className="text-[var(--local-text-muted)] mb-5 text-[1.05rem] leading-relaxed"
              >
                {p.isBold ? <strong className="text-[var(--local-text)]">{p.text}</strong> : p.text}
              </p>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
};



END_OF_FILE_CONTENT
echo "Creating src/components/ProductTriad.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/components/ProductTriad.tsx"
import React from 'react';
import { cn } from '@/lib/utils';
import type { ProductTriadData, BaseSectionSettings } from '@/types';

interface ProductTriadProps {
  data: ProductTriadData;
  settings?: BaseSectionSettings;
}

export const ProductTriad: React.FC<ProductTriadProps> = ({ data }) => {
  return (
    <section
      style={{
        '--local-bg': 'var(--background)',
        '--local-text': 'var(--foreground)',
        '--local-text-muted': 'var(--muted-foreground)',
        '--local-primary': 'var(--primary)',
        '--local-accent': 'var(--color-accent, #60a5fa)',
        '--local-border': 'var(--border)',
      } as React.CSSProperties}
      className="relative z-0 py-28 bg-[var(--local-bg)]"
    >
      <div className="max-w-[1200px] mx-auto px-8">
        {/* Section Header */}
        <div className="text-center">
          {data.label && (
            <div className="jp-section-label inline-flex items-center gap-2 text-[0.72rem] font-bold uppercase tracking-[0.12em] text-[var(--local-accent)] mb-4">
              <span className="w-5 h-px bg-[var(--local-primary)]" />
              {data.label}
            </div>
          )}
          <h2 className="font-display text-[clamp(2rem,4vw,3.2rem)] font-extrabold text-[var(--local-text)] leading-[1.15] tracking-tight mb-4">
            {data.title}
          </h2>
          {data.description && (
            <p className="text-lg text-[var(--local-text-muted)] max-w-[600px] mx-auto leading-relaxed">
              {data.description}
            </p>
          )}
        </div>

        {/* Product Cards */}
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6 mt-14">
          {data.products.map((product, idx) => (
            <div
              key={idx}
              className={cn(
                'relative border rounded-lg p-10 transition-all duration-300 hover:-translate-y-1',
                product.featured
                  ? 'border-[rgba(59,130,246,0.3)] bg-gradient-to-b from-[rgba(59,130,246,0.06)] to-[rgba(59,130,246,0.01)] hover:border-[rgba(59,130,246,0.4)]'
                  : 'border-[rgba(255,255,255,0.06)] bg-[rgba(255,255,255,0.015)] hover:border-[rgba(59,130,246,0.2)]'
              )}
            >
              {/* Featured Badge */}
              {product.featured && (
                <div className="absolute -top-3 left-1/2 -translate-x-1/2 bg-[var(--local-primary)] text-white text-[0.7rem] font-bold px-4 py-1 rounded-full uppercase tracking-wide">
                  Most Popular
                </div>
              )}

              {/* Tier */}
              <div className="text-[0.75rem] font-bold uppercase tracking-[0.1em] text-[var(--local-accent)] mb-2">
                {product.tier}
              </div>

              {/* Name */}
              <div className="text-2xl font-extrabold text-[var(--local-text)] mb-2">
                {product.name}
              </div>

              {/* Price */}
              <div className="font-display text-[2.2rem] font-extrabold text-[var(--local-text)] mb-1">
                {product.price}
                {product.priceSuffix && (
                  <span className="text-[0.9rem] font-normal text-[var(--local-text-muted)]">
                    {product.priceSuffix}
                  </span>
                )}
              </div>

              {/* Delivery */}
              <div className="text-[0.85rem] text-[var(--local-text-muted)] mb-6 pb-6 border-b border-[rgba(255,255,255,0.06)]">
                {product.delivery}
              </div>

              {/* Features */}
              <ul className="mb-8 space-y-0">
                {product.features.map((feature, fIdx) => (
                  <li
                    key={fIdx}
                    className="text-[0.9rem] text-[#cbd5e1] py-1.5 pl-6 relative before:content-['✓'] before:absolute before:left-0 before:text-[var(--local-accent)] before:font-bold before:text-[0.8rem]"
                  >
                    {feature.text}
                  </li>
                ))}
              </ul>

              {/* CTA */}
              {product.ctaLabel && product.ctaHref && (
                <a
                  href={product.ctaHref}
                  className={cn(
                    'block text-center py-3 rounded-[5px] no-underline font-semibold text-[0.95rem] transition-all duration-200',
                    product.ctaVariant === 'primary'
                      ? 'bg-[var(--local-primary)] text-white hover:brightness-110 hover:-translate-y-px'
                      : 'bg-[rgba(255,255,255,0.05)] text-[#e2e8f0] border border-[rgba(255,255,255,0.1)] hover:bg-[rgba(255,255,255,0.08)] hover:border-[rgba(255,255,255,0.2)]'
                  )}
                >
                  {product.ctaLabel}
                </a>
              )}
            </div>
          ))}
        </div>
      </div>
    </section>
  );
};



END_OF_FILE_CONTENT
mkdir -p "src/components/ui"
echo "Creating src/components/ui/checkbox.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/components/ui/checkbox.tsx"
"use client"

import * as React from "react"
import { Checkbox as CheckboxPrimitive } from "radix-ui"

import { cn } from "@/lib/utils"
import { CheckIcon } from "lucide-react"

function Checkbox({
  className,
  ...props
}: React.ComponentProps<typeof CheckboxPrimitive.Root>) {
  return (
    <CheckboxPrimitive.Root
      data-slot="checkbox"
      className={cn(
        "border-input dark:bg-input/30 data-checked:bg-primary data-checked:text-primary-foreground dark:data-checked:bg-primary data-checked:border-primary aria-invalid:aria-checked:border-primary aria-invalid:border-destructive dark:aria-invalid:border-destructive/50 focus-visible:border-ring focus-visible:ring-ring/50 aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 flex size-4 items-center justify-center rounded-[4px] border transition-colors group-has-disabled/field:opacity-50 focus-visible:ring-3 aria-invalid:ring-3 peer relative shrink-0 outline-none after:absolute after:-inset-x-3 after:-inset-y-2 disabled:cursor-not-allowed disabled:opacity-50",
        className
      )}
      {...props}
    >
      <CheckboxPrimitive.Indicator
        data-slot="checkbox-indicator"
        className="[&>svg]:size-3.5 grid place-content-center text-current transition-none"
      >
        <CheckIcon
        />
      </CheckboxPrimitive.Indicator>
    </CheckboxPrimitive.Root>
  )
}

export { Checkbox }





END_OF_FILE_CONTENT
echo "Creating src/components/ui/input.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/components/ui/input.tsx"
import * as React from "react"

import { cn } from "@/lib/utils"

function Input({ className, type, ...props }: React.ComponentProps<"input">) {
  return (
    <input
      type={type}
      data-slot="input"
      className={cn(
        "dark:bg-input/30 border-input focus-visible:border-ring focus-visible:ring-ring/50 aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive dark:aria-invalid:border-destructive/50 disabled:bg-input/50 dark:disabled:bg-input/80 h-8 rounded-lg border bg-transparent px-2.5 py-1 text-base transition-colors file:h-6 file:text-sm file:font-medium focus-visible:ring-3 aria-invalid:ring-3 md:text-sm file:text-foreground placeholder:text-muted-foreground w-full min-w-0 outline-none file:inline-flex file:border-0 file:bg-transparent disabled:pointer-events-none disabled:cursor-not-allowed disabled:opacity-50",
        className
      )}
      {...props}
    />
  )
}

export { Input }





END_OF_FILE_CONTENT
echo "Creating src/components/ui/label.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/components/ui/label.tsx"
import * as React from "react"
import { Label as LabelPrimitive } from "radix-ui"

import { cn } from "@/lib/utils"

function Label({
  className,
  ...props
}: React.ComponentProps<typeof LabelPrimitive.Root>) {
  return (
    <LabelPrimitive.Root
      data-slot="label"
      className={cn(
        "gap-2 text-sm leading-none font-medium group-data-[disabled=true]:opacity-50 peer-disabled:opacity-50 flex items-center select-none group-data-[disabled=true]:pointer-events-none peer-disabled:cursor-not-allowed",
        className
      )}
      {...props}
    />
  )
}

export { Label }





END_OF_FILE_CONTENT
echo "Creating src/components/ui/select.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/components/ui/select.tsx"
import * as React from "react"
import { Select as SelectPrimitive } from "radix-ui"

import { cn } from "@/lib/utils"
import { ChevronDownIcon, CheckIcon, ChevronUpIcon } from "lucide-react"

function Select({
  ...props
}: React.ComponentProps<typeof SelectPrimitive.Root>) {
  return <SelectPrimitive.Root data-slot="select" {...props} />
}

function SelectGroup({
  className,
  ...props
}: React.ComponentProps<typeof SelectPrimitive.Group>) {
  return (
    <SelectPrimitive.Group
      data-slot="select-group"
      className={cn("scroll-my-1 p-1", className)}
      {...props}
    />
  )
}

function SelectValue({
  ...props
}: React.ComponentProps<typeof SelectPrimitive.Value>) {
  return <SelectPrimitive.Value data-slot="select-value" {...props} />
}

function SelectTrigger({
  className,
  size = "default",
  children,
  ...props
}: React.ComponentProps<typeof SelectPrimitive.Trigger> & {
  size?: "sm" | "default"
}) {
  return (
    <SelectPrimitive.Trigger
      data-slot="select-trigger"
      data-size={size}
      className={cn(
        "border-input data-placeholder:text-muted-foreground dark:bg-input/30 dark:hover:bg-input/50 focus-visible:border-ring focus-visible:ring-ring/50 aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive dark:aria-invalid:border-destructive/50 gap-1.5 rounded-lg border bg-transparent py-2 pr-2 pl-2.5 text-sm transition-colors select-none focus-visible:ring-3 aria-invalid:ring-3 data-[size=default]:h-8 data-[size=sm]:h-7 data-[size=sm]:rounded-[min(var(--radius-md),10px)] *:data-[slot=select-value]:gap-1.5 [&_svg:not([class*='size-'])]:size-4 flex w-full items-center justify-between whitespace-nowrap outline-none disabled:cursor-not-allowed disabled:opacity-50 *:data-[slot=select-value]:line-clamp-1 *:data-[slot=select-value]:flex *:data-[slot=select-value]:items-center [&_svg]:pointer-events-none [&_svg]:shrink-0",
        className
      )}
      {...props}
    >
      {children}
      <SelectPrimitive.Icon asChild>
        <ChevronDownIcon className="text-muted-foreground size-4 pointer-events-none" />
      </SelectPrimitive.Icon>
    </SelectPrimitive.Trigger>
  )
}

function SelectContent({
  className,
  children,
  position = "popper",
  align = "center",
  ...props
}: React.ComponentProps<typeof SelectPrimitive.Content>) {
  return (
    <SelectPrimitive.Portal>
      <SelectPrimitive.Content
        data-slot="select-content"
        data-align-trigger={position === "item-aligned"}
        className={cn(
          "bg-popover text-popover-foreground data-open:animate-in data-closed:animate-out data-closed:fade-out-0 data-open:fade-in-0 data-closed:zoom-out-95 data-open:zoom-in-95 data-[side=bottom]:slide-in-from-top-2 data-[side=left]:slide-in-from-right-2 data-[side=right]:slide-in-from-left-2 data-[side=top]:slide-in-from-bottom-2 ring-foreground/10 min-w-36 rounded-lg shadow-md ring-1 duration-100 relative z-[110] max-h-(--radix-select-content-available-height) origin-(--radix-select-content-transform-origin) overflow-x-hidden overflow-y-auto data-[align-trigger=true]:animate-none", 
          position === "popper" && "data-[side=bottom]:translate-y-1 data-[side=left]:-translate-x-1 data-[side=right]:translate-x-1 data-[side=top]:-translate-y-1", 
          className 
        )}
        position={position}
        align={align}
        {...props}
      >
        <SelectScrollUpButton />
        <SelectPrimitive.Viewport
          data-position={position}
          className={cn(
            "p-1",
            position === "popper" && "h-(--radix-select-trigger-height) w-full min-w-(--radix-select-trigger-width)"
          )}
        >
          {children}
        </SelectPrimitive.Viewport>
        <SelectScrollDownButton />
      </SelectPrimitive.Content>
    </SelectPrimitive.Portal>
  )
}

function SelectLabel({
  className,
  ...props
}: React.ComponentProps<typeof SelectPrimitive.Label>) {
  return (
    <SelectPrimitive.Label
      data-slot="select-label"
      className={cn("text-muted-foreground px-1.5 py-1 text-xs", className)}
      {...props}
    />
  )
}

function SelectItem({
  className,
  children,
  ...props
}: React.ComponentProps<typeof SelectPrimitive.Item>) {
  return (
    <SelectPrimitive.Item
      data-slot="select-item"
      className={cn(
        "focus:bg-accent focus:text-accent-foreground not-data-[variant=destructive]:focus:**:text-accent-foreground gap-1.5 rounded-md py-1 pr-8 pl-1.5 text-sm [&_svg:not([class*='size-'])]:size-4 *:[span]:last:flex *:[span]:last:items-center *:[span]:last:gap-2 relative flex w-full cursor-default items-center outline-hidden select-none data-disabled:pointer-events-none data-disabled:opacity-50 [&_svg]:pointer-events-none [&_svg]:shrink-0",
        className
      )}
      {...props}
    >
      <span className="pointer-events-none absolute right-2 flex size-4 items-center justify-center">
        <SelectPrimitive.ItemIndicator>
          <CheckIcon className="pointer-events-none" />
        </SelectPrimitive.ItemIndicator>
      </span>
      <SelectPrimitive.ItemText>{children}</SelectPrimitive.ItemText>
    </SelectPrimitive.Item>
  )
}

function SelectSeparator({
  className,
  ...props
}: React.ComponentProps<typeof SelectPrimitive.Separator>) {
  return (
    <SelectPrimitive.Separator
      data-slot="select-separator"
      className={cn("bg-border -mx-1 my-1 h-px pointer-events-none", className)}
      {...props}
    />
  )
}

function SelectScrollUpButton({
  className,
  ...props
}: React.ComponentProps<typeof SelectPrimitive.ScrollUpButton>) {
  return (
    <SelectPrimitive.ScrollUpButton
      data-slot="select-scroll-up-button"
      className={cn("bg-popover z-10 flex cursor-default items-center justify-center py-1 [&_svg:not([class*='size-'])]:size-4", className)}
      {...props}
    >
      <ChevronUpIcon />
    </SelectPrimitive.ScrollUpButton>
  )
}

function SelectScrollDownButton({
  className,
  ...props
}: React.ComponentProps<typeof SelectPrimitive.ScrollDownButton>) {
  return (
    <SelectPrimitive.ScrollDownButton
      data-slot="select-scroll-down-button"
      className={cn("bg-popover z-10 flex cursor-default items-center justify-center py-1 [&_svg:not([class*='size-'])]:size-4", className)}
      {...props}
    >
      <ChevronDownIcon />
    </SelectPrimitive.ScrollDownButton>
  )
}

export {
  Select,
  SelectContent,
  SelectGroup,
  SelectItem,
  SelectLabel,
  SelectScrollDownButton,
  SelectScrollUpButton,
  SelectSeparator,
  SelectTrigger,
  SelectValue,
}




END_OF_FILE_CONTENT
echo "Creating src/components/ui/select.txt..."
cat << 'END_OF_FILE_CONTENT' > "src/components/ui/select.txt"
import * as React from "react"
import { Select as SelectPrimitive } from "radix-ui"

import { cn } from "@/lib/utils"
import { ChevronDownIcon, CheckIcon, ChevronUpIcon } from "lucide-react"

function Select({
  ...props
}: React.ComponentProps<typeof SelectPrimitive.Root>) {
  return <SelectPrimitive.Root data-slot="select" {...props} />
}

function SelectGroup({
  className,
  ...props
}: React.ComponentProps<typeof SelectPrimitive.Group>) {
  return (
    <SelectPrimitive.Group
      data-slot="select-group"
      className={cn("scroll-my-1 p-1", className)}
      {...props}
    />
  )
}

function SelectValue({
  ...props
}: React.ComponentProps<typeof SelectPrimitive.Value>) {
  return <SelectPrimitive.Value data-slot="select-value" {...props} />
}

function SelectTrigger({
  className,
  size = "default",
  children,
  ...props
}: React.ComponentProps<typeof SelectPrimitive.Trigger> & {
  size?: "sm" | "default"
}) {
  return (
    <SelectPrimitive.Trigger
      data-slot="select-trigger"
      data-size={size}
      className={cn(
        "border-input data-placeholder:text-muted-foreground dark:bg-input/30 dark:hover:bg-input/50 focus-visible:border-ring focus-visible:ring-ring/50 aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive dark:aria-invalid:border-destructive/50 gap-1.5 rounded-lg border bg-transparent py-2 pr-2 pl-2.5 text-sm transition-colors select-none focus-visible:ring-3 aria-invalid:ring-3 data-[size=default]:h-8 data-[size=sm]:h-7 data-[size=sm]:rounded-[min(var(--radius-md),10px)] *:data-[slot=select-value]:gap-1.5 [&_svg:not([class*='size-'])]:size-4 flex w-full items-center justify-between whitespace-nowrap outline-none disabled:cursor-not-allowed disabled:opacity-50 *:data-[slot=select-value]:line-clamp-1 *:data-[slot=select-value]:flex *:data-[slot=select-value]:items-center [&_svg]:pointer-events-none [&_svg]:shrink-0",
        className
      )}
      {...props}
    >
      {children}
      <SelectPrimitive.Icon asChild>
        <ChevronDownIcon className="text-muted-foreground size-4 pointer-events-none" />
      </SelectPrimitive.Icon>
    </SelectPrimitive.Trigger>
  )
}

function SelectContent({
  className,
  children,
  position = "popper",
  align = "center",
  ...props
}: React.ComponentProps<typeof SelectPrimitive.Content>) {
  return (
    <SelectPrimitive.Portal>
      <SelectPrimitive.Content
        data-slot="select-content"
        data-align-trigger={position === "item-aligned"}
        className={cn(
          "bg-popover text-popover-foreground data-open:animate-in data-closed:animate-out data-closed:fade-out-0 data-open:fade-in-0 data-closed:zoom-out-95 data-open:zoom-in-95 data-[side=bottom]:slide-in-from-top-2 data-[side=left]:slide-in-from-right-2 data-[side=right]:slide-in-from-left-2 data-[side=top]:slide-in-from-bottom-2 ring-foreground/10 min-w-36 rounded-lg shadow-md ring-1 duration-100 relative z-[110] max-h-(--radix-select-content-available-height) origin-(--radix-select-content-transform-origin) overflow-x-hidden overflow-y-auto data-[align-trigger=true]:animate-none", 
          position === "popper" && "data-[side=bottom]:translate-y-1 data-[side=left]:-translate-x-1 data-[side=right]:translate-x-1 data-[side=top]:-translate-y-1", 
          className 
        )}
        position={position}
        align={align}
        {...props}
      >
        <SelectScrollUpButton />
        <SelectPrimitive.Viewport
          data-position={position}
          className={cn(
            "p-1",
            position === "popper" && "h-(--radix-select-trigger-height) w-full min-w-(--radix-select-trigger-width)"
          )}
        >
          {children}
        </SelectPrimitive.Viewport>
        <SelectScrollDownButton />
      </SelectPrimitive.Content>
    </SelectPrimitive.Portal>
  )
}

function SelectLabel({
  className,
  ...props
}: React.ComponentProps<typeof SelectPrimitive.Label>) {
  return (
    <SelectPrimitive.Label
      data-slot="select-label"
      className={cn("text-muted-foreground px-1.5 py-1 text-xs", className)}
      {...props}
    />
  )
}

function SelectItem({
  className,
  children,
  ...props
}: React.ComponentProps<typeof SelectPrimitive.Item>) {
  return (
    <SelectPrimitive.Item
      data-slot="select-item"
      className={cn(
        "focus:bg-accent focus:text-accent-foreground not-data-[variant=destructive]:focus:**:text-accent-foreground gap-1.5 rounded-md py-1 pr-8 pl-1.5 text-sm [&_svg:not([class*='size-'])]:size-4 *:[span]:last:flex *:[span]:last:items-center *:[span]:last:gap-2 relative flex w-full cursor-default items-center outline-hidden select-none data-disabled:pointer-events-none data-disabled:opacity-50 [&_svg]:pointer-events-none [&_svg]:shrink-0",
        className
      )}
      {...props}
    >
      <span className="pointer-events-none absolute right-2 flex size-4 items-center justify-center">
        <SelectPrimitive.ItemIndicator>
          <CheckIcon className="pointer-events-none" />
        </SelectPrimitive.ItemIndicator>
      </span>
      <SelectPrimitive.ItemText>{children}</SelectPrimitive.ItemText>
    </SelectPrimitive.Item>
  )
}

function SelectSeparator({
  className,
  ...props
}: React.ComponentProps<typeof SelectPrimitive.Separator>) {
  return (
    <SelectPrimitive.Separator
      data-slot="select-separator"
      className={cn("bg-border -mx-1 my-1 h-px pointer-events-none", className)}
      {...props}
    />
  )
}

function SelectScrollUpButton({
  className,
  ...props
}: React.ComponentProps<typeof SelectPrimitive.ScrollUpButton>) {
  return (
    <SelectPrimitive.ScrollUpButton
      data-slot="select-scroll-up-button"
      className={cn("bg-popover z-10 flex cursor-default items-center justify-center py-1 [&_svg:not([class*='size-'])]:size-4", className)}
      {...props}
    >
      <ChevronUpIcon />
    </SelectPrimitive.ScrollUpButton>
  )
}

function SelectScrollDownButton({
  className,
  ...props
}: React.ComponentProps<typeof SelectPrimitive.ScrollDownButton>) {
  return (
    <SelectPrimitive.ScrollDownButton
      data-slot="select-scroll-down-button"
      className={cn("bg-popover z-10 flex cursor-default items-center justify-center py-1 [&_svg:not([class*='size-'])]:size-4", className)}
      {...props}
    >
      <ChevronDownIcon />
    </SelectPrimitive.ScrollDownButton>
  )
}

export {
  Select,
  SelectContent,
  SelectGroup,
  SelectItem,
  SelectLabel,
  SelectScrollDownButton,
  SelectScrollUpButton,
  SelectSeparator,
  SelectTrigger,
  SelectValue,
}




END_OF_FILE_CONTENT
echo "Creating src/components/ui/separator.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/components/ui/separator.tsx"
"use client"

import * as React from "react"
import { Separator as SeparatorPrimitive } from "radix-ui"

import { cn } from "@/lib/utils"

function Separator({
  className,
  orientation = "horizontal",
  decorative = true,
  ...props
}: React.ComponentProps<typeof SeparatorPrimitive.Root>) {
  return (
    <SeparatorPrimitive.Root
      data-slot="separator"
      decorative={decorative}
      orientation={orientation}
      className={cn(
        "bg-border shrink-0 data-horizontal:h-px data-horizontal:w-full data-vertical:w-px data-vertical:self-stretch",
        className
      )}
      {...props}
    />
  )
}

export { Separator }





END_OF_FILE_CONTENT
echo "Creating src/components/ui/textarea.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/components/ui/textarea.tsx"
import * as React from "react"

import { cn } from "@/lib/utils"

function Textarea({ className, ...props }: React.ComponentProps<"textarea">) {
  return (
    <textarea
      data-slot="textarea"
      className={cn(
        "border-input dark:bg-input/30 focus-visible:border-ring focus-visible:ring-ring/50 aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive dark:aria-invalid:border-destructive/50 disabled:bg-input/50 dark:disabled:bg-input/80 rounded-lg border bg-transparent px-2.5 py-2 text-base transition-colors focus-visible:ring-3 aria-invalid:ring-3 md:text-sm placeholder:text-muted-foreground flex field-sizing-content min-h-16 w-full outline-none disabled:cursor-not-allowed disabled:opacity-50",
        className
      )}
      {...props}
    />
  )
}

export { Textarea }





END_OF_FILE_CONTENT
mkdir -p "src/data"
mkdir -p "src/data/config"
echo "Creating src/data/config/menu.json..."
cat << 'END_OF_FILE_CONTENT' > "src/data/config/menu.json"
{
  "main": [
    { "label": "Architecture", "href": "#architecture" },
    { "label": "Products", "href": "#products" },
    { "label": "PA Ready", "href": "#pa-ready" },
    { "label": "Philosophy", "href": "#philosophy" }
  ]
}



END_OF_FILE_CONTENT
echo "Creating src/data/config/site.json..."
cat << 'END_OF_FILE_CONTENT' > "src/data/config/site.json"
{
  "identity": {
    "title": "JsonPages",
    "logoUrl": "/logo.svg"
  },
  "pages": [
    { "slug": "home", "label": "Home" },
    { "slug": "architecture", "label": "Architecture" },
    { "slug": "usage", "label": "Usage" }
  ],
  "header": {
    "id": "global-header",
    "type": "header",
    "data": {
      "logoText": "Json",
      "logoHighlight": "Pages",
      "logoIconText": "{ }",
      "links": [
        { "label": "Architecture", "href": "#architecture", "isCta": false },
        { "label": "Products", "href": "#products", "isCta": false },
        { "label": "PA Ready", "href": "#pa-ready", "isCta": false },
        { "label": "Philosophy", "href": "#philosophy", "isCta": false }
      ]
    },
    "settings": {
      "sticky": true
    }
  },
  "footer": {
    "id": "global-footer",
    "type": "footer",
    "data": {
      "brandText": "Json",
      "brandHighlight": "Pages",
      "copyright": "© 2026 JsonPages Ecosystem. Architected by Guido Filippo Serio.",
      "links": [
        { "label": "Documentation", "href": "#" },
        { "label": "API Reference", "href": "#" },
        { "label": "Changelog", "href": "#" },
        { "label": "Privacy", "href": "#" }
      ]
    },
    "settings": {
      "showLogo": true
    }
  }
}



END_OF_FILE_CONTENT
echo "Creating src/data/config/theme.json..."
cat << 'END_OF_FILE_CONTENT' > "src/data/config/theme.json"
{
  "name": "JsonPages Landing",
  "tokens": {
    "colors": {
      "primary": "#3b82f6",
      "secondary": "#22d3ee",
      "accent": "#60a5fa",
      "background": "#060d1b",
      "surface": "#0b1529",
      "surfaceAlt": "#101e38",
      "text": "#e2e8f0",
      "textMuted": "#94a3b8",
      "border": "#162a4d"
    },
    "typography": {
      "fontFamily": {
        "primary": "'Instrument Sans', system-ui, sans-serif",
        "mono": "'JetBrains Mono', monospace",
        "display": "'Playfair Display', Georgia, serif"
      }
    },
    "borderRadius": {
      "sm": "5px",
      "md": "7px",
      "lg": "8px"
    }
  }
}



END_OF_FILE_CONTENT
mkdir -p "src/data/pages"
echo "Creating src/data/pages/architecture.json..."
cat << 'END_OF_FILE_CONTENT' > "src/data/pages/architecture.json"
{
  "id": "architecture-page",
  "slug": "architecture",
  "meta": {
    "title": "Architecture | JsonPages",
    "description": "Deep dive into the JsonPages multi-tenant architecture."
  },
  "sections": [
    {
      "id": "arch-hero",
      "type": "hero",
      "data": {
        "badge": "Technical Docs",
        "title": "System Architecture",
        "description": "Understanding the layered architecture of JsonPages: from JSON data to rendered components."
      },
      "settings": {
        "align": "left",
        "padding": "xl"
      }
    },
    {
      "id": "arch-layers",
      "type": "feature-grid",
      "data": {
        "sectionTitle": "The Three Layers",
        "cards": [
          {
            "icon": "box",
            "title": "Data Layer",
            "description": "JSON files define content and configuration. Site.json for globals, [slug].json for page bodies."
          },
          {
            "icon": "box",
            "title": "Registry Layer",
            "description": "MTRP maps section types to React components. No switch statements, pure registry lookup."
          },
          {
            "icon": "box",
            "title": "Render Layer",
            "description": "PageRenderer assembles the Sandwich: Header + Body Sections + Footer."
          }
        ]
      },
      "settings": {
        "columns": 3,
        "cardStyle": "bordered"
      }
    }
  ]
}





END_OF_FILE_CONTENT
echo "Creating src/data/pages/home.json..."
cat << 'END_OF_FILE_CONTENT' > "src/data/pages/home.json"
{
  "id": "home-page",
  "slug": "home",
  "meta": {
    "title": "JsonPages — Global Authoring. Global Governance.",
    "description": "A high-fidelity Site Factory that solves the scalability bottleneck of traditional CMS systems."
  },
  "sections": [
    {
      "id": "hero-main",
      "type": "hero",
      "data": {
        "badge": "Composable UI Engine · SaaS v1.4",
        "title": "Global Authoring.",
        "titleHighlight": "Global Governance.",
        "description": "JsonPages is a high-fidelity Site Factory that solves the scalability bottleneck of traditional CMS systems. Distribute, govern, and render UI components across hundreds of independent sites — without technical drift.",
        "ctas": [
          { "label": "Explore Products →", "href": "#products", "variant": "primary" },
          { "label": "Read the Spec", "href": "#architecture", "variant": "secondary" }
        ],
        "metrics": [
          { "val": "100+", "label": "Pages per tenant" },
          { "val": "0ms", "label": "Runtime overhead" },
          { "val": "∞", "label": "Scalable blocks" }
        ]
      },
      "settings": {}
    },
    {
      "id": "problem-statement",
      "type": "problem-statement",
      "data": {
        "siloGroups": [
          {
            "blocks": [
              { "label": "Agency A Stack", "variant": "red" },
              { "label": "Custom CMS", "variant": "red" },
              { "label": "PHP Backend", "variant": "red" }
            ],
            "label": "Silo #1"
          },
          {
            "blocks": [
              { "label": "Agency B Tools", "variant": "amber" },
              { "label": "WordPress", "variant": "amber" },
              { "label": "LAMP Stack", "variant": "amber" }
            ],
            "label": "Silo #2"
          },
          {
            "blocks": [
              { "label": "Agency C Kit", "variant": "green" },
              { "label": "React App", "variant": "green" },
              { "label": "Node.js", "variant": "green" }
            ],
            "label": "Silo #3"
          }
        ],
        "title": "Traditional CMS systems create closed silos.",
        "paragraphs": [
          {
            "text": "When global brands delegate web projects to multiple agencies, each agency picks its own stack, its own conventions, its own deployment pipeline. The result is a portfolio of ungovernable sites with inconsistent quality and unpredictable maintenance costs.",
            "isBold": false
          },
          {
            "text": "JsonPages eliminates this by providing a centralized protocol to distribute, govern, and render UI components — ensuring every site, regardless of who builds it, conforms to a single typed ontology.",
            "isBold": true
          }
        ]
      },
      "settings": {}
    },
    {
      "id": "architecture-pillars",
      "type": "pillars-grid",
      "data": {
        "anchorId": "architecture",
        "label": "Core Architecture",
        "title": "Three Pillars of Composability",
        "description": "A contract-first architecture designed to scale without core refactoring.",
        "pillars": [
          {
            "icon": "⟐",
            "iconVariant": "split",
            "title": "The Machine-Readable Blueprint. 📐",
            "description": "We enforce a strict file-system ontology that physically separates Global Governance from Local Content. By utilizing \"Dumb Components\" (CIP), we create a deterministic environment where the UI is a predictable function of data. This protocol allows AI agents to understand your site structure instantly, eliminating the \"guessing game\" of traditional web development.",
            "tag": "The Foundation",
            "tagVariant": "core"
          },
          {
            "icon": "⬡",
            "iconVariant": "registry",
            "title": "The Semantic Brain. 🧠",
            "description": "We reject hardcoded Union Types. The Kernel defines an open registry where independent modules inject their DNA via Zod schemas. This provides the AI with a precise, type-safe vocabulary to build brand-compliant interfaces. Because the registry is the Single Source of Truth, the AI knows exactly which components exist and how to configure them without ever touching the core code.",
            "tag": "The Vocabulary",
            "tagVariant": "pattern"
          },
          {
            "icon": "◈",
            "iconVariant": "federation",
            "title": "The 5-Minute Tenant. 🤖",
            "description": "AI doesn't guess; it follows the Protocol. Because our ecosystem is governed by 5 deterministic standards, agents like Claude can project a complex, multi-page, brand-compliant tenant in under 5 minutes. The result is 100% Type-Safe JSON that perfectly matches your schemas, delivering a production-ready site with zero technical drift and an instant polymorphic CMS.",
            "tag": "The Multiplier",
            "tagVariant": "enterprise"
          }
        ]
      },
      "settings": {}
    },
    {
      "id": "layered-architecture",
      "type": "arch-layers",
      "data": {
        "anchorId": "layers",
        "label": "Engineering Layers",
        "title": "Strict Boundaries. Clean Contracts.",
        "description": "Three architectural layers maintain the separation between engine and implementation.",
        "layers": [
          {
            "number": "0",
            "layerLevel": "l0",
            "title": "The Immutable Kernel",
            "description": "Defines the base structure of a Section — ID, Type, Payload, Settings — and exports the computed union. Zero knowledge of UI implementation or business logic."
          },
          {
            "number": "1",
            "layerLevel": "l1",
            "title": "The Standard Library",
            "description": "Fundamental components (Hero, Text, Grid) used across 90% of projects. Augments the Kernel's registry while remaining part of the internal ecosystem."
          },
          {
            "number": "2",
            "layerLevel": "l2",
            "title": "User-Land Extensions",
            "description": "The enabling layer. Third-party developers define specialized blocks — StockTickers, CRM Forms — in their own repositories. These extensions plug into the Kernel at compile-time."
          }
        ],
        "codeFilename": "libs/shared-data/src/lib/core.ts",
        "codeLines": [
          { "content": "// 🛡️ KERNEL — Single Source of Truth", "tokenType": "comment" },
          { "content": "", "tokenType": "plain" },
          { "content": "export interface SectionDataRegistry {", "tokenType": "keyword" },
          { "content": "  // Open Registry: modules inject here", "tokenType": "comment" },
          { "content": "}", "tokenType": "plain" },
          { "content": "", "tokenType": "plain" },
          { "content": "export interface BaseSection<K extends keyof SectionDataRegistry> {", "tokenType": "keyword" },
          { "content": "  id: string;", "tokenType": "type" },
          { "content": "  type: K;", "tokenType": "type" },
          { "content": "  data: SectionDataRegistry[K];", "tokenType": "type" },
          { "content": "  settings?: SectionSettings;", "tokenType": "type" },
          { "content": "}", "tokenType": "plain" },
          { "content": "", "tokenType": "plain" },
          { "content": "// Computed Union — built automatically from registry", "tokenType": "comment" },
          { "content": "export type Section =", "tokenType": "keyword" },
          { "content": "  { [K in keyof SectionDataRegistry]: BaseSection<K> }", "tokenType": "type" },
          { "content": "  [keyof SectionDataRegistry];", "tokenType": "operator" }
        ]
      },
      "settings": {}
    },
    {
      "id": "product-triad",
      "type": "product-triad",
      "data": {
        "anchorId": "products",
        "label": "Product Triad",
        "title": "One Protocol. Three Products.",
        "description": "From solo developers to global enterprises — the same underlying ontology powers every tier.",
        "products": [
          {
            "tier": "Starter",
            "name": "JsonPage",
            "price": "NPM",
            "priceSuffix": "Local Install",
            "delivery": "Static Export · Zero Runtime",
            "features": [
              { "text": "Local Authoring SDK" },
              { "text": "Zero-Runtime HTML Bake" },
              { "text": "Pure HTML/CSS Export" },
              { "text": "CDN-Ready Delivery" },
              { "text": "Full Code Ownership" }
            ],
            "featured": false
          },
          {
            "tier": "Professional",
            "name": "JsonPages",
            "price": "SaaS",
            "priceSuffix": "/month",
            "delivery": "Managed Cloud · Multi-Tenant",
            "features": [
              { "text": "Multi-Tenant Hosting" },
              { "text": "Premium Block Library" },
              { "text": "SchemaUI Components" },
              { "text": "In-Context Editing" },
              { "text": "AI-Native Protocol" },
              { "text": "Tailwind v4 & BI Engine" }
            ],
            "featured": false
          },
          {
            "tier": "Enterprise",
            "name": "The Platform",
            "price": "Custom",
            "delivery": "Private Cloud · Enterprise Governance",
            "features": [
              { "text": "Private Federated Registry" },
              { "text": "Module Federation" },
              { "text": "Runtime Component Injection" },
              { "text": "Custom Brand Guidelines" },
              { "text": "Dedicated SLA & Support" },
              { "text": "SSO & RBAC" }
            ],
            "featured": false
          }
        ]
      },
      "settings": {}
    },
    {
      "id": "pa-ready",
      "type": "pa-section",
      "data": {
        "anchorId": "pa-ready",
        "label": "Public Sector",
        "title": "PA Ready — One Platform, Two Markets",
        "subtitle": "The Only Builder with Native Bootstrap Italia.",
        "paragraphs": [
          {
            "text": "By switching the rendering engine to Bootstrap Italia, System Integrators use the same high-efficiency workflow to deliver WCAG-compliant sites for Municipalities and Government bodies — without rewriting backend logic."
          },
          {
            "text": "The same JSON ontology drives both the Tailwind-powered private sector and the Bootstrap Italia public sector pipeline. This is not flexibility — this is Business Continuity."
          }
        ],
        "badges": [
          { "label": "PNRR Ready" },
          { "label": "WCAG 2.1 AA" },
          { "label": "AgID Compliant" }
        ],
        "engines": [
          { "label": "Tailwind v4", "variant": "tailwind" },
          { "label": "Bootstrap Italia", "variant": "bootstrap" }
        ],
        "codeSnippet": "{\n  \"type\": \"hero\",\n  \"data\": { \"title\": \"...\" },\n  \"settings\": { \"engine\": \"auto\" }\n}"
      },
      "settings": {}
    },
    {
      "id": "philosophy",
      "type": "philosophy",
      "data": {
        "anchorId": "philosophy",
        "label": "Our Philosophy",
        "title": "Governance Over Captivity",
        "quote": "We sell the infrastructure to manage UI — not the right to access the code.",
        "quoteHighlightWord": "manage",
        "description": "Unlike closed-garden platforms, JsonPages provides an Eject Button by design. The Bake Engine exports your site as pure HTML/CSS with zero backend requirements. If you leave the SaaS, the shared ontology and SDK ensure you remain fully operational and independent. We earn your loyalty through value — not lock-in."
      },
      "settings": {}
    },
    {
      "id": "cta-final",
      "type": "cta-banner",
      "data": {
        "anchorId": "start",
        "label": "Local Authoring Global Governance",
        "title": "Ready to Govern at Scale?",
        "description": "Whether you're building a single site or managing a portfolio of hundreds — JsonPages scales with your ambition."
      },
      "settings": {}
    }
  ]
}



END_OF_FILE_CONTENT
echo "Creating src/data/pages/usage.json..."
cat << 'END_OF_FILE_CONTENT' > "src/data/pages/usage.json"
{
  "id": "usage-page",
  "slug": "usage",
  "meta": {
    "title": "Usage | JsonPages",
    "description": "How to use JsonPages to build your site."
  },
  "sections": [
    {
      "id": "usage-hero",
      "type": "hero",
      "data": {
        "badge": "Getting Started",
        "title": "Usage Guide",
        "description": "Learn how to create pages, add sections, and customize your JsonPages site."
      },
      "settings": {
        "align": "left",
        "padding": "xl"
      }
    },
    {
      "id": "usage-steps",
      "type": "feature-grid",
      "data": {
        "sectionTitle": "Quick Start",
        "cards": [
          {
            "icon": "box",
            "emoji": "1️⃣",
            "title": "Define Your Page",
            "description": "Create a JSON file in /data/pages/ with meta info and sections array."
          },
          {
            "icon": "box",
            "emoji": "2️⃣",
            "title": "Register the Route",
            "description": "Add the page slug to site.json pages array and menu.json for navigation."
          },
          {
            "icon": "box",
            "emoji": "3️⃣",
            "title": "Add Sections",
            "description": "Use registered section types: hero, feature-grid, code-block. Each with data and settings."
          }
        ]
      },
      "settings": {
        "columns": 3,
        "cardStyle": "bordered"
      }
    },
    {
      "id": "usage-code",
      "type": "code-block",
      "data": {
        "label": "EXAMPLE SECTION",
        "lines": [
          { "content": "// In your [slug].json file:", "isComment": true },
          { "content": "{" },
          { "content": "  \"id\": \"my-hero\"," },
          { "content": "  \"type\": \"hero\"," },
          { "content": "  \"data\": { \"title\": \"Hello World\" }," },
          { "content": "  \"settings\": { \"align\": \"center\" }" },
          { "content": "}" }
        ]
      },
      "settings": {
        "showLineNumbers": true
      }
    }
  ]
}





END_OF_FILE_CONTENT
mkdir -p "src/hooks"
echo "Creating src/hooks/useDocumentMeta.ts..."
cat << 'END_OF_FILE_CONTENT' > "src/hooks/useDocumentMeta.ts"
import { useEffect } from 'react';
import type { PageMeta } from '@/types';

export const useDocumentMeta = (meta: PageMeta): void => {
  useEffect(() => {
    // Set document title
    document.title = meta.title;

    // Set or update meta description
    let metaDescription = document.querySelector('meta[name="description"]');
    if (!metaDescription) {
      metaDescription = document.createElement('meta');
      metaDescription.setAttribute('name', 'description');
      document.head.appendChild(metaDescription);
    }
    metaDescription.setAttribute('content', meta.description);
  }, [meta.title, meta.description]);
};





END_OF_FILE_CONTENT
echo "Creating src/index.css..."
cat << 'END_OF_FILE_CONTENT' > "src/index.css"
@import "tailwindcss";

@source "./**/*.tsx";

@theme {
  /* 
     🎯 MASTER MAPPING (V2.7 Landing) 
  */
  --color-background: var(--background);
  --color-foreground: var(--foreground);

  --color-card: var(--card);
  --color-card-foreground: var(--card-foreground);

  --color-primary: var(--primary);
  --color-primary-foreground: var(--primary-foreground);

  --color-secondary: var(--secondary);
  --color-secondary-foreground: var(--secondary-foreground);

  --color-muted: var(--muted);
  --color-muted-foreground: var(--muted-foreground);

  --color-accent: var(--accent);
  --color-border: var(--border);
  
  --radius-lg: var(--radius);
  --radius-md: calc(var(--radius) - 2px);
  --radius-sm: calc(var(--radius) - 4px);

  --font-primary: var(--theme-font-primary);
  --font-mono: var(--theme-font-mono);

  /* 
     🔧 DISPLAY FONT — Forward-compatible workaround
     theme-manager.ts does NOT inject --theme-font-display (Skeleton v2.7 gap).
     The var() falls through to the hardcoded fallback today.
     When Skeleton v2.8 wires display into theme-manager, the var() will resolve
     automatically and the fallback becomes dead code.
  */
  --font-display: var(--theme-font-display, 'Playfair Display', Georgia, serif);
}

/* 
   🌍 TENANT BRAND TOKENS (JSP 1.5)
*/
:root {
  --background: var(--theme-background);
  --foreground: var(--theme-text);
  --card: var(--theme-surface);
  --card-foreground: var(--theme-text);
  --primary: var(--theme-primary);
  --primary-foreground: oklch(0.98 0 0);
  --secondary: var(--theme-secondary);
  --secondary-foreground: var(--theme-text);
  --muted: var(--theme-surface-alt);
  --muted-foreground: var(--theme-text-muted);
  --border: var(--theme-border);
  --radius: 0.45rem;

  /* 
     🔧 ACCENT CHAIN — Forward-compatible workaround
     theme-manager.ts already injects --theme-accent on :root,
     but the original index.css never bridged it into the semantic layer.
     This closes the gap: --theme-accent → --accent → --color-accent.
     Falls back to --theme-primary if accent is undefined.
  */
  --accent: var(--theme-accent, var(--theme-primary));
}

@layer base {
  * { border-color: var(--border); }
  body {
    background-color: var(--background);
    color: var(--foreground);
    font-family: var(--font-primary);
    line-height: 1.7;
    overflow-x: hidden;
    @apply antialiased;
  }
}

/* ==========================================================================
   FONT DISPLAY UTILITY
   Maps .font-display class to the display font family (Playfair Display)
   ========================================================================== */
.font-display {
  font-family: var(--font-display, var(--font-primary));
}

/* ==========================================================================
   LANDING ANIMATIONS
   ========================================================================== */
@keyframes jp-fadeUp {
  from { opacity: 0; transform: translateY(30px); }
  to { opacity: 1; transform: translateY(0); }
}

@keyframes jp-pulseDot {
  0%, 100% { opacity: 1; }
  50% { opacity: 0.3; }
}

.jp-animate-in {
  opacity: 0;
  animation: jp-fadeUp 0.7s ease forwards;
}
.jp-d1 { animation-delay: 0.1s; }
.jp-d2 { animation-delay: 0.2s; }
.jp-d3 { animation-delay: 0.3s; }
.jp-d4 { animation-delay: 0.4s; }
.jp-d5 { animation-delay: 0.5s; }

.jp-pulse-dot {
  animation: jp-pulseDot 2s ease infinite;
}

/* ==========================================================================
   SMOOTH SCROLL
   ========================================================================== */
html {
  scroll-behavior: smooth;
}



END_OF_FILE_CONTENT
mkdir -p "src/lib"
mkdir -p "src/lib"
echo "Creating src/lib/ComponentRegistry.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/lib/ComponentRegistry.tsx"
import React from 'react';
import { Header } from '@/components/Header';
import { Footer } from '@/components/Footer';
import { Hero } from '@/components/Hero';
import { FeatureGrid } from '@/components/FeatureGrid';
import { CodeBlock } from '@/components/CodeBlock';
import { ProblemStatement } from '@/components/ProblemStatement';
import { PillarsGrid } from '@/components/PillarsGrid';
import { ArchLayers } from '@/components/ArchLayers';
import { ProductTriad } from '@/components/ProductTriad';
import { PaSection } from '@/components/PaSection';
import { Philosophy } from '@/components/Philosophy';
import { CtaBanner } from '@/components/CtaBanner';
import type { SectionType } from './kernel';

// eslint-disable-next-line @typescript-eslint/no-explicit-any
type AnyComponent = React.FC<any>;

export const ComponentRegistry: Record<SectionType, AnyComponent> = {
  'header': Header,
  'footer': Footer,
  'hero': Hero,
  'feature-grid': FeatureGrid,
  'code-block': CodeBlock,
  'problem-statement': ProblemStatement,
  'pillars-grid': PillarsGrid,
  'arch-layers': ArchLayers,
  'product-triad': ProductTriad,
  'pa-section': PaSection,
  'philosophy': Philosophy,
  'cta-banner': CtaBanner,
};



END_OF_FILE_CONTENT
echo "Creating src/lib/ConfigContext.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/lib/ConfigContext.tsx"
/**
 * Inversion of Control: registry and schemas are provided by the Engine from Tenant config.
 * SectionRenderer and AdminSidebar consume these; they do not import ComponentRegistry or SECTION_SCHEMAS.
 */
import React, { createContext, useContext } from 'react';
import type { JsonPagesConfig } from './types-engine';

type Registry = JsonPagesConfig['registry'];
type Schemas = JsonPagesConfig['schemas'];

interface ConfigContextValue {
  registry: Registry;
  schemas: Schemas;
}

const ConfigContext = createContext<ConfigContextValue | undefined>(undefined);

export const ConfigProvider: React.FC<{ config: Pick<JsonPagesConfig, 'registry' | 'schemas'>; children: React.ReactNode }> = ({
  config,
  children,
}) => (
  <ConfigContext.Provider value={{ registry: config.registry, schemas: config.schemas }}>
    {children}
  </ConfigContext.Provider>
);

export function useConfig(): ConfigContextValue {
  const ctx = useContext(ConfigContext);
  if (ctx === undefined) {
    throw new Error('useConfig must be used within ConfigProvider');
  }
  return ctx;
}

END_OF_FILE_CONTENT
echo "Creating src/lib/DefaultNotFound.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/lib/DefaultNotFound.tsx"
/**
 * Default 404 used by the Engine when no NotFoundComponent is provided in config.
 * No dependency on src/components (e.g. IconResolver); safe for NPM package.
 */
import React from 'react';

export const DefaultNotFound: React.FC = () => (
  <div
    style={
      {
        '--local-bg': 'var(--color-background)',
        '--local-text': 'var(--color-text)',
        '--local-text-muted': 'var(--color-text-muted)',
        '--local-primary': 'var(--color-primary)',
        '--local-radius-md': 'var(--radius-md)',
      } as React.CSSProperties
    }
    className="min-h-screen flex flex-col items-center justify-center bg-[var(--local-bg)] px-6"
  >
    <h1 className="text-6xl font-bold text-[var(--local-text)] mb-4">404</h1>
    <p className="text-xl text-[var(--local-text-muted)] mb-8">Page not found</p>
    <a
      href="/"
      className="inline-flex items-center gap-2 px-6 py-3 rounded-[var(--local-radius-md)] bg-[var(--local-primary)] text-[var(--local-bg)] font-semibold text-sm hover:opacity-90 transition-opacity"
    >
      Back to Home
    </a>
  </div>
);

END_OF_FILE_CONTENT
echo "Creating src/lib/IconResolver.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/lib/IconResolver.tsx"
import React from 'react';
import {
  Layers,
  Github,
  ArrowRight,
  Box,
  Terminal,
  ChevronRight,
  Menu,
  X,
  type LucideIcon
} from 'lucide-react';

const iconMap: Record<string, LucideIcon> = {
  'layers': Layers,
  'github': Github,
  'arrow-right': ArrowRight,
  'box': Box,
  'terminal': Terminal,
  'chevron-right': ChevronRight,
  'menu': Menu,
  'x': X,
};

interface IconProps {
  name: string;
  size?: number;
  className?: string;
}

export const Icon: React.FC<IconProps> = ({ name, size = 20, className }) => {
  const IconComponent = iconMap[name];

  if (!IconComponent) {
    if (import.meta.env.DEV) {
      console.warn(`[IconResolver] Unknown icon: "${name}". Add it to iconMap.`);
    }
    return null;
  }

  return <IconComponent size={size} className={className} />;
};

export type IconName = keyof typeof iconMap;



END_OF_FILE_CONTENT
echo "Creating src/lib/JsonPagesEngine.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/lib/JsonPagesEngine.tsx"
/**
 * Sovereign Shell: routing, state, and Admin layout live in the Engine.
 * The Core does not import from src/components or src/data; it receives everything via config.
 */
import React, { useEffect, useState, useCallback } from 'react';
import { BrowserRouter, Routes, Route, useParams } from 'react-router-dom';
import { PageRenderer } from '@/lib/PageRenderer';
import { StudioProvider } from '@/lib/StudioContext';
import { ConfigProvider } from '@/lib/ConfigContext';
import { ThemeLoader } from '@/lib/ThemeLoader';
import { AdminSidebar } from '@/admin/AdminSidebar';
import { ControlBar } from '@/admin/ControlBar';
import { StudioStage } from '@/admin/StudioStage';
import { PreviewEntry } from '@/admin/PreviewEntry';
import { DefaultNotFound } from '@/lib/DefaultNotFound';
import { themeManager } from '@/utils/theme-manager';
import { STUDIO_EVENTS } from '@/lib/events';
import { exportProjectJSON, exportBakedHTML } from '@/lib/persistence';
import type { JsonPagesConfig, ProjectState } from '@/lib/types-engine';
import type { PageConfig, SiteConfig } from './kernel';

// @ts-expect-error Vite ?inline returns raw CSS string
import defaultAdminCss from '../admin/admin-skin.css?inline';

export interface JsonPagesEngineProps {
  config: JsonPagesConfig;
}

export function JsonPagesEngine({ config }: JsonPagesEngineProps) {
  const {
    registry,
    schemas,
    pages: pageRegistry,
    siteConfig,
    themeConfig,
    menuConfig,
    themeCss,
    NotFoundComponent = DefaultNotFound,
  } = config;

  const persistence = {
    exportJSON: config.persistence?.exportJSON ?? exportProjectJSON,
    exportHTML: config.persistence?.exportHTML ?? exportBakedHTML,
  };

  const tenantCss = themeCss.tenant;
  const adminCss = themeCss.admin ?? defaultAdminCss;

  const [isReady, setIsReady] = useState(false);
  useEffect(() => {
    themeManager.setTheme(themeConfig);
    setIsReady(true);
  }, [themeConfig]);

  const VisitorView: React.FC = () => {
    const { slug = 'home' } = useParams<{ slug: string }>();
    const [bakedState, setBakedState] = useState<ProjectState | null>(null);

    useEffect(() => {
      const bakedScript = document.getElementById('jp-baked-state');
      if (bakedScript?.textContent) {
        try {
          const state = JSON.parse(bakedScript.textContent) as ProjectState;
          setBakedState(state);
          themeManager.setTheme(state.theme);
        } catch (e) {
          console.error('Failed to parse baked state', e);
        }
      }
    }, []);

    const pageConfig = bakedState ? bakedState.page : pageRegistry[slug];
    const activeSiteConfig = bakedState ? bakedState.site : siteConfig;
    const activeMenuConfig = bakedState ? bakedState.menu : menuConfig;

    if (!pageConfig) return <NotFoundComponent />;

    return (
      <ThemeLoader mode="tenant" tenantCss={tenantCss} adminCss={adminCss}>
        <StudioProvider mode="visitor">
          <PageRenderer
            pageConfig={pageConfig}
            siteConfig={activeSiteConfig}
            menuConfig={activeMenuConfig}
          />
        </StudioProvider>
      </ThemeLoader>
    );
  };

  const StudioView: React.FC = () => {
    const { slug = 'home' } = useParams<{ slug: string }>();
    const [draft, setDraft] = useState<PageConfig | null>(null);
    const [hasChanges, setHasChanges] = useState(false);
    const [globalDraft, setGlobalDraft] = useState<SiteConfig>(() => {
      const base = JSON.parse(JSON.stringify(siteConfig)) as SiteConfig;
      if (base.header?.data) {
        base.header.data.links = JSON.parse(JSON.stringify(menuConfig.main)) as SiteConfig['header']['data']['links'];
      }
      return base;
    });
    const [selected, setSelected] = useState<{ id: string; type: string; scope: string } | null>(null);

    useEffect(() => {
      const data = pageRegistry[slug];
      if (data) setDraft(JSON.parse(JSON.stringify(data)));
      setSelected(null);
      setHasChanges(false);
    }, [slug, pageRegistry]);

    const handleBakeResponse = useCallback(
      (event: MessageEvent) => {
        if (event.origin !== window.location.origin) return;
        if (event.data.type === STUDIO_EVENTS.SECTION_SELECT) {
          setSelected(event.data.section);
        }
        if (event.data.type === STUDIO_EVENTS.SEND_CLEAN_HTML) {
          if (!draft) return;
          const projectState: ProjectState = {
            page: draft,
            site: globalDraft,
            menu: { main: globalDraft.header?.data?.links ?? [] },
            theme: themeConfig,
          };
          persistence.exportHTML(projectState, slug, event.data.html);
          setHasChanges(false);
        }
      },
      [draft, globalDraft, slug, themeConfig]
    );

    useEffect(() => {
      window.addEventListener('message', handleBakeResponse);
      return () => window.removeEventListener('message', handleBakeResponse);
    }, [handleBakeResponse]);

    const handleUpdate = (newData: Record<string, unknown>) => {
      if (!selected || !draft) return;
      setHasChanges(true);
      if (selected.scope === 'global') {
        if (selected.type === 'header') {
          setGlobalDraft({ ...globalDraft, header: { ...globalDraft.header!, data: newData } });
        } else if (selected.type === 'footer') {
          setGlobalDraft({ ...globalDraft, footer: { ...globalDraft.footer!, data: newData } });
        }
      } else {
        const updatedSections = draft.sections.map((s) =>
          s.id === selected.id ? { ...s, data: newData } : s
        );
        setDraft({ ...draft, sections: updatedSections });
      }
    };

    const triggerBake = () => {
      const iframe = document.querySelector('iframe');
      iframe?.contentWindow?.postMessage({ type: STUDIO_EVENTS.REQUEST_CLEAN_HTML }, '*');
    };

    const handleExportJSON = () => {
      if (!draft) return;
      const projectState: ProjectState = {
        page: draft,
        site: globalDraft,
        menu: { main: globalDraft.header?.data?.links ?? [] },
        theme: themeConfig,
      };
      persistence.exportJSON(projectState, slug);
      setHasChanges(false);
    };

    if (!draft) return <div>Loading Studio...</div>;

    const sidebarData =
      selected?.scope === 'global'
        ? { sections: [globalDraft.header!, globalDraft.footer!] }
        : draft;

    return (
      <ThemeLoader mode="admin" tenantCss={tenantCss} adminCss={adminCss}>
        <StudioProvider mode="studio">
          <div className="flex flex-col h-screen w-screen bg-background text-foreground overflow-hidden">
            <ControlBar
              hasChanges={hasChanges}
              onExportJSON={handleExportJSON}
              onExportHTML={triggerBake}
            />
            <div className="flex flex-1 overflow-hidden">
              <main className="flex-1 relative bg-zinc-900/50 overflow-hidden">
                <StudioStage
                  draft={draft}
                  globalDraft={globalDraft}
                  themeConfig={themeConfig}
                  slug={slug}
                  selectedId={selected?.id}
                />
              </main>
              <AdminSidebar
                selectedSection={selected}
                pageData={sidebarData}
                onUpdate={handleUpdate}
                onClose={() => setSelected(null)}
              />
            </div>
          </div>
        </StudioProvider>
      </ThemeLoader>
    );
  };

  const PreviewView: React.FC = () => (
    <ThemeLoader mode="tenant" tenantCss={tenantCss} adminCss={adminCss}>
      <PreviewEntry />
    </ThemeLoader>
  );

  if (!isReady) return null;

  return (
    <ConfigProvider config={{ registry, schemas }}>
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<VisitorView />} />
          <Route path="/:slug" element={<VisitorView />} />
          <Route path="/admin" element={<StudioView />} />
          <Route path="/admin/:slug" element={<StudioView />} />
          <Route path="/admin/preview/:slug" element={<PreviewView />} />
          <Route path="*" element={<NotFoundComponent />} />
        </Routes>
      </BrowserRouter>
    </ConfigProvider>
  );
}

END_OF_FILE_CONTENT
echo "Creating src/lib/PageRenderer.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/lib/PageRenderer.tsx"
import React from 'react';
import { SectionRenderer } from './SectionRenderer';
import { useDocumentMeta } from '@/hooks/useDocumentMeta';
import type { PageRendererProps } from './kernel';

export const PageRenderer: React.FC<PageRendererProps> = ({ 
  pageConfig, 
  siteConfig, 
  menuConfig,
  selectedId
}) => {
  useDocumentMeta(pageConfig.meta);

  return (
    <div className="min-h-screen flex flex-col bg-[var(--color-background)]">
      <SectionRenderer 
        section={siteConfig.header} 
        menu={menuConfig.main} 
        selectedId={selectedId}
      />

      <main className="flex-1">
        {pageConfig.sections.map((section) => (
          <SectionRenderer 
            key={section.id} 
            section={section} 
            selectedId={selectedId}
          />
        ))}
      </main>

      <SectionRenderer 
        section={siteConfig.footer} 
        selectedId={selectedId}
      />
    </div>
  );
};




END_OF_FILE_CONTENT
echo "Creating src/lib/SectionRenderer.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/lib/SectionRenderer.tsx"

/**
 * FILE: SectionRenderer.tsx
 * STATUS: Build-Safe & Anchor-Enabled
 */

import React from 'react';
import { useConfig } from './ConfigContext';
import { useStudio } from './StudioContext';
import { cn } from './utils';
import { STUDIO_EVENTS } from './events';
import type { Section, MenuItem } from './kernel';

interface SectionRendererProps {
  // 🛡️ FIX: Use the Discriminated Union 'Section' instead of the loose 'BaseSection<SectionType>'
  // This ensures strict correlation between section.type and section.data
  section: Section;
  menu?: MenuItem[];
  selectedId?: string | null;
}

const SovereignOverlay: React.FC<{ 
  type: string; 
  scope: string; 
  isSelected: boolean; 
}> = ({ type, scope, isSelected }) => {
  return (
    <div 
      className={cn(
        "absolute inset-0 pointer-events-none transition-all duration-200 z-[50]",
        "border-2 border-transparent group-hover:border-blue-400/50 group-hover:border-dashed",
        isSelected && "border-2 border-blue-600 border-solid bg-blue-500/5"
      )}
    >
      <div className={cn(
        "absolute top-0 right-0 px-2 py-1 text-[9px] font-black uppercase tracking-widest transition-opacity",
        "bg-blue-600 text-white",
        isSelected || "group-hover:opacity-100 opacity-0"
      )}>
        {type} <span className="opacity-50">|</span> {scope}
      </div>
    </div>
  );
};

export const SectionRenderer: React.FC<SectionRendererProps> = ({ 
  section, 
  menu,
  selectedId 
}) => {
  const { mode } = useStudio();
  const { registry } = useConfig();
  const isStudio = mode === 'studio';
  const isSelected = isStudio && selectedId === section.id;

  // 1. Component Lookup (from config; no direct import of ComponentRegistry)
  const Component = registry[section.type];
  const scope = (section.type === 'header' || section.type === 'footer') ? 'global' : 'local';
  
  // 🛡️ Safe Access: We cast to any for the settings check because TypeScript 
  // cannot easily verify that 'sticky' exists on ALL section settings types.
  const isStickyHeader = section.type === 'header' && (section.settings as any)?.sticky;

  if (!Component) {
    return (
      <div className="p-6 m-4 bg-red-500/10 text-red-400 border border-red-500/20 rounded-lg text-sm font-mono">
        <strong>Missing Component:</strong> {section.type}
      </div>
    );
  }

  const handleSectionClick = (e: React.MouseEvent) => {
    if (!isStudio) return;
    e.preventDefault();
    e.stopPropagation();
    window.parent.postMessage({
      type: STUDIO_EVENTS.SECTION_SELECT,
      section: { id: section.id, type: section.type, scope: scope }
    }, '*');
  };

  const renderInnerComponent = () => {
    // 2. Runtime Dispatch
    // We cast to 'any' because React Props cannot dynamically map over a Discriminated Union 
    // without complex overload signatures. The 'Section' type guard at the prop level 
    // guarantees we have valid data.
    const DynamicComponent = Component as any;

    if (section.type === 'header' && menu) {
      return <DynamicComponent data={section.data} settings={section.settings} menu={menu} />;
    }
    return <DynamicComponent data={section.data} settings={section.settings} />;
  };

  // 3. Anchor ID Management
  const anchorId = (section.data as any)?.anchorId;

  return (
    <div 
      id={anchorId || undefined}
      data-section-id={isStudio ? section.id : undefined} 
      onClick={isStudio ? handleSectionClick : undefined}
      className={cn(
        "relative w-full",
        isStudio && "group cursor-pointer",
        isStudio && isStickyHeader ? "sticky top-0 z-[60]" : "relative z-0",
        isSelected && "z-[70]" 
      )}
    >
      <div className="relative z-10">
        {renderInnerComponent()}
      </div>

      {isStudio && (
        <SovereignOverlay 
          type={section.type} 
          scope={scope} 
          isSelected={!!isSelected} 
        />
      )}
    </div>
  );
};


END_OF_FILE_CONTENT
echo "Creating src/lib/StageWrapper.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/lib/StageWrapper.tsx"
import React from 'react';

/**
 * 🧩 StageCSSProperties
 * Estende React.CSSProperties per includere le variabili custom del protocollo JSP.
 */
interface StageCSSProperties extends React.CSSProperties {
  '--background'?: string;
  '--foreground'?: string;
  '--card'?: string;
  '--card-foreground'?: string;
  '--primary'?: string;
  '--primary-foreground'?: string;
  '--secondary'?: string;
  '--secondary-foreground'?: string;
  '--muted'?: string;
  '--muted-foreground'?: string;
  '--border'?: string;
  '--input'?: string;
  '--ring'?: string;
  '--radius'?: string;
}

/**
 * 🛡️ STAGE ISOLATION WRAPPER
 * Questo componente agisce come confine. Resetta le variabili CSS funzionali
 * ai Brand Token del Tenant, neutralizzando le variabili [data-jp-studio] per i figli.
 */
export const StageWrapper: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  const isolationStyles: StageCSSProperties = {
    '--background': 'var(--theme-background)',
    '--foreground': 'var(--theme-text)',
    '--card': 'var(--theme-surface)',
    '--card-foreground': 'var(--theme-text)',
    '--primary': 'var(--theme-primary)',
    '--primary-foreground': 'oklch(0.98 0 0)',
    '--secondary': 'var(--theme-secondary)',
    '--secondary-foreground': 'var(--theme-text)',
    '--muted': 'var(--theme-surface-alt)',
    '--muted-foreground': 'var(--theme-text-muted)',
    '--border': 'var(--theme-border)',
    '--input': 'var(--theme-border)',
    '--ring': 'var(--theme-primary)',
    '--radius': '0.45rem',
  };

  return (
    <div 
      id="jp-stage-isolation-root"
      className="relative w-full h-full overflow-auto bg-[var(--background)] text-[var(--foreground)]"
      style={isolationStyles}
    >
      {children}
    </div>
  );
};




END_OF_FILE_CONTENT
echo "Creating src/lib/StudioContext.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/lib/StudioContext.tsx"
import React, { createContext, useContext, useEffect, ReactNode } from 'react';

type StudioMode = 'visitor' | 'studio';

interface StudioContextType {
  mode: StudioMode;
}

const StudioContext = createContext<StudioContextType | undefined>(undefined);

export const StudioProvider: React.FC<{ mode: StudioMode; children: ReactNode }> = ({ mode, children }) => {
  
  useEffect(() => {
    if (mode !== 'studio') return;

    /**
     * 🛡️ PORTAL BRIDGE PROTOCOL
     * Radix/Shadcn components render at the document body root.
     * We observe the body and tag any new portals with our sovereign namespace attribute.
     */
    const observer = new MutationObserver((mutations) => {
      mutations.forEach((mutation) => {
        mutation.addedNodes.forEach((node) => {
          if (node instanceof HTMLElement && node.hasAttribute('data-radix-portal')) {
            node.setAttribute('data-jp-studio-portal', 'true');
          }
        });
      });
    });

    observer.observe(document.body, { childList: true });
    
    return () => observer.disconnect();
  }, [mode]);

  return (
    <StudioContext.Provider value={{ mode }}>
      {children}
    </StudioContext.Provider>
  );
};

export const useStudio = () => {
  const context = useContext(StudioContext);
  if (context === undefined) {
    throw new Error('useStudio must be used within a StudioProvider');
  }
  return context;
};




END_OF_FILE_CONTENT
echo "Creating src/lib/ThemeLoader.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/lib/ThemeLoader.tsx"
import React, { useLayoutEffect } from 'react';

interface ThemeLoaderProps {
  /** Which mode is active; determines which CSS is injected. */
  mode: 'tenant' | 'admin';
  /** CSS string for tenant (visitor) mode. */
  tenantCss: string;
  /** CSS string for admin (studio) mode. Engine provides default if not passed. */
  adminCss: string;
  children: React.ReactNode;
}

/**
 * Theme Loader: injects the required CSS into the <head> and removes it on unmount.
 * CSS strings are passed as props so the Engine controls injection; Tenant does not manage Admin CSS.
 */
export const ThemeLoader: React.FC<ThemeLoaderProps> = ({ mode, tenantCss, adminCss, children }) => {
  useLayoutEffect(() => {
    const styleId = `jp-theme-${mode}`;
    const css = mode === 'tenant' ? tenantCss : adminCss;

    if (!document.getElementById(styleId) && css) {
      const style = document.createElement('style');
      style.id = styleId;
      style.innerHTML = css;
      document.head.appendChild(style);
    }

    return () => {
      const style = document.getElementById(styleId);
      if (style) style.remove();
    };
  }, [mode, tenantCss, adminCss]);

  return <>{children}</>;
};




END_OF_FILE_CONTENT
echo "Creating src/lib/events.ts..."
cat << 'END_OF_FILE_CONTENT' > "src/lib/events.ts"
/**
 * 📡 STUDIO EVENT PROTOCOL
 * Single Source of Truth for cross-frame communication.
 */
export const STUDIO_EVENTS = {
  // Parent -> Child (Data Injection)
  UPDATE_DRAFTS: 'jsonpages:update-drafts',
  
  // Parent -> Child (ICE Control)
  SYNC_SELECTION: 'jsonpages:sync-selection',
  
  // Parent -> Child (Bake Handshake)
  REQUEST_CLEAN_HTML: 'jsonpages:request-clean-html',
  
  // Child -> Parent (Bake Response)
  SEND_CLEAN_HTML: 'jsonpages:send-clean-html',
  
  // Child -> Parent (User Interaction)
  SECTION_SELECT: 'jsonpages:section-select',
  
  // Child -> Parent (Lifecycle)
  STAGE_READY: 'jsonpages:stage-ready',
} as const;


END_OF_FILE_CONTENT
echo "Creating src/lib/kernel.ts..."
cat << 'END_OF_FILE_CONTENT' > "src/lib/kernel.ts"
/**
 * 🛡️ KERNEL: The Base Contract (MTRP)
 * Core is self-contained; structural types live here. Section is the computed union from the registry.
 */
export interface BaseSectionSettings {
  [key: string]: unknown;
}

export interface SectionDataRegistry {}
export interface SectionSettingsRegistry {}

export interface BaseSection<K extends keyof SectionDataRegistry> {
  id: string;
  type: K;
  data: SectionDataRegistry[K];
  settings?: K extends keyof SectionSettingsRegistry
    ? SectionSettingsRegistry[K]
    : BaseSectionSettings;
}

/** Computed union of all registered section types (augmented by Tenant via declare module). */
export type Section =
  { [K in keyof SectionDataRegistry]: BaseSection<K> }[keyof SectionDataRegistry];

export type SectionType = keyof SectionDataRegistry;

// =============================================================================
// STRUCTURAL TYPES (Base; no dependency on @/types)
// =============================================================================

export interface MenuItem {
  label: string;
  href: string;
  icon?: string;
  external?: boolean;
  isCta?: boolean;
  children?: MenuItem[];
}

export interface MenuConfig {
  main: MenuItem[];
}

export interface PageMeta {
  title: string;
  description: string;
}

export interface PageConfig {
  id: string;
  slug: string;
  meta: PageMeta;
  sections: Section[];
}

export interface SiteIdentity {
  title: string;
  logoUrl?: string;
}

export interface SitePageEntry {
  slug: string;
  label: string;
}

export interface SiteConfig {
  identity: SiteIdentity;
  header: Section;
  footer: Section;
  pages: SitePageEntry[];
}

export interface ThemeColors {
  primary: string;
  secondary: string;
  accent: string;
  background: string;
  surface: string;
  surfaceAlt: string;
  text: string;
  textMuted: string;
  border: string;
}

export interface ThemeTypography {
  fontFamily: {
    primary: string;
    mono: string;
    display?: string;
  };
}

export interface ThemeBorderRadius {
  sm: string;
  md: string;
  lg: string;
}

export interface ThemeTokens {
  colors: ThemeColors;
  typography: ThemeTypography;
  borderRadius: ThemeBorderRadius;
}

export interface ThemeConfig {
  name: string;
  tokens: ThemeTokens;
}

export interface PageRendererProps {
  pageConfig: PageConfig;
  siteConfig: SiteConfig;
  menuConfig: MenuConfig;
  selectedId?: string | null;
}



END_OF_FILE_CONTENT
echo "Creating src/lib/persistence.ts..."
cat << 'END_OF_FILE_CONTENT' > "src/lib/persistence.ts"
import JSZip from 'jszip';
import { saveAs } from 'file-saver';
import type { PageConfig, SiteConfig, MenuConfig, ThemeConfig } from './kernel';

interface ProjectState {
  page: PageConfig;
  site: SiteConfig;
  menu: MenuConfig;
  theme: ThemeConfig;
}

/**
 * 💾 EXPORT JSON (The Developer Handover)
 */
export const exportProjectJSON = async (state: ProjectState, slug: string) => {
  const zip = new JSZip();
  const config = zip.folder("config");
  config?.file("site.json", JSON.stringify(state.site, null, 2));
  config?.file("theme.json", JSON.stringify(state.theme, null, 2));
  config?.file("menu.json", JSON.stringify(state.menu, null, 2));

  const pages = zip.folder("pages");
  pages?.file(`${slug}.json`, JSON.stringify(state.page, null, 2));

  const content = await zip.generateAsync({ type: "blob" });
  saveAs(content, `jsonpages-project-${slug}-${Date.now()}.zip`);
};

/**
 * 🍞 BAKE HTML (The Single File Artifact)
 * Now accepts the cleanHtml string captured from the Iframe.
 */
export const exportBakedHTML = (state: ProjectState, slug: string, cleanHtml: string) => {
  // 1. Create the State Payload for hydration
  const payload = JSON.stringify(state);
  const injectionScript = `<script id="jp-baked-state" type="application/json">${payload}</script>`;

  // 2. Inject the payload into the captured <head>
  const bakedHtml = cleanHtml.replace(
    '</head>', 
    `${injectionScript}</head>`
  );

  // 3. Create Blob & Download
  const blob = new Blob([`<!DOCTYPE html>${bakedHtml}`], { type: "text/html;charset=utf-8" });
  saveAs(blob, `${slug}.html`);
};


END_OF_FILE_CONTENT
echo "Creating src/lib/schemas.ts..."
cat << 'END_OF_FILE_CONTENT' > "src/lib/schemas.ts"
import { z } from 'zod';

// =============================================================================
// 1. SETTINGS SCHEMAS (CIP v1.2) — 🔴 IMMUTABLE
// =============================================================================
export const BaseSectionSettingsSchema = z.object({
  paddingTop: z.enum(['none', 'sm', 'md', 'lg', 'xl', '2xl']).default('md').describe('ui:select'),
  paddingBottom: z.enum(['none', 'sm', 'md', 'lg', 'xl', '2xl']).default('md').describe('ui:select'),
  theme: z.enum(['dark', 'light', 'accent']).default('dark').describe('ui:select'),
  container: z.enum(['boxed', 'fluid']).default('boxed').describe('ui:select'),
});

// =============================================================================
// 2. SHARED SUB-SCHEMAS
// =============================================================================
const CtaSchema = z.object({
  label: z.string().describe('ui:text'),
  href: z.string().describe('ui:text'),
  variant: z.enum(['primary', 'secondary']).default('primary').describe('ui:select'),
});

// =============================================================================
// 3. HERO
// =============================================================================
const HeroMetricSchema = z.object({
  val: z.string().describe('ui:text'),
  label: z.string().describe('ui:text'),
});

export const HeroSchema = z.object({
  anchorId: z.string().optional().describe('ui:text'),
  badge: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  titleHighlight: z.string().optional().describe('ui:text'),
  description: z.string().optional().describe('ui:textarea'),
  ctas: z.array(CtaSchema).optional().describe('ui:list'),
  metrics: z.array(HeroMetricSchema).optional().describe('ui:list'),
});

// =============================================================================
// 4. FEATURE GRID (Legacy)
// =============================================================================
export const FeatureCardSchema = z.object({
  icon: z.string().optional().describe('ui:icon-picker'),
  emoji: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  description: z.string().describe('ui:textarea'),
});

export const FeatureGridSchema = z.object({
  anchorId: z.string().optional().describe('ui:text'),
  sectionTitle: z.string().describe('ui:text'),
  cards: z.array(FeatureCardSchema).describe('ui:list'),
});

// =============================================================================
// 5. CODE BLOCK (Legacy)
// =============================================================================
export const LegacyCodeLineSchema = z.object({
  content: z.string().describe('ui:text'),
  isComment: z.boolean().default(false).describe('ui:checkbox'),
});

export const CodeBlockSchema = z.object({
  anchorId: z.string().optional().describe('ui:text'),
  label: z.string().optional().describe('ui:text'),
  lines: z.array(LegacyCodeLineSchema).describe('ui:list'),
});

// =============================================================================
// 6. PROBLEM STATEMENT
// =============================================================================
const SiloBlockSchema = z.object({
  label: z.string().describe('ui:text'),
  variant: z.enum(['red', 'amber', 'green', 'blue']).describe('ui:select'),
});

const SiloGroupSchema = z.object({
  blocks: z.array(SiloBlockSchema).describe('ui:list'),
  label: z.string().describe('ui:text'),
});

const ProblemParagraphSchema = z.object({
  text: z.string().describe('ui:textarea'),
  isBold: z.boolean().default(false).describe('ui:checkbox'),
});

export const ProblemStatementSchema = z.object({
  anchorId: z.string().optional().describe('ui:text'),
  siloGroups: z.array(SiloGroupSchema).describe('ui:list'),
  title: z.string().describe('ui:text'),
  paragraphs: z.array(ProblemParagraphSchema).describe('ui:list'),
  highlight: z.string().optional().describe('ui:text'),
});

// =============================================================================
// 7. PILLARS GRID
// =============================================================================
const PillarCardSchema = z.object({
  icon: z.string().describe('ui:text'),
  iconVariant: z.enum(['split', 'registry', 'federation']).describe('ui:select'),
  title: z.string().describe('ui:text'),
  description: z.string().describe('ui:textarea'),
  tag: z.string().describe('ui:text'),
  tagVariant: z.enum(['core', 'pattern', 'enterprise']).describe('ui:select'),
});

export const PillarsGridSchema = z.object({
  anchorId: z.string().optional().describe('ui:text'),
  label: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  description: z.string().optional().describe('ui:textarea'),
  pillars: z.array(PillarCardSchema).describe('ui:list'),
});

// =============================================================================
// 8. ARCH LAYERS
// =============================================================================
const ArchLayerItemSchema = z.object({
  number: z.string().describe('ui:text'),
  layerLevel: z.enum(['l0', 'l1', 'l2']).describe('ui:select'),
  title: z.string().describe('ui:text'),
  description: z.string().describe('ui:textarea'),
});

const SyntaxLineSchema = z.object({
  content: z.string().describe('ui:text'),
  tokenType: z.enum(['plain', 'keyword', 'type', 'string', 'comment', 'operator']).default('plain').describe('ui:select'),
});

export const ArchLayersSchema = z.object({
  anchorId: z.string().optional().describe('ui:text'),
  label: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  description: z.string().optional().describe('ui:textarea'),
  layers: z.array(ArchLayerItemSchema).describe('ui:list'),
  codeFilename: z.string().optional().describe('ui:text'),
  codeLines: z.array(SyntaxLineSchema).optional().describe('ui:list'),
});

// =============================================================================
// 9. PRODUCT TRIAD
// =============================================================================
const ProductFeatureSchema = z.object({
  text: z.string().describe('ui:text'),
});

const ProductCardSchema = z.object({
  tier: z.string().describe('ui:text'),
  name: z.string().describe('ui:text'),
  price: z.string().describe('ui:text'),
  priceSuffix: z.string().optional().describe('ui:text'),
  delivery: z.string().describe('ui:text'),
  features: z.array(ProductFeatureSchema).describe('ui:list'),
  featured: z.boolean().default(false).describe('ui:checkbox'),
  ctaLabel: z.string().optional().describe('ui:text'),
  ctaHref: z.string().optional().describe('ui:text'),
  ctaVariant: z.enum(['primary', 'secondary']).default('secondary').describe('ui:select'),
});

export const ProductTriadSchema = z.object({
  anchorId: z.string().optional().describe('ui:text'),
  label: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  description: z.string().optional().describe('ui:textarea'),
  products: z.array(ProductCardSchema).describe('ui:list'),
});

// =============================================================================
// 10. PA SECTION
// =============================================================================
const PaBadgeSchema = z.object({
  label: z.string().describe('ui:text'),
});

const PaEngineSchema = z.object({
  label: z.string().describe('ui:text'),
  variant: z.enum(['tailwind', 'bootstrap']).describe('ui:select'),
});

export const PaSectionSchema = z.object({
  anchorId: z.string().optional().describe('ui:text'),
  label: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  subtitle: z.string().describe('ui:text'),
  paragraphs: z.array(z.object({ text: z.string().describe('ui:textarea') })).describe('ui:list'),
  badges: z.array(PaBadgeSchema).optional().describe('ui:list'),
  engines: z.array(PaEngineSchema).optional().describe('ui:list'),
  codeSnippet: z.string().optional().describe('ui:textarea'),
});

// =============================================================================
// 11. PHILOSOPHY
// =============================================================================
export const PhilosophySchema = z.object({
  anchorId: z.string().optional().describe('ui:text'),
  label: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  quote: z.string().describe('ui:textarea'),
  quoteHighlightWord: z.string().optional().describe('ui:text'),
  description: z.string().optional().describe('ui:textarea'),
});

// =============================================================================
// 12. CTA BANNER
// =============================================================================
export const CtaBannerSchema = z.object({
  anchorId: z.string().optional().describe('ui:text'),
  label: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  description: z.string().optional().describe('ui:textarea'),
  ctas: z.array(CtaSchema).optional().describe('ui:list'),
});

// =============================================================================
// 13. SECTION_SCHEMAS REGISTRY (SSOT for FormFactory)
// =============================================================================
export const SECTION_SCHEMAS = {
  'hero': HeroSchema,
  'feature-grid': FeatureGridSchema,
  'code-block': CodeBlockSchema,
  'problem-statement': ProblemStatementSchema,
  'pillars-grid': PillarsGridSchema,
  'arch-layers': ArchLayersSchema,
  'product-triad': ProductTriadSchema,
  'pa-section': PaSectionSchema,
  'philosophy': PhilosophySchema,
  'cta-banner': CtaBannerSchema,
  'header': z.object({
    logoText: z.string().describe('ui:text'),
    logoHighlight: z.string().optional().describe('ui:text'),
    logoIconText: z.string().optional().describe('ui:text'),
    links: z.array(z.object({
      label: z.string().describe('ui:text'),
      href: z.string().describe('ui:text'),
      isCta: z.boolean().default(false).describe('ui:checkbox'),
    })).describe('ui:list'),
  }),
  'footer': z.object({
    brandText: z.string().describe('ui:text'),
    brandHighlight: z.string().optional().describe('ui:text'),
    copyright: z.string().describe('ui:text'),
    links: z.array(z.object({
      label: z.string().describe('ui:text'),
      href: z.string().describe('ui:text'),
    })).optional().describe('ui:list'),
  }),
} as const;

export type SectionType = keyof typeof SECTION_SCHEMAS;



END_OF_FILE_CONTENT
echo "Creating src/lib/shared-types.ts..."
cat << 'END_OF_FILE_CONTENT' > "src/lib/shared-types.ts"
/**
 * 🧩 SHARED TYPES
 * Contracts shared between the Admin Engine and the Input Registry.
 * In the Monorepo, this will live in @jsonpages/shared-data.
 */

export interface BaseWidgetProps<T = unknown> {
  label: string;
  value: T;
  onChange: (val: T) => void;
  options?: string[]; // For Select/Enum widgets
}




END_OF_FILE_CONTENT
echo "Creating src/lib/types-engine.ts..."
cat << 'END_OF_FILE_CONTENT' > "src/lib/types-engine.ts"
/**
 * Engine contract: Core must not import from src/components or src/data.
 * All tenant-specific data and components are received via this config.
 */
import type React from 'react';
import type { PageConfig, SiteConfig, ThemeConfig, MenuConfig } from './kernel';

/** Project state shape used by persistence (export JSON / bake HTML). */
export interface ProjectState {
  page: PageConfig;
  site: SiteConfig;
  menu: MenuConfig;
  theme: ThemeConfig;
}

/** Persistence API; defaults provided by Core, overridable by Tenant. */
export interface PersistenceConfig {
  exportJSON: (state: ProjectState, slug: string) => Promise<void>;
  exportHTML: (state: ProjectState, slug: string, cleanHtml: string) => void;
}

/** Theme CSS: tenant (required), admin (optional; Core can provide default). */
export interface ThemeCssConfig {
  tenant: string;
  admin?: string;
}

/** Single entry point configuration for the JsonPages Engine. */
export interface JsonPagesConfig {
  /** Component map: section type -> React component. */
  registry: Record<string, React.ComponentType<unknown>>;
  /** Zod schemas map: section type -> schema (for FormFactory / AdminSidebar). */
  schemas: Record<string, { parse: (v: unknown) => unknown; shape?: Record<string, unknown> }>;
  /** Page slug -> page config. */
  pages: Record<string, PageConfig>;
  siteConfig: SiteConfig;
  themeConfig: ThemeConfig;
  menuConfig: MenuConfig;
  /** Optional persistence; Core provides defaults if omitted. */
  persistence?: Partial<PersistenceConfig>;
  /** CSS strings for ThemeLoader; Engine injects admin CSS if admin not provided. */
  themeCss: ThemeCssConfig;
  /** Optional 404 component; Core provides default if omitted. */
  NotFoundComponent?: React.ComponentType;
}

END_OF_FILE_CONTENT
echo "Creating src/lib/utils.ts..."
cat << 'END_OF_FILE_CONTENT' > "src/lib/utils.ts"
import { clsx, type ClassValue } from "clsx";
import { twMerge } from "tailwind-merge";

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}





END_OF_FILE_CONTENT
echo "Creating src/main.tsx..."
cat << 'END_OF_FILE_CONTENT' > "src/main.tsx"
import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);




END_OF_FILE_CONTENT
echo "Creating src/types.ts..."
cat << 'END_OF_FILE_CONTENT' > "src/types.ts"
import { z } from 'zod';
import {
  BaseSectionSettingsSchema,
  HeroSchema,
  FeatureGridSchema,
  CodeBlockSchema,
  ProblemStatementSchema,
  PillarsGridSchema,
  ArchLayersSchema,
  ProductTriadSchema,
  PaSectionSchema,
  PhilosophySchema,
  CtaBannerSchema,
  SECTION_SCHEMAS,
} from './lib/schemas';

// 1. Importiamo il Kernel originale (La Legge)
import './lib/kernel';

// 2. Inferiamo i tipi Zod (Il Contenuto)
export type HeaderData = z.infer<typeof SECTION_SCHEMAS.header>;
export type FooterData = z.infer<typeof SECTION_SCHEMAS.footer>;
export type HeroData = z.infer<typeof HeroSchema>;
export type FeatureGridData = z.infer<typeof FeatureGridSchema>;
export type CodeBlockData = z.infer<typeof CodeBlockSchema>;
export type ProblemStatementData = z.infer<typeof ProblemStatementSchema>;
export type PillarsGridData = z.infer<typeof PillarsGridSchema>;
export type ArchLayersData = z.infer<typeof ArchLayersSchema>;
export type ProductTriadData = z.infer<typeof ProductTriadSchema>;
export type PaSectionData = z.infer<typeof PaSectionSchema>;
export type PhilosophyData = z.infer<typeof PhilosophySchema>;
export type CtaBannerData = z.infer<typeof CtaBannerSchema>;

// 3. Definiamo i Settings (Standard + Specifici)
export type StandardSectionSettings = z.infer<typeof BaseSectionSettingsSchema>;

export interface HeaderSettings { sticky?: boolean; }
export interface FooterSettings { showLogo?: boolean; }
export type CodeBlockSettings = StandardSectionSettings & { showLineNumbers?: boolean };

// 🔥 FIX: Ripristino delle proprietà specifiche per FeatureGrid (Legacy Component)
export type FeatureGridSettings = StandardSectionSettings & {
  columns?: number;
  cardStyle?: 'plain' | 'bordered';
};

// Alias per gli altri componenti (che usano solo settings standard)
export type HeroSettings = StandardSectionSettings;
export type ProblemStatementSettings = StandardSectionSettings;
export type PillarsGridSettings = StandardSectionSettings;
export type ArchLayersSettings = StandardSectionSettings;
export type ProductTriadSettings = StandardSectionSettings;
export type PaSectionSettings = StandardSectionSettings;
export type PhilosophySettings = StandardSectionSettings;
export type CtaBannerSettings = StandardSectionSettings;


// 4. 🔥 MTRP AUGMENTATION
declare module './lib/kernel' {
  export interface SectionDataRegistry {
    'header': HeaderData;
    'footer': FooterData;
    'hero': HeroData;
    'feature-grid': FeatureGridData;
    'code-block': CodeBlockData;
    'problem-statement': ProblemStatementData;
    'pillars-grid': PillarsGridData;
    'arch-layers': ArchLayersData;
    'product-triad': ProductTriadData;
    'pa-section': PaSectionData;
    'philosophy': PhilosophyData;
    'cta-banner': CtaBannerData;
  }

  export interface SectionSettingsRegistry {
    'header': HeaderSettings;
    'footer': FooterSettings;
    'hero': HeroSettings;
    'feature-grid': FeatureGridSettings;
    'code-block': CodeBlockSettings;
    'problem-statement': ProblemStatementSettings;
    'pillars-grid': PillarsGridSettings;
    'arch-layers': ArchLayersSettings;
    'product-triad': ProductTriadSettings;
    'pa-section': PaSectionSettings;
    'philosophy': PhilosophySettings;
    'cta-banner': CtaBannerSettings;
  }
}

// 5. Re-export structural types from Kernel (do not redefine here)
export * from './lib/kernel';


END_OF_FILE_CONTENT
mkdir -p "src/utils"
echo "Creating src/utils/asset-resolver.ts..."
cat << 'END_OF_FILE_CONTENT' > "src/utils/asset-resolver.ts"
/**
 * 🛡️ SMART ASSET RESOLVER
 * Distinguishes between internal routes and static assets.
 */
export const resolveAssetUrl = (path: string, tenantId: string = 'default'): string => {
  // 1. Absolute URLs, Data URIs, and Anchors are returned as is
  if (path.startsWith('http') || path.startsWith('data:') || path.startsWith('#')) {
    return path;
  }

  // 2. Detect if it's a Route or an Asset
  // If it starts with / and not /assets, it's a page route.
  const isExplicitAsset = path.includes('assets/') || path.startsWith('assets/');
  const hasFileExtension = /\.(jpg|jpeg|png|gif|svg|pdf|webp|mp4|webm|ogg)$/i.test(path);

  if (!isExplicitAsset && !hasFileExtension) {
    // It's a route (e.g., "/about" or "contact")
    return path.startsWith('/') ? path : `/${path}`;
  }

  // 3. It's an asset: Normalize and prepend tenant path
  const cleanPath = path.replace(/^\//, '').replace(/^assets\//, '');
  return `/assets/${tenantId}/${cleanPath}`;
};

END_OF_FILE_CONTENT
echo "Creating src/utils/theme-manager.ts..."
cat << 'END_OF_FILE_CONTENT' > "src/utils/theme-manager.ts"
import type { ThemeConfig } from '@/types';

export const themeManager = {
  setTheme: (theme: ThemeConfig): void => {
    const root = document.documentElement;
    const { tokens } = theme;
    
    const mappings: Record<string, string> = {
      '--theme-primary': tokens.colors.primary,
      '--theme-secondary': tokens.colors.secondary,
      '--theme-accent': tokens.colors.accent,
      '--theme-background': tokens.colors.background,
      '--theme-surface': tokens.colors.surface,
      '--theme-surface-alt': tokens.colors.surfaceAlt,
      '--theme-text': tokens.colors.text,
      '--theme-text-muted': tokens.colors.textMuted,
      '--theme-border': tokens.colors.border,
      '--theme-font-primary': tokens.typography.fontFamily.primary,
      '--theme-font-mono': tokens.typography.fontFamily.mono,
      '--theme-radius-sm': tokens.borderRadius.sm,
      '--theme-radius-md': tokens.borderRadius.md,
      '--theme-radius-lg': tokens.borderRadius.lg,
    };

    Object.entries(mappings).forEach(([key, value]) => {
      root.style.setProperty(key, value);
    });
  }
};





END_OF_FILE_CONTENT
echo "Creating src/vite-env.d.ts..."
cat << 'END_OF_FILE_CONTENT' > "src/vite-env.d.ts"
/// <reference types="vite/client" />

declare module '*?inline' {
  const content: string;
  export default content;
}



END_OF_FILE_CONTENT
echo "Creating tsconfig.json..."
cat << 'END_OF_FILE_CONTENT' > "tsconfig.json"
{
  "compilerOptions": {
    "target": "ES2020",
    "useDefineForClassFields": true,
    "lib": ["ES2020", "DOM", "DOM.Iterable"],
    "module": "ESNext",
    "skipLibCheck": true,
    "moduleResolution": "bundler",
    "allowImportingTsExtensions": true,
    "resolveJsonModule": true,
    "isolatedModules": true,
    "noEmit": true,
    "jsx": "react-jsx",
    "strict": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "noFallthroughCasesInSwitch": true,
    "baseUrl": ".",
    "paths": {
      "@/*": ["./src/*"]
    }
  },
  "include": ["src"],
  "references": [{ "path": "./tsconfig.node.json" }]
}




END_OF_FILE_CONTENT
echo "Creating tsconfig.node.json..."
cat << 'END_OF_FILE_CONTENT' > "tsconfig.node.json"
{
  "compilerOptions": {
    "composite": true,
    "skipLibCheck": true,
    "module": "ESNext",
    "moduleResolution": "bundler",
    "allowSyntheticDefaultImports": true,
    "strict": true
  },
  "include": ["vite.config.ts"]
}




END_OF_FILE_CONTENT
echo "Creating vite.config.d.ts..."
cat << 'END_OF_FILE_CONTENT' > "vite.config.d.ts"
declare const _default: import("vite").UserConfig;
export default _default;


END_OF_FILE_CONTENT
echo "Creating vite.config.js..."
cat << 'END_OF_FILE_CONTENT' > "vite.config.js"
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import tailwindcss from '@tailwindcss/vite';
import path from 'path';
export default defineConfig({
    plugins: [react(), tailwindcss()],
    resolve: {
        alias: {
            '@': path.resolve(__dirname, './src'),
        },
    },
});


END_OF_FILE_CONTENT
echo "Creating vite.config.ts..."
cat << 'END_OF_FILE_CONTENT' > "vite.config.ts"
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import tailwindcss from '@tailwindcss/vite';
import path from 'path';

export default defineConfig({
  plugins: [react(), tailwindcss()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
    },
  },
});




END_OF_FILE_CONTENT
