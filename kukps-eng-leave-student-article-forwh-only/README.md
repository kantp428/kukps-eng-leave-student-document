# บทความเฉพาะคลังข้อมูลการลานิสิต

ฉบับนี้สรุปโครงสร้าง การออกแบบ ETL ตัวชี้วัด และมุมมอง warehouse ตามบทบาท 6 กลุ่ม อ้างอิงโค้ดใน `C:/Users/winne/Desktop/Web/kukps-eng-leave-request/apps` ตรวจวันที่ 29 ตุลาคม 2569 ไม่รวมเนื้อหากระบวนการอนุมัติ และไม่ใช้ภาพ capture

- ต้นฉบับหลัก: `main.tex` และไฟล์ใน `sections/` ที่ main เรียกใช้
- ฉบับอ่าน: `build/main.pdf`
- หลักฐานและข้อจำกัด: `docs/SOURCE-NOTES.md`
- แผนภาพ: เวกเตอร์ TikZ ใน `sections/appendix-schema-diagrams.tex`

รายงานเว็บปัจจุบันใช้ข้อมูลจำลองผ่าน LiveReportProvider แม้มีบริการอ่าน dw_* ฝั่ง API แล้ว บทความไม่อ้างผลทดลองหรือข้อมูลจริงจากกราฟ และแยกโครงสร้าง wh_* เดิมออกจาก dw_* รุ่นใหม่

คอมไพล์ด้วย `powershell -NoProfile -ExecutionPolicy Bypass -File ./scripts/build.ps1` (XeLaTeX สองรอบ) ไฟล์ .tex ไม่รองรับ Prettier โดยตรง

โฟลเดอร์นี้มีทรัพยากรที่คัดลอกจากบทความต้นฉบับอยู่เดิม เช่นภาพ SQL และ template; ทรัพยากรที่ main.tex ไม่เรียกใช้ไม่ใช่เนื้อหาฉบับ warehouse นี้ ให้ใช้ PDF และเส้นทางหลักฐานฉบับนี้เป็นหลัก

## รูปแบบรายงาน

ปรับตามต้นแบบ basic-latex: Letter คอลัมน์เดียว ระยะขอบ 2.5 ซม. ฟอนต์ TH Sarabun และ JetBrains Mono จากไฟล์ใน fonts/ มีหน้าปก บทคัดย่อ สารบัญ และแยกบท ข้อมูลผู้จัดทำ 4 คนพร้อมรหัสนิสิตอยู่ใน config/metadata.tex ไม่มีชื่ออาจารย์ในฉบับส่งออก
