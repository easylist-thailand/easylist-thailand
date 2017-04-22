# EasyList Thailand
[![license](https://img.shields.io/github/license/easylist-thailand/easylist-thailand.svg?style=flat-square)](https://github.com/easylist-thailand/easylist-thailand/blob/master/LICENSE)
[![EasyList](https://img.shields.io/badge/EasyList-Thailand-2e8b57.svg?style=flat-square)](https://easylist-thailand.github.io/)

รายการตัวกรอง **EasyList** สำหรับประเทศไทย  
ช่วยคุณปิดกั้นโฆษณาทั้งหลายในเว็บต่างๆของประเทศไทย

## การติดตั้ง

ติดตั้ง [Adblock Plus](https://adblockplus.org/) หรือ [uBlock Origin](https://github.com/gorhill/uBlock/#installation)

จากนั้นก็เพิ่มไฟล์ Subscription [easylist-thailand.txt](./subscription/easylist-thailand.txt) เข้าสู่ Adblock Plus หรือ uBlock Origin ของท่าน

## การพัฒนา

```bash
# Install gem
bundle install

# Generate subscription file
rake

# Clean subscription file
rake clean
```
