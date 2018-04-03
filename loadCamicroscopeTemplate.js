print("-- start script here --");
use caMicroscope_Templates;

db.AnnotationTemplate.remove({});

db.AnnotationTemplate.insert(   
    {       
        "region": {
            "enum": [
                "Good Segmentation",
                "Clump"
            ],
            "title": "Region:",
            "type": "string"
        },
        "additional_annotation": {
            "title": "Additional annotation for the region: ",
            "type": "textarea"
        },
        "additional_notes": {
            "title": "Additional notes: ",
            "type": "textarea"
        },
        "secret": {
            "title": "Secret: ",
            "type": "password"
        },
        "name":"segment_curation"
    }
);

db.AnnotationTemplate.insert(   
    {       
        "region": {
            "enum": [                
				"Tumor",
				"Non_Tumor"
            ],
            "title": "Region:",
            "type": "string"
        },
        "additional_annotation": {
            "title": "Additional annotation for the region: ",
            "type": "textarea"
        },
        "additional_notes": {
            "title": "Additional notes: ",
            "type": "textarea"
        },
        "secret": {
            "title": "Secret: ",
            "type": "password"
        },
        "name":"tumor_markup"
    }
);

print("-- end of  script  --");
