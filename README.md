# Repository Purpose and Outline
In this reportsitory, I hope to solve a basic problem facing job applicants accross the globe. That is, you want a nice looking resume for sharing your resume as a .pdf and for facing the application tracking systems, reffered to commonly as the "ATS." You either create one resume which does not satisfy the needs of both the eye test and ATS test or you spend time tailoring two resumes. Niether case is ideal. 

In this repository, I create a way to make both resumes with one document. How?

# Process
On the one hand, we have ```desc.tex``` which hold the descriptions which will be presenet in my resume. These descriptions get rendered within ```atsGen.tex``` and ```resume.tex```. Running ```atsGen.tex```, we creathe resume for the ATS. Running ```resume.tex```, we generate the reume to email. This way, we can adjust the role descriptions and this will change two separate resumes. 

There is another layer of abstraction here, regarding the makefile. As an applicant, you are not limitted to one company but you have to apply to many. Running ```make```, you are prompted to type in the directory name. This would correspond to the role for which you are applying. When you change directory into your new directory, you can re-render the two resumes by running ```chmod +x ./bash && ./bash.sh```. 

# Conclusion
There are many useful concepts in this repoitory. One of my favorite is the implementation of makefiles. These often implemented in data engineering, when creating pipelines, and in software engineering in general when creating repeated software. Rarely, however, are they implemented outside of this context. Yet this kind of thinking I think applies quite sensibly to crafting boiler plate and custom resumes. 
