import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FoodRestComponent } from './food-rest.component';

describe('FoodRestComponent', () => {
  let component: FoodRestComponent;
  let fixture: ComponentFixture<FoodRestComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FoodRestComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(FoodRestComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
