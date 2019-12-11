#
# Career Guidance Tool, a shiny based application
#
# CLick the Run App button above to execute the application
#

library(shiny)
library(data.table)
library(maps)
library(ggplot2)
library(tidyverse)
library(ggrepel)
library(scales)
library(DT)
library(plotly)
library(leaflet)
library(shinythemes)
library(rsconnect)
library(shinydashboard)
library(unrtf)

ui <- dashboardPage(

  dashboardHeader(title = "Career Guidance Tool"),
  dashboardSidebar(tags$style(HTML("
      .main-sidebar{
        width: 264px;
      }
    ")),
            selectInput("course",
                        "Course Of Study:",
                        choices = c("ALL" = "0000", "Accounting and Computer Science." = "3016"
                                    , "Accounting and Related Services." = "5203"
                                    , "Advanced/Graduate Dentistry and Oral Sciences." = "5105"
                                    , "Aerospace, Aeronautical and Astronautical Engineering." = "1402"
                                    , "African Languages, Literatures, and Linguistics." = "1602"
                                    , "Agricultural and Domestic Animal Services." = "0105"
                                    , "Agricultural and Food Products Processing." = "0104"
                                    , "Agricultural Business and Management." = "0101"
                                    , "Agricultural Engineering." = "1403"
                                    , "Agricultural Mechanization." = "0102"
                                    , "Agricultural Production Operations." = "0103"
                                    , "Agricultural Public Services." = "0108"
                                    , "Agriculture, Agriculture Operations, and Related Sciences, Other." = "0199"
                                    , "Agriculture, General." = "0100"
                                    , "Air Force ROTC, Air Science and Operations." = "2801"
                                    , "Air Transportation." = "4901"
                                    , "Allied Health and Medical Assisting Services." = "5108"
                                    , "Allied Health Diagnostic, Intervention, and Treatment Professions." = "5109"
                                    , "Alternative and Complementary Medical Support Services." = "5134"
                                    , "Alternative and Complementary Medicine and Medical Systems." = "5133"
                                    , "American Indian/Native American Languages, Literatures, and Linguistics." = "1610"
                                    , "American Sign Language." = "1616"
                                    , "Animal Sciences." = "0109"
                                    , "Anthropology." = "4502"
                                    , "Apparel and Textiles." = "1909"
                                    , "Applied Horticulture and Horticultural Business Services." = "0106"
                                    , "Applied Mathematics." = "2703"
                                    , "Archeology." = "4503"
                                    , "Architectural Engineering Technologies/Technicians." = "1501"
                                    , "Architectural Engineering." = "1404"
                                    , "Architectural History and Criticism." = "0408"
                                    , "Architectural Sciences and Technology." = "0409"
                                    , "Architecture and Related Services, Other." = "0499"
                                    , "Architecture." = "0402"
                                    , "Area Studies." = "0501"
                                    , "Army ROTC, Military Science and Operations." = "2803"
                                    , "Arts, Entertainment,and Media Management." = "5010"
                                    , "Astronomy and Astrophysics." = "4002"
                                    , "Atmospheric Sciences and Meteorology." = "4004"
                                    , "Audiovisual Communications Technologies/Technicians." = "1002"
                                    , "Basic Skills and Developmental/Remedial Education." = "3201"
                                    , "Behavioral Sciences." = "3017"
                                    , "Bible/Biblical Studies." = "3902"
                                    , "Bilingual, Multilingual, and Multicultural Education." = "1302"
                                    , "Biochemical Engineering." = "1443"
                                    , "Biochemistry, Biophysics and Molecular Biology." = "2602"
                                    , "Bioethics/Medical Ethics." = "5132"
                                    , "Biological and Biomedical Sciences, Other." = "2699"
                                    , "Biological and Physical Sciences." = "3001"
                                    , "Biological/Biosystems Engineering." = "1445"
                                    , "Biology Technician/Biotechnology Laboratory Technician." = "4101"
                                    , "Biology, General." = "2601"
                                    , "Biomathematics, Bioinformatics, and Computational Biology." = "2611"
                                    , "Biomedical/Medical Engineering." = "1405"
                                    , "Biopsychology." = "3010"
                                    , "Biotechnology." = "2612"
                                    , "Boilermaking/Boilermaker." = "4808"
                                    , "Botany/Plant Biology." = "2603"
                                    , "Building/Construction Finishing, Management, and Inspection." = "4604"
                                    , "Business Administration, Management and Operations." = "5202"
                                    , "Business Operations Support and Assistant Services." = "5204"
                                    , "Business, Management, Marketing, and Related Support Services, Other." = "5299"
                                    , "Business/Commerce, General." = "5201"
                                    , "Business/Corporate Communications." = "5205"
                                    , "Business/Managerial Economics." = "5206"
                                    , "Carpenters." = "4602"
                                    , "Cell/Cellular Biology and Anatomical Sciences." = "2604"
                                    , "Celtic Languages, Literatures, and Linguistics." = "1613"
                                    , "Ceramic Sciences and Engineering." = "1406"
                                    , "Chemical Engineering." = "1407"
                                    , "Chemistry." = "4005"
                                    , "Chiropractic." = "5101"
                                    , "Citizenship Activities." = "3301"
                                    , "City/Urban, Community and Regional Planning." = "0403"
                                    , "Civil Engineering Technologies/Technicians." = "1502"
                                    , "Civil Engineering." = "1408"
                                    , "Classical and Ancient Studies." = "3022"
                                    , "Classics and Classical Languages, Literatures, and Linguistics." = "1612"
                                    , "Clinical Psychology." = "4202"
                                    , "Clinical, Counseling and Applied Psychology." = "4228"
                                    , "Clinical/Medical Laboratory Science/Research and Allied Professions." = "5110"
                                    , "Cognitive Psychology and Psycholinguistics." = "4203"
                                    , "Cognitive Science." = "3025"
                                    , "Communication and Media Studies." = "0901"
                                    , "Communication Disorders Sciences and Services." = "5102"
                                    , "Communication, Journalism, and Related Programs, Other." = "0999"
                                    , "Communications Technologies/Technicians and Support Services, Other." = "1099"
                                    , "Communications Technology/Technician." = "1001"
                                    , "Community Organization and Advocacy." = "4402"
                                    , "Computational Science." = "3030"
                                    , "Computer and Information Sciences and Support Services, Other." = "1199"
                                    , "Computer and Information Sciences, General." = "1101"
                                    , "Computer Engineering Technologies/Technicians." = "1512"
                                    , "Computer Engineering." = "1409"
                                    , "Computer Programming." = "1102"
                                    , "Computer Science." = "1107"
                                    , "Computer Software and Media Applications." = "1108"
                                    , "Computer Systems Analysis." = "1105"
                                    , "Computer Systems Networking and Telecommunications." = "1109"
                                    , "Computer/Information Technology Administration and Management." = "1110"
                                    , "Construction Engineering Technologies." = "1510"
                                    , "Construction Engineering." = "1433"
                                    , "Construction Management." = "5220"
                                    , "Construction Trades, General." = "4600"
                                    , "Construction Trades, Other." = "4699"
                                    , "Cosmetology and Related Personal Grooming Services." = "1204"
                                    , "Counseling Psychology." = "4206"
                                    , "Crafts/Craft Design, Folk Art and Artisanry." = "5002"
                                    , "Creative Writing." = "2305"
                                    , "Criminal Justice and Corrections." = "4301"
                                    , "Criminology." = "4504"
                                    , "Culinary Arts and Related Services." = "1205"
                                    , "Cultural Studies/Critical Theory and Analysis." = "3026"
                                    , "Curriculum and Instruction." = "1303"
                                    , "Dance." = "5003"
                                    , "Data Entry/Microcomputer Applications." = "1106"
                                    , "Data Processing." = "1103"
                                    , "Demography and Population Studies." = "4505"
                                    , "Dental Residency Programs." = "6001"
                                    , "Dental Support Services and Allied Professions." = "5106"
                                    , "Dentistry." = "5104"
                                    , "Design and Applied Arts." = "5004"
                                    , "Developmental and Child Psychology." = "4207"
                                    , "Dietetics and Clinical Nutrition Services." = "5131"
                                    , "Dispute Resolution." = "3028"
                                    , "Drafting/Design Engineering Technologies/Technicians." = "1513"
                                    , "Drama/Theatre Arts and Stagecraft." = "5005"
                                    , "East Asian Languages, Literatures, and Linguistics." = "1603"
                                    , "Ecology, Evolution, Systematics, and Population Biology." = "2613"
                                    , "Economics." = "4506"
                                    , "Education, General." = "1301"
                                    , "Education, Other." = "1399"
                                    , "Educational Administration and Supervision." = "1304"
                                    , "Educational Assessment, Evaluation, and Research." = "1306"
                                    , "Educational Psychology." = "4218"
                                    , "Educational/Instructional Media Design." = "1305"
                                    , "Electrical and Power Transmission Installers." = "4603"
                                    , "Electrical Engineering Technologies/Technicians." = "1503"
                                    , "Electrical, Electronics and Communications Engineering." = "1410"
                                    , "Electrical/Electronics Maintenance and Repair Technology." = "4701"
                                    , "Electromechanical Engineering." = "1441"
                                    , "Electromechanical Instrumentation and Maintenance Technologies/Technicians." = "1504"
                                    , "Energy and Biologically Based Therapies." = "5137"
                                    , "Engineering Chemistry." = "1444"
                                    , "Engineering Mechanics." = "1411"
                                    , "Engineering Physics." = "1412"
                                    , "Engineering Science." = "1413"
                                    , "Engineering Technologies/Technicians, Other." = "1599"
                                    , "Engineering Technology, General." = "1500"
                                    , "Engineering-Related Fields." = "1515"
                                    , "Engineering-Related Technologies." = "1511"
                                    , "Engineering, General." = "1401"
                                    , "Engineering, Other." = "1499"
                                    , "English Language and Literature, General." = "2301"
                                    , "English Language and Literature/Letters, Other." = "2399"
                                    , "Entrepreneurial and Small Business Operations." = "5207"
                                    , "Environmental Control Technologies/Technicians." = "1505"
                                    , "Environmental Design." = "0404"
                                    , "Environmental/Environmental Health Engineering." = "1414"
                                    , "Ethnic, Cultural Minority, Gender, and Group Studies." = "0502"
                                    , "Family and Consumer Economics and Related Studies." = "1904"
                                    , "Family and Consumer Sciences/Human Sciences Business Services." = "1902"
                                    , "Family and Consumer Sciences/Human Sciences, General." = "1901"
                                    , "Family and Consumer Sciences/Human Sciences, Other." = "1999"
                                    , "Film/Video and Photographic Arts." = "5006"
                                    , "Finance and Financial Management Services." = "5208"
                                    , "Fine and Studio Arts." = "5007"
                                    , "Fire Protection." = "4302"
                                    , "Fishing and Fisheries Sciences and Management." = "0303"
                                    , "Food Science and Technology." = "0110"
                                    , "Foods, Nutrition, and Related Services." = "1905"
                                    , "Foreign Languages, Literatures, and Linguistics, Other." = "1699"
                                    , "Forest Engineering." = "1434"
                                    , "Forestry." = "0305"
                                    , "Funeral Service and Mortuary Science." = "1203"
                                    , "General Sales, Merchandising and Related Marketing Operations." = "5218"
                                    , "Genetics." = "2608"
                                    , "Geography and Cartography." = "4507"
                                    , "Geological and Earth Sciences/Geosciences." = "4006"
                                    , "Geological/Geophysical Engineering." = "1439"
                                    , "Germanic Languages, Literatures, and Linguistics." = "1605"
                                    , "Gerontology." = "3011"
                                    , "Graphic Communications." = "1003"
                                    , "Ground Transportation." = "4902"
                                    , "Health Aides/Attendants/Orderlies." = "5126"
                                    , "Health and Medical Administrative Services." = "5107"
                                    , "Health and Physical Education/Fitness." = "3105"
                                    , "Health Professions and Related Clinical Sciences, Other." = "5199"
                                    , "Health Services/Allied Health/Health Sciences, General." = "5100"
                                    , "Health-Related Knowledge and Skills." = "3401"
                                    , "Health/Medical Preparatory Programs." = "5111"
                                    , "Heating, Air Conditioning, Ventilation and Refrigeration Maintenance Technology/Technician (HAC, HACR, HVAC, HVACR)." = "4702"
                                    , "Heavy/Industrial Equipment Maintenance Technologies." = "4703"
                                    , "High School/Secondary Certificate Programs." = "5302"
                                    , "High School/Secondary Diploma Programs." = "5301"
                                    , "Historic Preservation and Conservation." = "3012"
                                    , "History." = "5401"
                                    , "Holocaust and Related Studies." = "3021"
                                    , "Homeland Security, Law Enforcement, Firefighting and Related Protective Services, Other." = "4399"
                                    , "Homeland Security." = "4303"
                                    , "Hospitality Administration/Management." = "5209"
                                    , "Housing and Human Environments." = "1906"
                                    , "Human Biology." = "3027"
                                    , "Human Computer Interaction." = "3031"
                                    , "Human Development, Family Studies, and Related Services." = "1907"
                                    , "Human Resources Management and Services." = "5210"
                                    , "Human Services, General." = "4400"
                                    , "Industrial Engineering." = "1435"
                                    , "Industrial Production Technologies/Technicians." = "1506"
                                    , "Information Science/Studies." = "1104"
                                    , "Insurance." = "5217"
                                    , "Intelligence, Command Control and Information Operations." = "2902"
                                    , "Intercultural/Multicultural and Diversity Studies." = "3023"
                                    , "Interior Architecture." = "0405"
                                    , "International Agriculture." = "0107"
                                    , "International and Comparative Education." = "1307"
                                    , "International Business." = "5211"
                                    , "International Relations and National Security Studies." = "4509"
                                    , "International/Global Studies." = "3020"
                                    , "Interpersonal and Social Skills." = "3501"
                                    , "Iranian/Persian Languages, Literatures, and Linguistics." = "1608"
                                    , "Journalism." = "0904"
                                    , "Landscape Architecture." = "0406"
                                    , "Law." = "2201"
                                    , "Leatherworking and Upholstery." = "4803"
                                    , "Legal Professions and Studies, Other." = "2299"
                                    , "Legal Research and Advanced Professional Studies." = "2202"
                                    , "Legal Support Services." = "2203"
                                    , "Leisure and Recreational Activities." = "3601"
                                    , "Liberal Arts and Sciences, General Studies and Humanities." = "2401"
                                    , "Library and Archives Assisting." = "2503"
                                    , "Library Science and Administration." = "2501"
                                    , "Library Science, Other." = "2599"
                                    , "Linguistic, Comparative, and Related Language Studies and Services." = "1601"
                                    , "Literature." = "2314"
                                    , "Management Information Systems and Services." = "5212"
                                    , "Management Sciences and Quantitative Methods." = "5213"
                                    , "Manufacturing Engineering." = "1436"
                                    , "Marine Sciences." = "3032"
                                    , "Marine Transportation." = "4903"
                                    , "Maritime Studies." = "3029"
                                    , "Marketing." = "5214"
                                    , "Mason/Masonry." = "4601"
                                    , "Materials Engineering" = "1418"
                                    , "Materials Sciences." = "4010"
                                    , "Mathematics and Computer Science." = "3008"
                                    , "Mathematics and Statistics, Other." = "2799"
                                    , "Mathematics." = "2701"
                                    , "Mechanic and Repair Technologies/Technicians, Other." = "4799"
                                    , "Mechanical Engineering Related Technologies/Technicians." = "1508"
                                    , "Mechanical Engineering." = "1419"
                                    , "Mechanics and Repairers, General." = "4700"
                                    , "Mechatronics, Robotics, and Automation Engineering." = "1442"
                                    , "Medical Clinical Sciences/Graduate Medical Studies." = "5114"
                                    , "Medical Illustration and Informatics." = "5127"
                                    , "Medical Residency Programs - General Certificates." = "6004"
                                    , "Medical Residency Programs - Subspecialty Certificates." = "6005"
                                    , "Medical Residency Programs." = "6002"
                                    , "Medicine." = "5112"
                                    , "Medieval and Renaissance Studies." = "3013"
                                    , "Mental and Social Health Services and Allied Professions." = "5115"
                                    , "Metallurgical Engineering." = "1420"
                                    , "Microbiological Sciences and Immunology." = "2605"
                                    , "Middle/Near Eastern and Semitic Languages, Literatures, and Linguistics." = "1611"
                                    , "Military Applied Sciences." = "2903"
                                    , "Military Science and Operational Studies." = "2805"
                                    , "Military Systems and Maintenance Technology." = "2904"
                                    , "Military Technologies and Applied Sciences, Other." = "2999"
                                    , "Mining and Mineral Engineering." = "1421"
                                    , "Mining and Petroleum Technologies/Technicians." = "1509"
                                    , "Missions/Missionary Studies and Missiology." = "3903"
                                    , "Modern Greek Language and Literature." = "1606"
                                    , "Molecular Medicine." = "2614"
                                    , "Movement and Mind-Body Therapies and Education." = "5136"
                                    , "Multi-/Interdisciplinary Studies, General." = "3000"
                                    , "Multi/Interdisciplinary Studies, Other." = "3099"
                                    , "Museology/Museum Studies." = "3014"
                                    , "Music." = "5009"
                                    , "Nanotechnology." = "1516"
                                    , "Natural Resources and Conservation, Other." = "0399"
                                    , "Natural Resources Conservation and Research." = "0301"
                                    , "Natural Resources Management and Policy." = "0302"
                                    , "Natural Sciences." = "3018"
                                    , "Naval Architecture and Marine Engineering." = "1422"
                                    , "Neurobiology and Neurosciences." = "2615"
                                    , "Neuroscience." = "3024"
                                    , "Non-Professional General Legal Studies (Undergraduate)." = "2200"
                                    , "Nuclear and Industrial Radiologic Technologies/Technicians." = "4102"
                                    , "Nuclear Engineering Technologies/Technicians." = "1514"
                                    , "Nuclear Engineering." = "1423"
                                    , "Nursing." = "5116"
                                    , "Nutrition Sciences." = "3019"
                                    , "Ocean Engineering." = "1424"
                                    , "Operations Research." = "1437"
                                    , "Ophthalmic and Optometric Support Services and Allied Professions." = "5118"
                                    , "Optometry." = "5117"
                                    , "Osteopathic Medicine/Osteopathy." = "5119"
                                    , "Outdoor Education." = "3106"
                                    , "Paper Science and Engineering." = "1440"
                                    , "Parks, Recreation and Leisure Facilities Management." = "3103"
                                    , "Parks, Recreation and Leisure Studies." = "3101"
                                    , "Parks, Recreation, Leisure, and Fitness Studies, Other." = "3199"
                                    , "Pastoral Counseling and Specialized Ministries." = "3907"
                                    , "Peace Studies and Conflict Resolution." = "3005"
                                    , "Personal and Culinary Services, Other." = "1299"
                                    , "Personal Awareness and Self-Improvement." = "3701"
                                    , "Petroleum Engineering." = "1425"
                                    , "Pharmacology and Toxicology." = "2610"
                                    , "Pharmacy, Pharmaceutical Sciences, and Administration." = "5120"
                                    , "Philosophy and Religious Studies, General." = "3800"
                                    , "Philosophy and Religious Studies, Other." = "3899"
                                    , "Philosophy." = "3801"
                                    , "Physical Science Technologies/Technicians." = "4103"
                                    , "Physical Sciences, Other." = "4099"
                                    , "Physical Sciences." = "4001"
                                    , "Physics." = "4008"
                                    , "Physiological Psychology/Psychobiology." = "4211"
                                    , "Physiology, Pathology and Related Sciences." = "2609"
                                    , "Plant Sciences." = "0111"
                                    , "Plumbing and Related Water Supply Services." = "4605"
                                    , "Podiatric Medicine/Podiatry." = "5121"
                                    , "Political Science and Government." = "4510"
                                    , "Polymer/Plastics Engineering." = "1432"
                                    , "Practical Nursing, Vocational Nursing and Nursing Assistants." = "5139"
                                    , "Precision Metal Working." = "4805"
                                    , "Precision Production Trades, General." = "4800"
                                    , "Precision Production, Other." = "4899"
                                    , "Precision Systems Maintenance and Repair Technologies." = "4704"
                                    , "Psychology, General." = "4201"
                                    , "Psychology, Other." = "4299"
                                    , "Public Administration and Social Service Professions, Other." = "4499"
                                    , "Public Administration." = "4404"
                                    , "Public Health." = "5122"
                                    , "Public Policy Analysis." = "4405"
                                    , "Public Relations, Advertising, and Applied Communication." = "0909"
                                    , "Publishing." = "0910"
                                    , "Quality Control and Safety Technologies/Technicians." = "1507"
                                    , "Radio, Television, and Digital Communication." = "0907"
                                    , "Real Estate Development." = "0410"
                                    , "Real Estate." = "5215"
                                    , "Registered Nursing, Nursing Administration, Nursing Research and Clinical Nursing." = "5138"
                                    , "Rehabilitation and Therapeutic Professions." = "5123"
                                    , "Religion/Religious Studies." = "3802"
                                    , "Religious Education." = "3904"
                                    , "Religious/Sacred Music." = "3905"
                                    , "Research and Experimental Psychology." = "4227"
                                    , "Rhetoric and Composition/Writing Studies." = "2313"
                                    , "Romance Languages, Literatures, and Linguistics." = "1609"
                                    , "Rural Sociology." = "4514"
                                    , "Science Technologies/Technicians, General." = "4100"
                                    , "Science Technologies/Technicians, Other." = "4199"
                                    , "Science, Technology and Society." = "3015"
                                    , "Security Policy and Strategy." = "2806"
                                    , "Slavic, Baltic and Albanian Languages, Literatures, and Linguistics." = "1604"
                                    , "Social and Philosophical Foundations of Education." = "1309"
                                    , "Social Psychology." = "4216"
                                    , "Social Sciences, General." = "4501"
                                    , "Social Sciences, Other." = "4599"
                                    , "Social Work." = "4407"
                                    , "Sociology and Anthropology." = "4513"
                                    , "Sociology." = "4511"
                                    , "Soil Sciences." = "0112"
                                    , "Somatic Bodywork and Related Therapeutic Services." = "5135"
                                    , "South Asian Languages, Literatures, and Linguistics." = "1607"
                                    , "Southeast Asian and Australasian/Pacific Languages, Literatures, and Linguistics." = "1614"
                                    , "Special Education and Teaching." = "1310"
                                    , "Specialized Sales, Merchandising and  Marketing Operations." = "5219"
                                    , "Specialized Sales, Merchandising and Marketing Operations." = "5219"
                                    , "Statistics." = "2705"
                                    , "Student Counseling and Personnel Services." = "1311"
                                    , "Surveying Engineering." = "1438"
                                    , "Sustainability Studies." = "3033"
                                    , "Systems Engineering." = "1427"
                                    , "Systems Science and Theory." = "3006"
                                    , "Taxation." = "5216"
                                    , "Teacher Education and Professional Development, Specific Levels and Methods." = "1312"
                                    , "Teacher Education and Professional Development, Specific Subject Areas." = "1313"
                                    , "Teaching Assistants/Aides." = "1315"
                                    , "Teaching English or French as a Second or Foreign Language." = "1314"
                                    , "Telecommunications Management." = "5221"
                                    , "Textile Sciences and Engineering." = "1428"
                                    , "Theological and Ministerial Studies." = "3906"
                                    , "Theology and Religious Vocations, Other." = "3999"
                                    , "Transportation and Materials Moving, Other." = "4999"
                                    , "Turkic, Uralic-Altaic, Caucasian, and Central Asian Languages, Literatures, and Linguistics." = "1615"
                                    , "Urban Studies/Affairs." = "4512"
                                    , "Vehicle Maintenance and Repair Technologies." = "4706"
                                    , "Veterinary Biomedical and Clinical Sciences." = "5125"
                                    , "Veterinary Medicine." = "5124"
                                    , "Veterinary Residency Programs." = "6003"
                                    , "Visual and Performing Arts, General." = "5001"
                                    , "Visual and Performing Arts, Other." = "5099"
                                    , "Wildlife and Wildlands Science and Management." = "0306"
                                    , "Woodworking." = "4807"
                                    , "Work and Family Studies." = "1900"
                                    , "Zoology/Animal Biology." = "2607"
                        ), selected = "0000"),
            sliderInput("maxrank" ,"Number of Top Colleges to Display", min = 1, max = 10, value = 10),
            radioButtons("rank","Rank by",
                         choiceNames = list(
                "Earning/Cost",
                "Earning",
                "Cost"
            ),
            choiceValues = list(
                "0", "1", "2")),
            checkboxGroupInput("degree","Choose which Degree(s) to Rank",
                        choices = c("ALL" = "0",
                                     "Associate's" = "2",
                                    "Bachelor" = "3",
                                    "Master's" = "5",
                                    "Doctoral" = "6",
                                    "First Professional" = "7",
                                    "Undergraduate Certifiate or Diploma" = "1",
                                    "Post-baccalaureate Certifiate" = "4",
                                    "Graduate/Professional Certificate" = "8"
                                    ), selected = "0"),
            selectInput("state","Choose a US State",
                        choices = c("ALL"="0",
                                    "Alabama" = "AL",
                                    "Alaska" = "AK",
                                    "Arizona" = "AZ",
                                    "Arkansas" = "AR",
                                    "California" = "CA",
                                    "Colorado" = "CO",
                                    "Connecticut" = "CT",
                                    "Delaware" = "DE",
                                    "Florida" = "FL",
                                    "Georgia" = "GA",
                                    "Hawaii" = "HI",
                                    "Idaho" = "ID",
                                    "Illinois" = "IL",
                                    "Indiana" = "IN",
                                    "Iowa" = "IA",
                                    "Kansas" = "KS",
                                    "Kentucky" = "KY",
                                    "Louisiana" = "LA",
                                    "Maine" = "ME",
                                    "Maryland" = "MD",
                                    "Massachusetts" = "MA",
                                    "Michigan" = "MI",
                                    "Minnesota" = "MN",
                                    "Mississippi" = "MS",
                                    "Missouri" = "MO",
                                    "Montana" = "MT",
                                    "Nebraska" = "NE",
                                    "Nevada" = "NV",
                                    "New Hampshire" = "NH",
                                    "New Jersey" = "NJ",
                                    "New Mexico" = "NM",
                                    "New York" = "NY",
                                    "North Carolina" = "NC",
                                    "North Dakota" = "ND",
                                    "Ohio" = "OH",
                                    "Oklahoma" = "OK",
                                    "Oregon" = "OR",
                                    "Pennsylvania" = "PA",
                                    "Rhode Island" = "RI",
                                    "South Carolina" = "SC",
                                    "South Dakota" = "SD",
                                    "Tennessee" = "TN",
                                    "Texas" = "TX",
                                    "Utah" = "UT",
                                    "Vermont" = "VT",
                                    "Virginia" = "VA",
                                    "Washington" = "WA",
                                    "West Virginia" = "WV",
                                    "Wisconsin" = "WI",
                                    "Wyoming" = "WY"), selected = "0"),
            
            selectInput("region","Select A US Region",
                        choices = c("ALL" = "0",
                                    "Common Wealth" = "9",
                                    "Far West" = "8",
                                    "Great Lakes" = "3",
                                    "Mideast" = "2",
                                    "New England" = "1",
                                    "Plains" = "4",
                                    "Rocky Mountains" = "7",
                                    "Southern" = "5",
                                    "Southwest" = "6"
                                    ), selected = "0"),
            sliderInput("cost" ,"Select Range of College Cost", min = 0, max = 100000, value = c(0,100000)),
            sliderInput("earn" ,"Select Range of Earning", min = 0, max = 250000, value = c(0,250000))
        ),
  dashboardBody(
    tags$style(HTML("
          .content-wrapper {
            background-color: white !important;
            height: 100%
          }
          .main-sidebar {
            background-color: 	#1e78d2 !important;
            text
          }
          .skin-blue .main-sidebar .sidebar{
          color: black
          }
         .skin-blue .main-header .logo {
                              background-color: chocolate
         }
         .skin-blue .main-header .navbar {
           background-color: 	chocolate
         }     
         .skin-blue .main-header .sidebar-toggle {
              background-color : chocolate
         }
        ")),
        tabsetPanel(
          tabPanel(h3(" Career"),
        column( width = 12,
                box(width =8, leafletOutput("distPlot")),
                box(width = 4,height = "440px",div(plotOutput("distPlot3"),style = "overflow-y: scroll; max-height: 440px;font-size: 100%; width: 100%")),
        column(width = 12,
               box(width =12,height = "440px",div(DTOutput("distPlot2"),style = "overflow-y: scroll; max-height: 440px;font-size: 100%; width: 100%"))),
        )
          ),
        tabPanel(h3("     About"),
                 includeHTML("About.html")
        )       
        )
        )
    )

# Define server logic required to draw a histogram
server <- function(input, output) {
    #Assign the US_TUITION dataset to a variable  
    pdatax <- US_TUITION 
    
    pdata <- reactive({
        #Based on selected input, filter out records until we get to max number of ranking indicated that meet all selected criterias
         pdatax <- filter(pdatax,between(COST,input$cost[1],input$cost[2]),between(MID_EARNING,input$earn[1],input$earn[2]))
        if (input$course != "0000" && input$course != "" && !is.null(input$course))
        {
            pdatax <- filter(pdatax, CIPCODE %in% input$course)
        }
        if (input$degree != "0" && input$degree != "" && !is.null(input$degree))
        {
            pdatax <- filter(pdatax, CREDLEV %in% input$degree)
        }
        if (input$state == "0" || input$state == "" || is.null(input$state))
        {   
            if(input$region != "0" && input$region != "" && !is.null(input$region))
            {
                pdatax <- filter(pdatax, REGION_CD %in% input$region)
            }
            
        } 
        else {
          #  Since a selected State might not be in a Selected Region, create two separate datasets for each and merge
            if (input$region != "0" && input$region != "" && !is.null(input$region)) 
            {
                 state <- filter(pdatax,STATE %in% input$state)
                 region <- filter(pdatax, REGION_CD %in% input$region)
                pdatax <- rbind(state,region)
            }
            else 
            {
                pdatax <- filter(pdatax, STATE %in% input$state)
            }
         }
        if ( !is_null(input$rank))
        {
            if (input$rank == "1")
            {
                pdatax <- arrange(pdatax,desc(MID_EARNING)) 
            }
            if (input$rank == "2")
            {
                pdatax <- arrange(pdatax,desc(COST)) 
            }
            if (input$rank == "0")
            {
                pdatax <- arrange(pdatax,desc(COST_TO_EARNING)) 
            } 
        }
         prev_row(NULL)
    # Extract the number of rank records desired and add an "id" column to indicat ranking
        pdatax %>%
        slice(1:input$maxrank)  %>%
          tibble::rowid_to_column("id")
        
    })
    # State boundaries from the maps package. The fill option must be TRUE.
    bounds <- maps::map('state',  fill=TRUE, plot=FALSE,col = c("red","blue","green","yellow"))
    output$distPlot <- renderLeaflet({
    #Count the number of rowns.  This is used to determine if markers are placed on the map
        count <- nrow(pdata())
    #Create a leaflert and add markers based on College location and ranking
        map <- leaflet(data = pdata()) %>%
            addProviderTiles("CartoDB.Positron", group = "Map") %>%
            addProviderTiles("Esri.WorldImagery", group = "Satellite") %>%
            addProviderTiles("Esri.WorldShadedRelief", group = "Relief") %>%
            addProviderTiles("Esri.WorldStreetMap", group = "Street") %>%
            addPolygons(data=bounds, group="States", weight=2, fillOpacity = 0) %>%
            addScaleBar(position = "bottomleft") %>%
            addLayersControl(
                baseGroups = c("Map", "Satellite", "Relief","Street"),
                overlayGroups = c( "States"),
                options = layersControlOptions(collapsed = FALSE)
            )
        #  Add markers to the leaflet map generated above
         if (count > 0) {
           map %>%
             addAwesomeMarkers(~LONGITUDE, ~LATITUDE, label = ~COLLEGE,layerId = ~id, group = "COLLEGE", icon=icon("school"), labelOptions= labelOptions(noHide =T, textOnly = TRUE,
                              style = list(
                              "color" = "black",
                              "font-family" ="serif",
                              "font-style"  = "bold",
                              "font-size" = "18px"
                              )))             
         }  
        else {
          map
        }
       
        
    })
    #Selection of Makers to highlight rows in the data table below
    prev_row <- reactiveVal()
    output$distPlot2 <-renderDT({
    pdata() %>% select(COST = COSTD, MID_EARNING = EARND, EARNING_TO_COST = COSTEARNP,COURSE,COLLEGE,CITY,STATE,ZIP,REGION,DEGREE)},selection = "single",options=list(stateSave = TRUE, lengthMenu = c(10, 15, 20),scrollY = T, scrollX = T, autowidth =TRUE))
    selectIcon = makeAwesomeIcon(icon = 'school', markerColor = 'red', iconColor = 'white')
    observeEvent(input$distPlot2_rows_selected,{
        rselect= pdata()[input$distPlot2_rows_selected,]
        smarker <- leafletProxy('distPlot')
        smarker %>%
            addAwesomeMarkers(popup=as.character(rselect$mag),
                              layerId = as.character(rselect$id),
                              lng=rselect$LONGITUDE, 
                              lat=rselect$LATITUDE,
                              icon = selectIcon)
        # Reset previously selected marker
        if(!is.null(prev_row()))
        {
            smarker %>%
                addAwesomeMarkers(popup=as.character(prev_row()$mag), 
                           layerId = as.character(prev_row()$id),
                           lng=prev_row()$LONGITUDE, 
                           lat=prev_row()$LATITUDE,
                           icon=icon("school"),
                           labelOptions= labelOptions(noHide =T, textOnly = TRUE,
                                                      style = list(
                                                          "color" = "black",
                                                          "font-family" ="serif",
                                                          "font-style"  = "bold",
                                                          "font-size" = "18px"
                                                      )
                           )
                           )
        }
        # Assign current selected row to previous
        prev_row(rselect)
    } )    
#  Check for marker being clicked on the map and highlight the appropriate row in the data column
    observeEvent(input$distPlot_marker_click, {
      clickId <- input$distPlot_marker_click$id
      dataTableProxy("distPlot2") %>%
        selectRows(which(pdata()$id == clickId)) %>%
        selectPage(which(input$distPlot2_rows_all == clickId) %/% input$distPlot2_state$length + 1)
    })
#  Generate a histogram 
    output$distPlot3 <- renderPlot({
      # Mutate the COLLEGE Column by adding the rank id.  This is very important for colleges with different courses being ranked
      pgraph<- pdata() %>% mutate(COLLEGE = paste(id," - ",COLLEGE)) %>% ggplot(aes(x=reorder(COLLEGE,desc(COST_TO_EARNING)),y=COST_TO_EARNING,fill=REGION) ) + geom_bar(stat ="identity") + geom_text(aes(label=round(COST_TO_EARNING,2)), vjust=-0.3, size=3.5) 
      # Based on the rank type selected, sort the data accordingly
      if ( !is_null(input$rank))
      {
        if (input$rank == "1")
        {
          pgraph<- pdata() %>% mutate(COLLEGE = paste(id," - ",COLLEGE)) %>% ggplot(aes(x=reorder(COLLEGE,desc(MID_EARNING)),y=MID_EARNING,fill=REGION) ) + geom_bar(stat ="identity") + geom_text(aes(label=round(MID_EARNING,2)), vjust=-0.3, size=3.5) 
              }
        if (input$rank == "2")
        {
          pgraph<- pdata() %>% mutate(COLLEGE = paste(id," - ",COLLEGE)) %>% ggplot(aes(x=reorder(COLLEGE,desc(COST)),y=COST,fill=REGION) ) + geom_bar(stat ="identity") + geom_text(aes(label=round(COST,2)), vjust=-0.3, size=3.5) 
           }
      }
     pgraph +
        theme(axis.title.x=element_blank(),
              axis.title.y=element_blank(),
              legend.position="none",
              axis.text.x = element_text(angle = -90, vjust = 0.5, hjust=0.0)
        )
    
    },width = 400, height = 500)
}

# Run the application 
shinyApp(ui = ui, server = server)
