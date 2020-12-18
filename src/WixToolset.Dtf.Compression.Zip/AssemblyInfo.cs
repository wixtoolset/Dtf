// Copyright (c) .NET Foundation and contributors. All rights reserved. Licensed under the Microsoft Reciprocal License. See LICENSE.TXT file in the project root for full license information.

using System.Diagnostics.CodeAnalysis;

#if NET20
using System.Security;
using System.Security.Permissions;

// SECURITY: The UnmanagedCode assertions in the zip classes are safe, because
// only some very limited date-time unmanaged APIs are called.
[assembly: SecurityPermission(SecurityAction.RequestMinimum, Assertion = true, UnmanagedCode = true)]

// SECURITY: Review carefully!
// This assembly is designed so that partially trusted callers should be able to
// do zip compression and extraction in a file path where they have limited
// file I/O permission. Or they can even do in-memory compression and extraction
// with absolutely no file I/O permission.
[assembly: AllowPartiallyTrustedCallers]
#endif

[assembly: SuppressMessage("Microsoft.Design", "CA1020:AvoidNamespacesWithFewTypes", Scope = "namespace", Target = "WixToolset.Dtf.Compression.Zip")]
