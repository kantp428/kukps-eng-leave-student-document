# หลักฐานของฉบับ Warehouse

ตรวจโค้ดเมื่อ 29 ตุลาคม 2569 ใน C:/Users/winne/Desktop/Web/kukps-eng-leave-request

| ประเด็น                  | แหล่งหลักฐาน                                                                                                              |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------- |
| มิติและการเชื่อมรหัส     | apps/api/scripts/warehouse-etl/model.mjs                                                                                  |
| สกัด แปลง โหลด           | apps/api/scripts/warehouse-etl/extract.mjs, transform.mjs, load.mjs                                                       |
| โครงสร้างเดิม wh_*       | apps/api/prisma/warehouse.prisma                                                                                          |
| สคีมารุ่นใหม่และ grain   | docs/report-warehouse/01-schema.sql (ประกอบการอ่านโค้ด ETL)                                                               |
| ขอบเขตสิทธิ์ทั้ง 6 บทบาท | apps/api/src/warehouse-dashboard/warehouse-live.service.ts                                                                |
| ตัวแปลงข้อมูลรายงาน      | apps/web/lib/live-report-data.ts                                                                                          |
| สถานะข้อมูลจำลอง         | apps/web/components/report/live-report-provider.tsx เรียก createMockLiveReportData()                                      |
| นิสิต                    | apps/web/app/student/report/page.tsx                                                                                      |
| ที่ปรึกษาและรายละเอียด   | apps/web/app/user/report/advisor/page.tsx และ advisor/[id]/page.tsx                                                       |
| ผู้สอนและรายละเอียด      | apps/web/app/user/report/lecturer/page.tsx, lecturer/[subjectCode]/page.tsx และ lecturer/attendance/[offeringId]/page.tsx |
| หัวหน้าภาค               | apps/web/app/user/report/department-head/page.tsx                                                                         |
| ผู้บริหาร                | apps/web/app/user/report/executive/page.tsx และ executive/department/[departmentId]/page.tsx                              |
| เจ้าหน้าที่              | apps/web/app/user/report/admin/page.tsx                                                                                   |

ข้อสังเกตที่ต้องรักษาในบทความ:

1. หน้าเว็บยังใช้ mock จึงไม่ยืนยันผลจากฐานข้อมูลจริง
2. dw_fact_leave_request หนึ่งแถวต่อใบลา; dw_fact_leave_subject หนึ่งแถวต่อใบลา/offering
3. วันตามปฏิทิน ครั้งเรียน และชั่วโมงเรียนเป็นคนละหน่วย
4. ตัวแปลงมีการแปลง NULL บางค่าเป็นศูนย์ ต้องปรับหรือแสดง coverage ก่อนใช้อ่านผลกระทบจริง
5. service อ่านหลาย query แบบขนานและมี cache ไม่ได้ยืนยัน snapshot transaction เดียวจากการตรวจส่วนนี้
6. สิทธิ์ปัจจุบันกับบริบทที่เก็บ ณ ยื่นเป็นคนละมิติ
7. Admin ปัจจุบันใช้ major_id จากบัญชี ไม่ใช่สิทธิ์ทุกมหาวิทยาลัย
8. ไม่รันแอป ETL หรือ query ฐานจริงในการทำเอกสาร ไม่แต่งผลทดลอง
9. ตัดเนื้อหากระบวนการอนุมัติและตัวชี้วัดเวลาการอนุมัติออกจากบทความฉบับนี้
