SET DEFINE OFF;DELETE FROM ALLCODE WHERE 1 = 1 AND NVL(CDNAME,'NULL') = NVL('DEPTCD','NULL') AND NVL(CDTYPE,'NULL') = NVL('SA','NULL');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'MIS', 'Undefined', 0, 'Y', 'Undefined', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'BOF', 'Dịch vụ khách hàng', 1, 'Y', 'Dịch vụ khách hàng', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'ACC', 'Phòng kế toán', 2, 'Y', 'Phòng kế toán', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'ITD', 'Phòng CNTT', 3, 'Y', 'Phòng CNTT', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'DEA', 'Phòng tự doanh', 4, 'Y', 'Phòng tự doanh', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'BRO', 'Bộ phận môi giới', 5, 'Y', 'Bộ phận môi giới', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'RSE', 'Phòng nghiên cứu', 6, 'Y', 'Phòng nghiên cứu', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'TRE', 'Phòng nguồn vốn', 7, 'Y', 'Phòng nguồn vốn', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'BOM', 'Ban giám đốc', 8, 'Y', 'Ban giám đốc', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'HRS', 'Phòng nhân sự', 9, 'Y', 'Phòng nhân sự', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', '000', 'Chung', 10, 'Y', 'Chung', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', '010', 'Trung tâm GD', 11, 'Y', 'Trung tâm GD', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', '011', 'Phòng GD CK', 12, 'Y', 'Phòng GD CK', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', '012', 'Dịch vụ KH', 13, 'Y', 'Dịch vụ KH', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', '013', 'Kế toán GD', 14, 'Y', 'Kế toán GD', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', '020', 'Dịch vụ đầu tư', 15, 'Y', 'Dịch vụ đầu tư', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', '030', 'Tài chính doanh nghiệp', 16, 'Y', 'Tài chính doanh nghiệp', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', '040', 'Thị trường vốn', 17, 'Y', 'Thị trường vốn', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', '050', 'IT/BO', 18, 'Y', 'IT/BO', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', '051', 'IT', 19, 'Y', 'IT', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', '052', 'Giải pháp kinh doanh', 20, 'Y', 'Giải pháp kinh doanh', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', '060', 'Quản lý mạng lưới', 21, 'Y', 'Quản lý mạng lưới', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', '070', 'Quản lý cộng đồng', 22, 'Y', 'Quản lý cộng đồng', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', '080', 'Đạo tạo', 23, 'Y', 'Đạo tạo', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', '090', 'Nhân sự', 24, 'Y', 'Nhân sự', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', '100', 'Hành chính', 25, 'Y', 'Hành chính', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', '110', 'Kế toán', 26, 'Y', 'Kế toán', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', '120', 'Kiểm toán nội bộ', 27, 'Y', 'Kiểm toán nội bộ', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', '130', 'Kiểm soát rủi ro', 28, 'Y', 'Kiểm soát rủi ro', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', '140', 'Pháp chế', 29, 'Y', 'Pháp chế', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', '150', 'Nghiên cứu', 30, 'Y', 'Nghiên cứu', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', '160', 'Hội đồng quản trị', 31, 'Y', 'Hội đồng quản trị', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', '170', 'Ban kiểm soát', 32, 'Y', 'Ban kiểm soát', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', '041', 'Phòng môi giới OTC', 33, 'Y', 'Phòng môi giới OTC', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', '053', 'Thông tin thị trường', 34, 'Y', 'Thông tin thị trường', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', '054', 'Phòng lưu ký', 35, 'Y', 'Phòng lưu ký', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', '055', 'Tự doanh HCM', 36, 'Y', 'Tự doanh HCM', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'P00', 'Phòng chung profit', 37, 'Y', 'Phòng chung profit', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'P01', 'Giám đốc khối IB', 38, 'Y', 'Giám đốc khối IB', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'P02', 'Phòng tài chính doanh nghiệp', 39, 'Y', 'Phòng tài chính doanh nghiệp', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'P03', 'Phòng đầu tư - bảo lãnh phát hành', 40, 'Y', 'Phòng đầu tư - bảo lãnh phát hành', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'P04', 'Phòng dịch vụ tài chính', 41, 'Y', 'Phòng dịch vụ tài chính', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'P05', 'Phòng nguồn vốn', 42, 'Y', 'Phòng nguồn vốn', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'P06', 'Giám đốc khối môi giới', 43, 'Y', 'Giám đốc khối môi giới', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'P07', 'Phòng tư vấn và phân tích đầu tư', 44, 'Y', 'Phòng tư vấn và phân tích đầu tư', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'P08', 'Phòng môi giới', 45, 'Y', 'Phòng môi giới', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'P09', 'Phòng phát triển kinh doanh', 46, 'Y', 'Phòng phát triển kinh doanh', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'P10', 'Phòng giao dịch phi sàn', 47, 'Y', 'Phòng giao dịch phi sàn', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'P11', 'Phòng giao dịch sàn', 48, 'Y', 'Phòng giao dịch sàn', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'C00', 'Phòng chung cost', 49, 'Y', 'Phòng chung cost', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'C01', 'Giám đốc, HĐQT', 50, 'Y', 'Giám đốc, HĐQT', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'C02', 'Phòng kế toán kiểm soát', 51, 'Y', 'Phòng kế toán kiểm soát', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'C03', 'Phòng hành chính tổng hợp', 52, 'Y', 'Phòng hành chính tổng hợp', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'C04', 'Phòng nghiệp vụ', 53, 'Y', 'Phòng nghiệp vụ', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'C05', 'Giám đốc khối', 54, 'Y', 'Giám đốc khối', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'C06', 'Phòng phát triển phần mềm, cơ sở hạ tầng', 55, 'Y', 'Phòng phát triển phần mềm, cơ sở hạ tầng', 'C');Insert into ALLCODE   (CDTYPE, CDNAME, CDVAL, CDCONTENT, LSTODR, CDUSER, EN_CDCONTENT, CHSTATUS) Values   ('SA', 'DEPTCD', 'C07', 'Phòng giải pháp nghiệp vụ', 56, 'Y', 'Phòng giải pháp nghiệp vụ', 'C');COMMIT;