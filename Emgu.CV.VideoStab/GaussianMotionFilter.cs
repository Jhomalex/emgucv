﻿//----------------------------------------------------------------------------
//  Copyright (C) 2004-2012 by EMGU. All rights reserved.       
//----------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Text;
using Emgu.Util;

namespace Emgu.CV.VideoStab
{
   public class GaussianMotionFilter : UnmanagedObject
   {
      public GaussianMotionFilter()
         : this(15, -1.0f)
      {
      }

      public GaussianMotionFilter(int radius, float stdev)
      {
         _ptr = VideoStabInvoke.GaussianMotionFilterCreate(radius, stdev);
      }

      protected override void DisposeObject()
      {
         VideoStabInvoke.GaussianMotionFilterRelease(ref _ptr);
      }
   }
}
