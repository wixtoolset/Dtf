// Copyright (c) .NET Foundation and contributors. All rights reserved. Licensed under the Microsoft Reciprocal License. See LICENSE.TXT file in the project root for full license information.

using System.Diagnostics.CodeAnalysis;

#if NET20
using System.Security;
using System.Security.Permissions;

// SECURITY: The UnmanagedCode assertions in the resource classes are safe, because
// appropriate demands are made for file I/O permissions before reading/writing files.
[assembly: SecurityPermission(SecurityAction.RequestMinimum, Assertion = true, UnmanagedCode = true)]

// SECURITY: Review carefully!
// This assembly is designed so that partially trusted callers should be able to
// read and write file version info in a path where they have limited
// file I/O permission.
[assembly: AllowPartiallyTrustedCallers]
#endif


[assembly: SuppressMessage("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes", Scope = "member", Target = "WixToolset.Dtf.Resources.ResourceCollection.#System.Collections.Generic.ICollection`1<WixToolset.Dtf.Resources.Resource>.IsReadOnly")]
