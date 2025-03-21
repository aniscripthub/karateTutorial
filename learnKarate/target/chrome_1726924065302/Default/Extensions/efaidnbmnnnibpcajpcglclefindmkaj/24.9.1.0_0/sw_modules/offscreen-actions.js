/*************************************************************************
* ADOBE CONFIDENTIAL
* ___________________
*
*  Copyright 2015 Adobe Systems Incorporated
*  All Rights Reserved.
*
* NOTICE:  All information contained herein is, and remains
* the property of Adobe Systems Incorporated and its suppliers,
* if any.  The intellectual and technical concepts contained
* herein are proprietary to Adobe Systems Incorporated and its
* suppliers and are protected by all applicable intellectual property laws,
* including trade secret and or copyright laws.
* Dissemination of this information or reproduction of this material
* is strictly forbidden unless prior written permission is obtained
* from Adobe Systems Incorporated.
**************************************************************************/
import{OFFSCREEN_DOCUMENT_PATH as e}from"../common/constant.js";import{dcLocalStorage as o}from"../common/local-storage.js";import{common as r}from"./common.js";import{communicate as n}from"./communicate.js";import{Proxy as t}from"./proxy.js";import{util as s}from"./util.js";let c=null;c||(c=new function(){this.proxy=t.proxy.bind(this),this.setupWorkerOffscreen=async function(){if(o.getItem("rrv")){const o=r.getEnv(),n=`${e}?env=${o}&rrv=true`;await s.setupOffscreenDocument({path:n,reasons:[chrome.offscreen.Reason.IFRAME_SCRIPTING],justification:"Load iframe in offscreen document"})}},this.closeOffscreenDocument=function(){chrome.offscreen.closeDocument()}}),n.registerHandlers({setupWorkerOffscreen:c.proxy(c.setupWorkerOffscreen),closeOffscreenDocument:c.proxy(c.closeOffscreenDocument)});export const offscreenActions=c;