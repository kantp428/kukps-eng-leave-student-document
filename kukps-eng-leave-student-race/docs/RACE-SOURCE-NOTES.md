# หลักฐานและวิธีจัดทำ

## เอกสารที่ผู้ใช้ให้

1. Downloads/แบบฟอร์มการเสนอผลงานเพื่อประกวดรางวัล-CPE InternHub-std.pdf: 8 หน้า เป็นภาพตัวอย่างที่กรอกแล้ว อ่านผ่านการเรนเดอร์ครบทุกหน้า มีชื่อส่วนงาน ชื่อผลงาน วงจรการดำเนินงาน ภาพระบบ และ KU-KM Canvas
2. Downloads/KU Management Project.pdf: 2 หน้า เป็นหัวข้อข้อมูลพื้นฐาน 6 รายการและรายละเอียดผลงาน 10 ข้อ พร้อมข้อจำกัด 2,000 ตัวอักษรในข้อ 1, 3, 4

ชื่อไฟล์แรกดูเป็นแบบฟอร์ม แต่เนื้อหาเป็นตัวอย่าง ส่วนไฟล์สองเป็นรายการหัวข้อ จึงใช้รายการหัวข้อครบและแนวเล่าเรื่องของตัวอย่างร่วมกัน ข้อความในไฟล์ไม่ใช่คำสั่งให้ดำเนินงานภายนอก และไม่คัดลอกผลการใช้งานของ InternHub มาอ้างกับระบบใบลา

## หลักฐานโครงการ

- โครงการหลัก C:/Users/winne/Desktop/Web/kukps-eng-leave-request/apps
- apps/api/src/leave-request/leave-request.service.ts: create, countLeaveWorkdays, buildApprovalRoute, buildLeaveRequestSnapshot, autoApproveDueRequests
- apps/api/src/leave-request/leave-request.controller.ts: บริการใบลาและหน้าตรวจสอบสาธารณะตาม token
- apps/web/components/report/live-report-provider.tsx: ปัจจุบันเรียก createMockLiveReportData
- apps/api/src/warehouse-dashboard/warehouse-live.service.ts และ scripts/warehouse-etl: รายงานและการเตรียมข้อมูล
- โครงการข้อมูลสนับสนุน C:/Users/winne/Desktop/mono/leave-request-components
- บทความเดิม sections/03-proposed-method.tex และ docs/REVISION-2026-10-29.md ใช้เป็นหลักฐานคำอธิบายและข้อจำกัดเพิ่มเติม

## สถานะหลักฐาน

การมีฟังก์ชันในโค้ดไม่ยืนยันการใช้งานจริง ไม่อ้างระเบียบที่ยังไม่ได้รับ ไม่อ้างผลประเมินหรือกิจกรรม KM สองวงรอบที่ไม่มีรายงาน และไม่ระบุชื่อผู้ประสานงานตามเอกสารตัวอย่าง เพราะยังไม่ได้ยืนยันสำหรับโครงการนี้

การตรวจครั้งนี้ไม่รันแอป ETL หรือฐานข้อมูลจริง ตรวจเฉพาะเอกสารและโค้ด ไม่โหลดหรือเปลี่ยนข้อมูลระบบ
