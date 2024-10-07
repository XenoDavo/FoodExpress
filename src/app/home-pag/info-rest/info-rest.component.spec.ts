import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InfoRestComponent } from './info-rest.component';

describe('InfoRestComponent', () => {
  let component: InfoRestComponent;
  let fixture: ComponentFixture<InfoRestComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ InfoRestComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(InfoRestComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
