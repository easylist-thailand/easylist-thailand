# Contributing

หากท่านต้องการให้ช่วยบล็อคโฆษณาเว็บไซท์ใด หรือพบปัญหา ณ เว็บไซท์ใด สามารถรายงานมาได้ที่ [Issues](https://github.com/easylist-thailand/easylist-thailand/issues)

## Add rule

ยินดีเป็นอย่างยิ่งสำหรับ Pull Request เพิ่อเพิ่มรายการตัวกรองต่างสำหรับบล็อคโฆษณาเพิ่ม

สามารถเพิ่ม rule ใหม่เข้าไปได้ที่ [./categories](./categories) โดยใส่ในไฟล์ Text (`.txt`) ธรรมดา  
กรุณาจัดแบ่งหมวดหมู่ของ rule ที่เพิ่มใหม่เข้าสู่ไฟล์ใน [./categories](./categories) ตามชนิดของเว็บอย่างเหมาะสม
หากยังไม่มีหมวดหมู่ที่ต้องการ สามารถสร้างไฟล์ใหม่เพื่อเก็บ rule ของคุณได้

## Rule for contributing

- กรุณาใช้ [gitmoji-cli](https://github.com/carloscuesta/gitmoji-cli) ในการ commit เพื่อให้ commit message เป็นไปตามรูปแบบของ [Gitmoji](https://gitmoji.carloscuesta.me/)
- Code ทั้งหมดที่แก้ไขต้องผ่านการ analyze ของ [RuboCop](https://github.com/bbatsov/rubocop) เพื่อให้เป็นไปตาม [Ruby coding style guide](https://github.com/bbatsov/ruby-style-guide)

## Development

```bash
# Install gem
bundle install

# Generate subscription file
bundle exec rake

# Clean subscription file
bundle exec rake clean
```
