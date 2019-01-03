using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVCRazorDemo.Models
{
    public class userViewModel
    {
        public int Uid { get; set; }
        [Required(ErrorMessage = "用户名不为空")]
        [MaxLength(8, ErrorMessage = "昵称不超过8个字符!")]
        public string Uname { get; set; }
        [Required(ErrorMessage = "密码必填!")]
        [Display(Name = "密码")]
        [StringLength(100, MinimumLength = 6, ErrorMessage = "密码必须至少包含6个字符!")]
        [DataType(DataType.Password)]
        public string UPassWord { get; set; }
        [Display(Name = "确认密码")]
        [Required(ErrorMessage = "确认密码必填!")]
        [DataType(DataType.Password)]
        [Compare("UPassWord", ErrorMessage = "密码和确认密码不正确!")]
        public string ConfirmPassword { get; set; }
        
    }
}