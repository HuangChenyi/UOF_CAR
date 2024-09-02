﻿//------------------------------------------------------------------------------
// <auto-generated>
//     這段程式碼是由工具產生的。
//     執行階段版本:4.0.30319.42000
//
//     對這個檔案所做的變更可能會造成錯誤的行為，而且如果重新產生程式碼，
//     變更將會遺失。
// </auto-generated>
//------------------------------------------------------------------------------

// 
// 原始程式碼已由 Microsoft.VSDesigner 自動產生，版本 4.0.30319.42000。
// 
#pragma warning disable 1591

namespace WSAPI.DMS {
    using System.Diagnostics;
    using System;
    using System.Xml.Serialization;
    using System.ComponentModel;
    using System.Web.Services.Protocols;
    using System.Web.Services;
    using System.Data;
    
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.9037.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Web.Services.WebServiceBindingAttribute(Name="DmsSoap", Namespace="http://tempuri.org/")]
    public partial class Dms : System.Web.Services.Protocols.SoapHttpClientProtocol {
        
        private System.Threading.SendOrPostCallback AddNewDocOperationCompleted;
        
        private System.Threading.SendOrPostCallback GetFolderTreeOperationCompleted;
        
        private System.Threading.SendOrPostCallback GetFolderIDOperationCompleted;
        
        private System.Threading.SendOrPostCallback GetFolderLimitOperationCompleted;
        
        private System.Threading.SendOrPostCallback GetDocNameDuplicateOperationCompleted;
        
        private bool useDefaultCredentialsSetExplicitly;
        
        /// <remarks/>
        public Dms() {
            this.Url = global::WSAPI.Properties.Settings.Default.WSAPI_DMS_Dms;
            if ((this.IsLocalFileSystemWebService(this.Url) == true)) {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else {
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        public new string Url {
            get {
                return base.Url;
            }
            set {
                if ((((this.IsLocalFileSystemWebService(base.Url) == true) 
                            && (this.useDefaultCredentialsSetExplicitly == false)) 
                            && (this.IsLocalFileSystemWebService(value) == false))) {
                    base.UseDefaultCredentials = false;
                }
                base.Url = value;
            }
        }
        
        public new bool UseDefaultCredentials {
            get {
                return base.UseDefaultCredentials;
            }
            set {
                base.UseDefaultCredentials = value;
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        /// <remarks/>
        public event AddNewDocCompletedEventHandler AddNewDocCompleted;
        
        /// <remarks/>
        public event GetFolderTreeCompletedEventHandler GetFolderTreeCompleted;
        
        /// <remarks/>
        public event GetFolderIDCompletedEventHandler GetFolderIDCompleted;
        
        /// <remarks/>
        public event GetFolderLimitCompletedEventHandler GetFolderLimitCompleted;
        
        /// <remarks/>
        public event GetDocNameDuplicateCompletedEventHandler GetDocNameDuplicateCompleted;
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/AddNewDoc", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public string AddNewDoc(string token, string folderId, string docName, string fileName, bool isPublish, string fileGroupId) {
            object[] results = this.Invoke("AddNewDoc", new object[] {
                        token,
                        folderId,
                        docName,
                        fileName,
                        isPublish,
                        fileGroupId});
            return ((string)(results[0]));
        }
        
        /// <remarks/>
        public void AddNewDocAsync(string token, string folderId, string docName, string fileName, bool isPublish, string fileGroupId) {
            this.AddNewDocAsync(token, folderId, docName, fileName, isPublish, fileGroupId, null);
        }
        
        /// <remarks/>
        public void AddNewDocAsync(string token, string folderId, string docName, string fileName, bool isPublish, string fileGroupId, object userState) {
            if ((this.AddNewDocOperationCompleted == null)) {
                this.AddNewDocOperationCompleted = new System.Threading.SendOrPostCallback(this.OnAddNewDocOperationCompleted);
            }
            this.InvokeAsync("AddNewDoc", new object[] {
                        token,
                        folderId,
                        docName,
                        fileName,
                        isPublish,
                        fileGroupId}, this.AddNewDocOperationCompleted, userState);
        }
        
        private void OnAddNewDocOperationCompleted(object arg) {
            if ((this.AddNewDocCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.AddNewDocCompleted(this, new AddNewDocCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/GetFolderTree", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public System.Data.DataSet GetFolderTree(string token, string folderId) {
            object[] results = this.Invoke("GetFolderTree", new object[] {
                        token,
                        folderId});
            return ((System.Data.DataSet)(results[0]));
        }
        
        /// <remarks/>
        public void GetFolderTreeAsync(string token, string folderId) {
            this.GetFolderTreeAsync(token, folderId, null);
        }
        
        /// <remarks/>
        public void GetFolderTreeAsync(string token, string folderId, object userState) {
            if ((this.GetFolderTreeOperationCompleted == null)) {
                this.GetFolderTreeOperationCompleted = new System.Threading.SendOrPostCallback(this.OnGetFolderTreeOperationCompleted);
            }
            this.InvokeAsync("GetFolderTree", new object[] {
                        token,
                        folderId}, this.GetFolderTreeOperationCompleted, userState);
        }
        
        private void OnGetFolderTreeOperationCompleted(object arg) {
            if ((this.GetFolderTreeCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.GetFolderTreeCompleted(this, new GetFolderTreeCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/GetFolderID", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public string GetFolderID(string token, string folderPathXml) {
            object[] results = this.Invoke("GetFolderID", new object[] {
                        token,
                        folderPathXml});
            return ((string)(results[0]));
        }
        
        /// <remarks/>
        public void GetFolderIDAsync(string token, string folderPathXml) {
            this.GetFolderIDAsync(token, folderPathXml, null);
        }
        
        /// <remarks/>
        public void GetFolderIDAsync(string token, string folderPathXml, object userState) {
            if ((this.GetFolderIDOperationCompleted == null)) {
                this.GetFolderIDOperationCompleted = new System.Threading.SendOrPostCallback(this.OnGetFolderIDOperationCompleted);
            }
            this.InvokeAsync("GetFolderID", new object[] {
                        token,
                        folderPathXml}, this.GetFolderIDOperationCompleted, userState);
        }
        
        private void OnGetFolderIDOperationCompleted(object arg) {
            if ((this.GetFolderIDCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.GetFolderIDCompleted(this, new GetFolderIDCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/GetFolderLimit", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public string[] GetFolderLimit(string token, string folderId) {
            object[] results = this.Invoke("GetFolderLimit", new object[] {
                        token,
                        folderId});
            return ((string[])(results[0]));
        }
        
        /// <remarks/>
        public void GetFolderLimitAsync(string token, string folderId) {
            this.GetFolderLimitAsync(token, folderId, null);
        }
        
        /// <remarks/>
        public void GetFolderLimitAsync(string token, string folderId, object userState) {
            if ((this.GetFolderLimitOperationCompleted == null)) {
                this.GetFolderLimitOperationCompleted = new System.Threading.SendOrPostCallback(this.OnGetFolderLimitOperationCompleted);
            }
            this.InvokeAsync("GetFolderLimit", new object[] {
                        token,
                        folderId}, this.GetFolderLimitOperationCompleted, userState);
        }
        
        private void OnGetFolderLimitOperationCompleted(object arg) {
            if ((this.GetFolderLimitCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.GetFolderLimitCompleted(this, new GetFolderLimitCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/GetDocNameDuplicate", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public bool GetDocNameDuplicate(string token, string folderId, string docName) {
            object[] results = this.Invoke("GetDocNameDuplicate", new object[] {
                        token,
                        folderId,
                        docName});
            return ((bool)(results[0]));
        }
        
        /// <remarks/>
        public void GetDocNameDuplicateAsync(string token, string folderId, string docName) {
            this.GetDocNameDuplicateAsync(token, folderId, docName, null);
        }
        
        /// <remarks/>
        public void GetDocNameDuplicateAsync(string token, string folderId, string docName, object userState) {
            if ((this.GetDocNameDuplicateOperationCompleted == null)) {
                this.GetDocNameDuplicateOperationCompleted = new System.Threading.SendOrPostCallback(this.OnGetDocNameDuplicateOperationCompleted);
            }
            this.InvokeAsync("GetDocNameDuplicate", new object[] {
                        token,
                        folderId,
                        docName}, this.GetDocNameDuplicateOperationCompleted, userState);
        }
        
        private void OnGetDocNameDuplicateOperationCompleted(object arg) {
            if ((this.GetDocNameDuplicateCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.GetDocNameDuplicateCompleted(this, new GetDocNameDuplicateCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        public new void CancelAsync(object userState) {
            base.CancelAsync(userState);
        }
        
        private bool IsLocalFileSystemWebService(string url) {
            if (((url == null) 
                        || (url == string.Empty))) {
                return false;
            }
            System.Uri wsUri = new System.Uri(url);
            if (((wsUri.Port >= 1024) 
                        && (string.Compare(wsUri.Host, "localHost", System.StringComparison.OrdinalIgnoreCase) == 0))) {
                return true;
            }
            return false;
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.9037.0")]
    public delegate void AddNewDocCompletedEventHandler(object sender, AddNewDocCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.9037.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class AddNewDocCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal AddNewDocCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public string Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((string)(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.9037.0")]
    public delegate void GetFolderTreeCompletedEventHandler(object sender, GetFolderTreeCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.9037.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class GetFolderTreeCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal GetFolderTreeCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public System.Data.DataSet Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((System.Data.DataSet)(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.9037.0")]
    public delegate void GetFolderIDCompletedEventHandler(object sender, GetFolderIDCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.9037.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class GetFolderIDCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal GetFolderIDCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public string Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((string)(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.9037.0")]
    public delegate void GetFolderLimitCompletedEventHandler(object sender, GetFolderLimitCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.9037.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class GetFolderLimitCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal GetFolderLimitCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public string[] Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((string[])(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.9037.0")]
    public delegate void GetDocNameDuplicateCompletedEventHandler(object sender, GetDocNameDuplicateCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.9037.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class GetDocNameDuplicateCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal GetDocNameDuplicateCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public bool Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((bool)(this.results[0]));
            }
        }
    }
}

#pragma warning restore 1591