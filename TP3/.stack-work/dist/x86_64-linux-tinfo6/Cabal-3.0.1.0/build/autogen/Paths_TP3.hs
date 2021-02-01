{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_TP3 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/mnt/d/Documentos/Clases/ALP/TP3/.stack-work/install/x86_64-linux-tinfo6/1c042a0244c081b4605779c21b6eb09d4ffe9d6f0f693fe5fa3cbce344e91a45/8.8.3/bin"
libdir     = "/mnt/d/Documentos/Clases/ALP/TP3/.stack-work/install/x86_64-linux-tinfo6/1c042a0244c081b4605779c21b6eb09d4ffe9d6f0f693fe5fa3cbce344e91a45/8.8.3/lib/x86_64-linux-ghc-8.8.3/TP3-0.1.0.0-3wIuWwJF7pK8gcr8VLPaSx"
dynlibdir  = "/mnt/d/Documentos/Clases/ALP/TP3/.stack-work/install/x86_64-linux-tinfo6/1c042a0244c081b4605779c21b6eb09d4ffe9d6f0f693fe5fa3cbce344e91a45/8.8.3/lib/x86_64-linux-ghc-8.8.3"
datadir    = "/mnt/d/Documentos/Clases/ALP/TP3/.stack-work/install/x86_64-linux-tinfo6/1c042a0244c081b4605779c21b6eb09d4ffe9d6f0f693fe5fa3cbce344e91a45/8.8.3/share/x86_64-linux-ghc-8.8.3/TP3-0.1.0.0"
libexecdir = "/mnt/d/Documentos/Clases/ALP/TP3/.stack-work/install/x86_64-linux-tinfo6/1c042a0244c081b4605779c21b6eb09d4ffe9d6f0f693fe5fa3cbce344e91a45/8.8.3/libexec/x86_64-linux-ghc-8.8.3/TP3-0.1.0.0"
sysconfdir = "/mnt/d/Documentos/Clases/ALP/TP3/.stack-work/install/x86_64-linux-tinfo6/1c042a0244c081b4605779c21b6eb09d4ffe9d6f0f693fe5fa3cbce344e91a45/8.8.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "TP3_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "TP3_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "TP3_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "TP3_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "TP3_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "TP3_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
