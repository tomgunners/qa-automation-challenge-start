*** Variables ***
${LBL_PLANT_LIST_TITLE}     xpath=//android.widget.TextView[@text="PLANT LIST"]
${LIST_PLANTS}              id=com.google.samples.apps.sunflower:id/plant_list
${FIRST_PLANT_ITEM}         xpath=//*[@resource-id="com.google.samples.apps.sunflower:id/plant_list"]//*[@clickable="true"]
${FIRST_PLANT_NAME}         xpath=//android.widget.TextView[@resource-id="com.google.samples.apps.sunflower:id/plant_item_title" and @text="Apple"]
